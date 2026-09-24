CALL dbms.graph.createGraph('movie', 'yago-style movie graph for lab 1', 1);

CALL db.createVertexLabel('person', 'id', 'id', 'int32', false, 'name', 'string', false, 'born', 'int32', true);
CALL db.createVertexLabel('movie', 'id', 'id', 'int32', false, 'title', 'string', false, 'tagline', 'string', true);
CALL db.createVertexLabel('genre', 'id', 'id', 'int32', false, 'name', 'string', false);
CALL db.createVertexLabel('user', 'id', 'id', 'int32', false, 'name', 'string', false);

CALL db.createEdgeLabel('produce', '[["person","movie"]]');
CALL db.createEdgeLabel('direct', '[["person","movie"]]');
CALL db.createEdgeLabel('acted_in', '[["person","movie"]]', 'role', 'string', true);
CALL db.createEdgeLabel('has_genre', '[["movie","genre"]]');
CALL db.createEdgeLabel('rate', '[["user","movie"]]', 'score', 'double', false);
