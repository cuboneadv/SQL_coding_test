WITH CTE1 AS (
    SELECT DISTINCT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
)

SELECT name
FROM Employee
WHERE id IN (SELECT managerId FROM CTE1);
