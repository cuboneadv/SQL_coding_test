/*
LeetCode: 1075. Project Employees I
Goal:
- Report the average experience years of all employees for each project, rounded to 2 decimal places.

Tables:
- Project(project_id PK, employee_id PK)
- Employee(employee_id PK, name, experience_years)

Notes:
- experience_years is guaranteed to be NOT NULL.
- This file contains my original solution.
*/

-- ------------------------------------------------------------
SELECT 
    project_id,
    ROUND(AVG(experience_years), 2) AS average_years
FROM Project P
JOIN Employee E USING (employee_id)
GROUP BY project_id;