# HR_GRADE 테이블은 2022년 사원의 평가 정보를 담은 테이블이므로, WHERE YEAR = 2022 조건이 없어도 동일한 결과를 출력함

# LIMIT를 이용한 풀이
# 점수가 가장 높은 사원이 여러 명일 경우, 정확한 결과를 출력하지 않음(해당 사원들 중 한 명의 결과만 출력함)
-- SELECT SUM(SCORE) SCORE, EMP_NO, EMP_NAME, POSITION, EMAIL
-- FROM HR_GRADE G JOIN HR_EMPLOYEES USING(EMP_NO)
-- -- WHERE YEAR = 2022
-- GROUP BY EMP_NO
-- ORDER BY SCORE DESC
-- LIMIT 1;

# SUBQUERY를 이용한 풀이
# 점수가 가장 높은 사원이 여러 명일 경우, 정확한 결과를 출력함
-- WITH HR_SCORE AS (
--     SELECT EMP_NO, SUM(SCORE) SCORE
--     FROM HR_GRADE
--     GROUP BY EMP_NO
-- )

-- SELECT SUM(SCORE) SCORE, EMP_NO, EMP_NAME, POSITION, EMAIL
-- FROM HR_GRADE G JOIN HR_EMPLOYEES USING(EMP_NO)
-- -- WHERE YEAR = 2022
-- GROUP BY EMP_NO
-- HAVING SCORE = (
--     SELECT MAX(SCORE)
--     FROM HR_SCORE
--     );

# RANK를 이용한 풀이
# 점수가 가장 높은 사원이 여러 명일 경우, 정확한 결과를 출력함
# ROW_NUMBER는 동일한 값에 대해 다른 순위를 부여하므로, 정확한 결과를 출력하지 않음
# (ROW_NUMBER을 사용할 경우, 점수가 가장 높은 사원이 여러 명인 경우에도 순위를 다르게 부여함)
WITH HR_RANK AS (
    SELECT 
        EMP_NO,
        SUM(SCORE) AS SCORE,
        RANK() OVER(ORDER BY SUM(SCORE) DESC) AS EMP_RANK
    FROM HR_GRADE
    # WHERE YEAR = 2022
    GROUP BY EMP_NO
)

SELECT SCORE, EMP_NO, EMP_NAME, POSITION, EMAIL
FROM HR_EMPLOYEES E JOIN HR_RANK R USING(EMP_NO)
WHERE EMP_RANK = 1;