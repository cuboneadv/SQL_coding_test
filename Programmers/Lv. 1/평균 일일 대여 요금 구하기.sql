# 처음 푼 코드
-- SELECT ROUND(AVG(DAILY_FEE)) AVERAGE_FEE
-- FROM CAR_RENTAL_COMPANY_CAR
-- WHERE CAR_TYPE = 'SUV'
-- GROUP BY CAR_TYPE;

# GROUP BY로 묶지 않아도 결과 똑같이 나옴
# AVG나 SUM은 COUNT와 다르게 GROUP BY를 사용하지 않아도 사용할 수 있음에 주의
# 기본적인 내용이나 GROUP BY를 자주 사용하다보면 헷갈리므로 인지
# 소수 첫 번째 자리에서 반올림한다면 ROUND(X, 0)으로 사용해도 되지만,
# 반올림할 자리 미지정 시, 소수 첫 번째 자리에서 반올림하므로 ROUND(X)로 사용해도 됨

# 수정한 코드
SELECT ROUND(AVG(DAILY_FEE)) AVERAGE_FEE
FROM CAR_RENTAL_COMPANY_CAR
WHERE CAR_TYPE = 'SUV';