# UNION을 이용한 (비효율적인) 풀이
-- SELECT '0' PRICE_GROUP, COUNT(*)
-- FROM PRODUCT
-- WHERE PRICE<10000
-- GROUP BY '0'

-- UNION ALL

-- SELECT '10000' PRICE_GROUP, COUNT(*)
-- FROM PRODUCT
-- WHERE PRICE>=10000 AND PRICE<20000
-- GROUP BY '10000'

-- UNION ALL

-- SELECT '20000' PRICE_GROUP, COUNT(*)
-- FROM PRODUCT
-- WHERE PRICE>=20000 AND PRICE<30000
-- GROUP BY '20000'

-- UNION ALL

-- SELECT '30000' PRICE_GROUP, COUNT(*)
-- FROM PRODUCT
-- WHERE PRICE>=30000 AND PRICE<40000
-- GROUP BY '30000'
-- ...

# TRUNCATE(버림 함수)를 이용한 풀이
# -4(넷째 자리)까지 TRUNCATE를 이용하여 버림할 때, 수가 300 혹은 9000과 같이 작은 수라면 0으로 표기됨
# TRUNCATE에 1, 2 등의 양수를 지정하면 소수점 1, 2자리에서 버린다는 의미이고,
# TRUNCATE에 -1, -2 등의 음수를 지정하면 정수 1, 2자리에서 버린다는 의미이다.
-- SELECT TRUNCATE(PRICE, -4) PRICE_GROUP, COUNT(*) PRODUCTS
-- FROM PRODUCT
-- GROUP BY PRICE_GROUP
-- ORDER BY PRICE_GROUP;

# 일반적인 풀이
SELECT (PRICE - PRICE % 10000) PRICE_GROUP, COUNT(*) PRODUCTS
FROM PRODUCT
GROUP BY PRICE_GROUP
ORDER BY PRICE;