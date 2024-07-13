# 상품을 구매한 회원의 비율(PURCHASED_RATIO)이란?

# (분자)2021년에 가입했고, 상품을 구매한 이력이 있는 회원의 수,
# 즉 USER_INFO 테이블에서 JOINED 날짜가 2021년인 데이터 중
# ONLINE_SALE 테이블에서 거래 내역이 있는 데이터 중
# DISTINCT를 통해 중복된 USER_ID가 없는 개수를 세면 됨

# (분모)2021년에 가입한 전체 회원의 수,
# 즉 USER_INFO 테이블에서 JOINED 날짜가 2021년인 데이터 중
# DISTINCT를 통해 중복된 USER_ID가 없는 개수를 세면 됨

# 출력하려는 날짜 데이터(YEAR, MONTH)는 판매일이므로
# 2021년이 아닐 수도 있음에 유의

SELECT YEAR(SALES_DATE) AS YEAR,
      MONTH(SALES_DATE) AS MONTH,
      COUNT(DISTINCT USER_ID) AS PURCHASED_USERS,
      ROUND(
        COUNT(DISTINCT USER_ID) /
        (
          SELECT COUNT(DISTINCT USER_ID)
          FROM USER_INFO
          WHERE YEAR(JOINED) = 2021
        ),
        1
      ) AS PURCHASED_RATIO
FROM ONLINE_SALE
JOIN USER_INFO USING (USER_ID)
WHERE YEAR(JOINED) = 2021
GROUP BY YEAR(SALES_DATE), MONTH(SALES_DATE)
ORDER BY YEAR(SALES_DATE), MONTH(SALES_DATE)
