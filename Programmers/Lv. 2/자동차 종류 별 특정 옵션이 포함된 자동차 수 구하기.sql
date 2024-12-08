# REGEXP를 이용한 풀이
# REGEXP ('A|B|C')를 사용하면 LIKE를 사용할 때보다 단축하여 표현 
-- SELECT CAR_TYPE, COUNT(*) CARS
-- FROM CAR_RENTAL_COMPANY_CAR
-- WHERE OPTIONS REGEXP ('통풍시트|열선시트|가죽시트')
-- GROUP BY CAR_TYPE
-- ORDER BY CAR_TYPE;

# LIKE를 이용한 풀이
# LIKE를 이용할 때는 OR을 통해 병렬로 모두 연결해주어야 함
# OPTIONS LIKE ('%통풍시트%' OR '%열선시트%') 혹은
# OPTIONS LIKE ('%통풍시트%') OR ('%열선시트%')와 같이 쓰지 않도록 주의
# 무조건 OPTIONS LIKE ('%통풍시트%') OR OPTIONS LIKE ('%열선시트%')와 같이 병렬 형태로 작성
SELECT CAR_TYPE, COUNT(*) CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%통풍시트%' OR OPTIONS LIKE '%열선시트%' OR OPTIONS LIKE '%가죽시트%'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE;