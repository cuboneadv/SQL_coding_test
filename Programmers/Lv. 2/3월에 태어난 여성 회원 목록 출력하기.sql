# DATE_FORMAT 이용한 풀이
# y, m, d를 쓸 때 대문자로 사용할 때와 소문자로 사용할 때의 출력값이 달라짐에 주의
# %y와 %m 사이의 '-'는 사용자 임의대로 변경 가능함
# 예를 들어 1992--03--29로 나타내고 싶다면 '%Y--%m--%d'
SELECT MEMBER_ID, MEMBER_NAME, GENDER, DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d')
FROM MEMBER_PROFILE
WHERE TLNO IS NOT NULL 
AND MONTH(DATE_OF_BIRTH) = 3
AND GENDER = 'W'
ORDER BY MEMBER_ID;