
WITH MISCALC AS (
    SELECT 
        ID, 
        Name, 
        REPLACE(Salary, 0, '') AS Salary
    FROM 
        EMPLOYEES
)

SELECT 
    CEIL(
        (
            SELECT AVG(Salary) 
            FROM EMPLOYEES
        ) - 
        (
            SELECT AVG(Salary) 
            FROM MISCALC
        )
    ) AS error_amount;
