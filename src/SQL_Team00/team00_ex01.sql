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
      arr[1] = 'a' AND (
      cost = (SELECT MIN(cost) FROM ways WHERE array_length(arr, 1) = 5 AND arr[1] = 'a') OR
      cost = (SELECT MAX(cost) FROM ways WHERE array_length(arr, 1) = 5 AND arr[1] = 'a')
       )
ORDER BY 1, 2;