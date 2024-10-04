# 보호 시작일과 입양일까지의 기간을 기준으로 정렬하려면 DATEDIFF 함수 이용하여 계산하기
# 단, 본 예제에서는 입양을 못 간 동물은 입양일이 NULL이므로 DATEDIFF 함수를 이용하여
# 보호 시작일과 입양일까지의 기간을 기준으로 정렬한다면 정확한 값을 얻을 수 없음
# ORDER BY DATEDIFF('O.DATETIME', 'I.DATETIME') DESC

SELECT I.NAME, I.DATETIME
FROM ANIMAL_INS I LEFT JOIN ANIMAL_OUTS O USING(ANIMAL_ID)
WHERE O.DATETIME IS NULL
ORDER BY I.DATETIME
LIMIT 3;