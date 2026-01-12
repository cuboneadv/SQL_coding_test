/*
LeetCode: 1327. List the Products Ordered in a Period
Goal:
- Get the names of products that have at least 100 units ordered in February 2020 and their total amount.

Tables:
- Products(product_id PK, product_name, product_category)
- Orders(product_id FK, order_date, unit)

Notes:
- Orders table may contain duplicate rows.
- This file contains my solution using DATE_FORMAT for year-month filtering.
*/

-- ------------------------------------------------------------
WITH filtered_orders AS (
    SELECT 
        product_id,
        SUM(unit) AS unit
    FROM Orders
    WHERE DATE_FORMAT(order_date, '%Y-%m') = '2020-02'
    GROUP BY product_id
    HAVING SUM(unit) >= 100
)

SELECT 
    p.product_name,
    o.unit
FROM filtered_orders o
JOIN Products p USING (product_id);