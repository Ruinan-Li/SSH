CREATE (n:person {id:99, name:'Lab Temp', born:2000});

MATCH (n:person {id:99}) RETURN n.id AS id, n.name AS name, n.born AS born;

MATCH (n:person {id:99}) SET n.born = 2001 RETURN n.id AS id, n.name AS name, n.born AS born;

MATCH (n:person {id:99}) DELETE n;

MATCH (n:person {id:99}) RETURN n.id AS id, n.name AS name;
