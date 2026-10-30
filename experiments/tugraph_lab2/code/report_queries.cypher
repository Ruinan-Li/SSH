// 图查询实验：计数、聚合、两跳连接及属性操作。
// 需要已建好的 email_eu_lab2_20261030 子图及 Person/EMAIL 模型。
MATCH (n:Person) RETURN count(n) AS persons;
MATCH (:Person)-[r:EMAIL]->(:Person) RETURN count(r) AS emails;
MATCH (n:Person)
RETURN n.department AS department, count(n) AS persons
ORDER BY persons DESC;

MATCH (p:Person)-[:EMAIL]->(q:Person)
RETURN p.person_id AS person_id, p.department AS department,
       count(q) AS degree
ORDER BY degree DESC, person_id LIMIT 10;

MATCH (p:Person)-[:EMAIL]->(q:Person)
WHERE p.department <> q.department
RETURN count(*) AS cross_department_edges;

MATCH (p:Person {person_id:0})-[:EMAIL]->(q:Person)-[:EMAIL]->(r:Person)
WHERE p.person_id <> r.person_id
RETURN r.person_id AS person_id, count(DISTINCT q) AS intermediaries
ORDER BY intermediaries DESC, person_id LIMIT 10;

// 属性操作：在专用实验子图中验证SET与REMOVE。
MATCH (p:Person {person_id:0})
SET p.note='Lab 2 verification' RETURN p.person_id,p.note;
MATCH (p:Person {person_id:0})
REMOVE p.note RETURN p.person_id,p.note;

// CRUD验证在独立子图中使用以下语句。
// 为避免误删主图，保留为注释；它们不应在主分析图执行。
// MATCH (a)-[r:EMAIL]->(b) DELETE r;
// MATCH (n) DELETE n;
