# JOIN을 이용한 방법
-- SELECT DISTINCT CART_ID
-- FROM
--     (SELECT CART_ID, NAME
--      FROM CART_PRODUCTS 
--      WHERE NAME IN ('Yogurt')) A
-- JOIN
--     (SELECT CART_ID, NAME
--      FROM CART_PRODUCTS 
--      WHERE NAME IN ('Milk')) B
-- USING(CART_ID)
-- ORDER BY CART_ID;

# SELF JOIN을 이용한 방법
-- SELECT DISTINCT A.CART_ID AS CART_ID
-- FROM CART_PRODUCTS A
-- JOIN CART_PRODUCTS B ON A.CART_ID = B.CART_ID
-- WHERE A.NAME = 'Milk' AND B.NAME = 'Yogurt'
-- ORDER BY CART_ID;

# HAVING 및 DISTINCT를 이용한 방법
SELECT CART_ID
FROM CART_PRODUCTS
WHERE NAME IN ('Milk', 'Yogurt')
GROUP BY CART_ID
HAVING COUNT(DISTINCT NAME) >= 2
ORDER BY CART_ID;