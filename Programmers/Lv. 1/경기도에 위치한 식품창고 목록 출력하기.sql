# 첫 번째 풀이(CASE 이용한 풀이)
-- SELECT 
--     WAREHOUSE_ID, 
--     WAREHOUSE_NAME, 
--     ADDRESS,
--     CASE
--         WHEN FREEZER_YN IS NULL THEN 'N'
--         WHEN FREEZER_YN = 'Y' THEN 'Y'
--         WHEN FREEZER_YN = 'N' THEN 'N'
--     END AS FREEZER_YN
-- FROM 
--     FOOD_WAREHOUSE
-- WHERE 
--     ADDRESS LIKE '%경기도%'
-- ORDER BY 
--     WAREHOUSE_ID;

# 두 번째 풀이(CASE 이용한 풀이)
-- SELECT 
--     WAREHOUSE_ID, 
--     WAREHOUSE_NAME, 
--     ADDRESS,
--     CASE
--         WHEN FREEZER_YN IS NULL THEN 'N'
--         ELSE FREEZER_YN
--     END AS FREEZER_YN
-- FROM 
--     FOOD_WAREHOUSE
-- WHERE 
--     ADDRESS LIKE '%경기도%'
-- ORDER BY 
--     WAREHOUSE_ID;

# 세 번째 풀이(COALESCE 이용한 풀이)
-- SELECT 
--     WAREHOUSE_ID, 
--     WAREHOUSE_NAME, 
--     ADDRESS, 
--     COALESCE(FREEZER_YN, 'N') AS FREEZER_YN
-- FROM 
--     FOOD_WAREHOUSE
-- WHERE 
--     ADDRESS LIKE '%경기도%'
-- ORDER BY 
--     WAREHOUSE_ID;

# 네 번째 풀이(IFNULL 이용한 풀이)
SELECT 
    WAREHOUSE_ID, 
    WAREHOUSE_NAME, 
    ADDRESS, 
    IFNULL(FREEZER_YN, 'N') AS FREEZER_YN
FROM 
    FOOD_WAREHOUSE
WHERE 
    ADDRESS LIKE '%경기도%'
ORDER BY 
    WAREHOUSE_ID;