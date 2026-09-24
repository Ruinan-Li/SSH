MATCH (d:person)-[:direct]->(m:movie)
WITH d, count(m) AS movieCount
WHERE movieCount >= 2
MATCH (d)-[:direct]->(m2:movie)<-[r:rate]-(:user)
WITH d.name AS director, movieCount, avg(r.score) AS avgScore
RETURN director, movieCount, avgScore
ORDER BY avgScore DESC;
