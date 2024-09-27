# 특정 문자열 추출에 SUBSTR 사용
# SUBSTR(문자열, 시작위치, 길이)
# 문자열 중간에 띄어쓰기 있을 경우, 띄어쓰기도 문자로 인식
# SUBSTR의 길이가 0이나 음수일 경우, 빈 문자열 반환
SELECT SUBSTR(PRODUCT_CODE, 1, 2) CATEGORY, COUNT(DISTINCT PRODUCT_ID) PRODUCTS
FROM PRODUCT
GROUP BY CATEGORY;