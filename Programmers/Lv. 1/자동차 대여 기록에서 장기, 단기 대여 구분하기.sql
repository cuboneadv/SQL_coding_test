# CASE 문으로 새로운 컬럼 추가할 수 있음
# 날짜를 계산하는 DATEDIFF 함수를 이용할 때 DATEDIFF는 두 날짜의 차이를 출력한다는 점에 주의
# 예를 들어, SELECT DATEDIFF('2022-09-30', '2022-09-01')의 결과는 '30'이 아닌 '29'임
# 즉, 문제의 예시와 같이 대여 기간을 구할 때에는 DATEDIFF로 계산한 결과에 반드시 1을 더해줘야 함
SELECT 
    HISTORY_ID, 
    CAR_ID, 
    DATE_FORMAT(START_DATE, '%Y-%m-%d') START_DATE, 
    DATE_FORMAT(END_DATE,'%Y-%m-%d') END_DATE,
    CASE
        WHEN DATEDIFF(END_DATE, START_DATE) + 1 >= 30 THEN '장기 대여'
        ELSE '단기 대여'
        END RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE YEAR(START_DATE) = 2022 AND MONTH(START_DATE) = 9
ORDER BY HISTORY_ID DESC;