SELECT
  N,
  CASE
    WHEN P IS NULL THEN 'Root'
    WHEN N NOT IN (
        SELECT DISTINCT P
        FROM BST
        WHERE P IS NOT NULL
    ) THEN 'Leaf'
    ELSE 'Inner'
  END AS OUTPUT
FROM BST
ORDER BY N;