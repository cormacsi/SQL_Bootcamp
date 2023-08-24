DROP TABLE IF EXISTS nodes CASCADE;

CREATE TABLE IF NOT EXISTS nodes (
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INTEGER NOT NULL,
    CONSTRAINT uk_nodes UNIQUE (point1, point2, cost)
);

INSERT INTO nodes (point1, point2, cost) VALUES ('a', 'b', 10);
INSERT INTO nodes (point1, point2, cost) VALUES ('b', 'a', 10);

INSERT INTO nodes (point1, point2, cost) VALUES ('b', 'c', 35);
INSERT INTO nodes (point1, point2, cost) VALUES ('c', 'b', 35);

INSERT INTO nodes (point1, point2, cost) VALUES ('c', 'a', 15);
INSERT INTO nodes (point1, point2, cost) VALUES ('a', 'c', 15);

INSERT INTO nodes (point1, point2, cost) VALUES ('b', 'd', 25);
INSERT INTO nodes (point1, point2, cost) VALUES ('d', 'b', 25);

INSERT INTO nodes (point1, point2, cost) VALUES ('c', 'd', 30);
INSERT INTO nodes (point1, point2, cost) VALUES ('d', 'c', 30);

INSERT INTO nodes (point1, point2, cost) VALUES ('a', 'd', 20);
INSERT INTO nodes (point1, point2, cost) VALUES ('d', 'a', 20);

WITH RECURSIVE ways AS (
    SELECT DISTINCT ARRAY[point1, point2] as arr, cost
    FROM nodes
    UNION ALL
    SELECT DISTINCT w.arr || nodes.point2, w.cost + nodes.cost
    FROM nodes
    JOIN ways w on w.arr[array_length(w.arr, 1)] = nodes.point1
    WHERE (array_length(w.arr, 1) < 4 AND NOT (nodes.point2 = ANY(w.arr))) OR
          (array_length(w.arr, 1) = 4 AND nodes.point2 = w.arr[1])
)
SELECT cost AS total_cost, arr AS tour
FROM ways
WHERE array_length(arr, 1) = 5 AND
      arr[1] = 'a' AND
      cost = (SELECT MIN(cost) FROM ways WHERE array_length(arr, 1) = 5 AND arr[1] = 'a')
ORDER BY 1, 2;