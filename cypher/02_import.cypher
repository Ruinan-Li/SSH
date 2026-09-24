CREATE (n:person {id:1, name:'James Wan', born:1977});
CREATE (n:person {id:2, name:'Peter Jackson', born:1961});
CREATE (n:person {id:3, name:'Christopher Nolan', born:1970});
CREATE (n:person {id:4, name:'Greta Gerwig', born:1983});
CREATE (n:person {id:5, name:'Zhang Yimou', born:1951});
CREATE (n:person {id:6, name:'Keanu Reeves', born:1964});

CREATE (n:movie {id:101, title:'The Conjuring', tagline:'Based on the true case files of the Warrens'});
CREATE (n:movie {id:102, title:'Fast and Furious 7', tagline:'One last ride'});
CREATE (n:movie {id:103, title:'The Fellowship of the Ring', tagline:'A meek Hobbit from the Shire'});
CREATE (n:movie {id:104, title:'The Return of the King', tagline:'There can be no triumph without loss'});
CREATE (n:movie {id:105, title:'Inception', tagline:'Your mind is the scene of the crime'});
CREATE (n:movie {id:106, title:'Oppenheimer', tagline:'The world forever changes'});
CREATE (n:movie {id:107, title:'Barbie', tagline:'She is everything'});
CREATE (n:movie {id:108, title:'Hero', tagline:'One man strength'});

CREATE (n:genre {id:1, name:'Horror'});
CREATE (n:genre {id:2, name:'Action'});
CREATE (n:genre {id:3, name:'Fantasy'});
CREATE (n:genre {id:4, name:'Sci-Fi'});
CREATE (n:genre {id:5, name:'Drama'});

CREATE (n:user {id:1, name:'Alice'});
CREATE (n:user {id:2, name:'Bob'});
CREATE (n:user {id:3, name:'Carol'});

MATCH (p:person {id:1}), (m:movie {id:101}) CREATE (p)-[:direct]->(m);
MATCH (p:person {id:1}), (m:movie {id:102}) CREATE (p)-[:produce]->(m);
MATCH (p:person {id:2}), (m:movie {id:103}) CREATE (p)-[:direct]->(m);
MATCH (p:person {id:2}), (m:movie {id:104}) CREATE (p)-[:direct]->(m);
MATCH (p:person {id:3}), (m:movie {id:105}) CREATE (p)-[:direct]->(m);
MATCH (p:person {id:3}), (m:movie {id:106}) CREATE (p)-[:direct]->(m);
MATCH (p:person {id:4}), (m:movie {id:107}) CREATE (p)-[:direct]->(m);
MATCH (p:person {id:5}), (m:movie {id:108}) CREATE (p)-[:direct]->(m);

MATCH (p:person {id:6}), (m:movie {id:105}) CREATE (p)-[:acted_in {role:'Dom Cobb stand-in extra'}]->(m);

MATCH (m:movie {id:101}), (g:genre {id:1}) CREATE (m)-[:has_genre]->(g);
MATCH (m:movie {id:102}), (g:genre {id:2}) CREATE (m)-[:has_genre]->(g);
MATCH (m:movie {id:103}), (g:genre {id:3}) CREATE (m)-[:has_genre]->(g);
MATCH (m:movie {id:104}), (g:genre {id:3}) CREATE (m)-[:has_genre]->(g);
MATCH (m:movie {id:105}), (g:genre {id:4}) CREATE (m)-[:has_genre]->(g);
MATCH (m:movie {id:106}), (g:genre {id:5}) CREATE (m)-[:has_genre]->(g);
MATCH (m:movie {id:107}), (g:genre {id:5}) CREATE (m)-[:has_genre]->(g);
MATCH (m:movie {id:108}), (g:genre {id:2}) CREATE (m)-[:has_genre]->(g);

MATCH (u:user {id:1}), (m:movie {id:103}) CREATE (u)-[:rate {score:9.0}]->(m);
MATCH (u:user {id:2}), (m:movie {id:103}) CREATE (u)-[:rate {score:8.0}]->(m);
MATCH (u:user {id:1}), (m:movie {id:104}) CREATE (u)-[:rate {score:10.0}]->(m);
MATCH (u:user {id:3}), (m:movie {id:104}) CREATE (u)-[:rate {score:9.0}]->(m);
MATCH (u:user {id:1}), (m:movie {id:105}) CREATE (u)-[:rate {score:9.0}]->(m);
MATCH (u:user {id:2}), (m:movie {id:105}) CREATE (u)-[:rate {score:8.0}]->(m);
MATCH (u:user {id:3}), (m:movie {id:105}) CREATE (u)-[:rate {score:7.0}]->(m);
MATCH (u:user {id:2}), (m:movie {id:106}) CREATE (u)-[:rate {score:8.0}]->(m);
MATCH (u:user {id:3}), (m:movie {id:106}) CREATE (u)-[:rate {score:9.0}]->(m);
MATCH (u:user {id:1}), (m:movie {id:101}) CREATE (u)-[:rate {score:7.0}]->(m);
