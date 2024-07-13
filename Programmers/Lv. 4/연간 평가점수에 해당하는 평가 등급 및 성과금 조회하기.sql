# '연간 평가점수'에 대한 설명이 부족한 문제
# '연간 평가점수'가 사원별 동일한 연도의 반기 평가 점수의 평균인지, 한 반기만 기준 점수를 충족해도 되는지 등 구체적인 조건이 명시되어 있지 않음

# 해당 풀이에서는 '연간 평가점수'를 사원별 동일한 연도의 반기 평가 점수의 평균으로 가정하고 풀이함

# '연간 평가점수' 기준이 변경될 것을 고려하여 WITH문을 이용하였음
WITH HR_SCORE AS (
  SELECT EMP_NO, AVG(SCORE) AS AVG_SCORE
  FROM HR_GRADE G
  GROUP BY EMP_NO
)

# 기준 점수에 따른 두 개의 CASE문을 이용하였음
# 두 번째 CASE문(BONUS)에서 GRADE를 조건으로 사용하지 않도록 주의
# 예) WHEN GRADE = 'S' THEN SAL * 0.20 (X)
SELECT
  EMP_NO,
  EMP_NAME,
  CASE
    WHEN AVG_SCORE >= 96 THEN 'S'
    WHEN AVG_SCORE >= 90 THEN 'A'
    WHEN AVG_SCORE >= 80 THEN 'B'
    ELSE 'C'
  END AS GRADE,
  CASE
    WHEN AVG_SCORE >= 96 THEN SAL * 0.20
    WHEN AVG_SCORE >= 90 THEN SAL * 0.15
    WHEN AVG_SCORE >= 80 THEN SAL * 0.10
    ELSE 0
  END AS BONUS
FROM HR_SCORE S
JOIN HR_EMPLOYEES E USING (EMP_NO)
ORDER BY EMP_NO