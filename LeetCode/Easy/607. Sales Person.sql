/*
LeetCode: 607. Sales Person
Goal:
- Find names of all salespersons who did NOT have any orders related to the company named 'RED'.

Tables:
- SalesPerson(sales_id PK, name, salary, commission_rate, hire_date)
- Company(com_id PK, name, city)
- Orders(order_id PK, order_date, com_id FK, sales_id FK, amount)

Notes:
- This file contains my original solution and an alternative NULL-safe solution.
*/

-- ------------------------------------------------------------
SELECT name
FROM SalesPerson
WHERE name NOT IN (
    SELECT DISTINCT S.name
    FROM SalesPerson S JOIN Orders O USING(sales_id) JOIN Company C USING(com_id)
    WHERE C.name = 'RED'
)