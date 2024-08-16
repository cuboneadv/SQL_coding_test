# WHERE에서 세 개 이상의 조건을 비교하고자 할 때, 두 조건씩 차례로 비교해야 함
# WHERE A.num = B.num = C.num (X)
# WHERE A.num = B.num AND B.num = C.num (O) 
SELECT DISTINCT(A.num) ConsecutiveNums
FROM Logs A
JOIN Logs B ON A.id + 1 = B.id
JOIN Logs C ON B.id + 1 = C.id
WHERE A.num = B.num
AND B.num = C.num
ORDER BY ConsecutiveNums;