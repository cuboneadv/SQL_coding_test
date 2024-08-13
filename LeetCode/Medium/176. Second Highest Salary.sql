# LIMIT, OFFSET을 이용한 풀이
-- SELECT (
-- 	SELECT DISTINCT Salary AS SecondHighestSalary
-- 	FROM Employee
-- 	ORDER BY Salary DESC
-- 	LIMIT 1 OFFSET 1
-- ) AS SecondHighestSalary;

# 스칼라 SUBQUERY를 이용한 풀이
SELECT MAX(salary) SecondHighestSalary
FROM Employee
WHERE salary < (
	SELECT MAX(salary)
  FROM Employee
  );
