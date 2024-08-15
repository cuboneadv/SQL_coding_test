# rank라는 컬럼 이름은 MySQL에서 예약어임
# 따라서, 해당 이름을 백틱(```)으로 감싸서 사용해야 함
SELECT score, DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores;