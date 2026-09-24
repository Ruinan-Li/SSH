#!/usr/bin/env python3
"""Run the TuGraph lab statements over Bolt and print each result."""

import os
import sys
from pathlib import Path

from neo4j import GraphDatabase

ROOT = Path(__file__).resolve().parents[1]
URI = os.environ.get("TUGRAPH_URI", "bolt://127.0.0.1:7687")
USER = os.environ.get("TUGRAPH_USER", "admin")
PASSWORD = os.environ.get("TUGRAPH_PASSWORD", "73@TuGraph")
GRAPH = os.environ.get("TUGRAPH_GRAPH", "movie")


def statements(path: Path):
    text = path.read_text(encoding="utf-8")
    for raw in text.split(";"):
        lines = []
        for line in raw.splitlines():
            if line.strip().startswith("//"):
                continue
            lines.append(line)
        stmt = "\n".join(lines).strip()
        if stmt:
            yield stmt


def run_file(session, path: Path):
    print(f"\n===== {path.name} =====")
    for stmt in statements(path):
        print("\n--", " ".join(stmt.split()))
        result = session.run(stmt)
        rows = [record.data() for record in result]
        if rows:
            for row in rows:
                print(row)
        else:
            print("(ok, no rows)")


def main():
    driver = GraphDatabase.driver(URI, auth=(USER, PASSWORD))
    driver.verify_connectivity()
    cypher = ROOT / "cypher"
    files = [
        cypher / "01_schema.cypher",
        cypher / "02_import.cypher",
        cypher / "03_crud.cypher",
        cypher / "04_aggregation.cypher",
    ]
    try:
        with driver.session(database=GRAPH) as session:
            # createGraph must run on the default graph, before the movie graph exists.
            first = statements(files[0])
            create_graph = next(first)
            print(f"\n===== {files[0].name} (on default) =====")
            print("\n--", " ".join(create_graph.split()))
            with driver.session(database="default") as setup:
                try:
                    rows = [r.data() for r in setup.run(create_graph)]
                    print(rows or "(ok, no rows)")
                except Exception as exc:
                    message = str(exc)
                    if "already exist" in message.lower() or "already exists" in message.lower():
                        print("graph already exists, continue")
                    else:
                        raise
            for stmt in first:
                print("\n--", " ".join(stmt.split()))
                rows = [r.data() for r in session.run(stmt)]
                print(rows or "(ok, no rows)")
            for path in files[1:]:
                run_file(session, path)
    finally:
        driver.close()


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        sys.exit(1)
