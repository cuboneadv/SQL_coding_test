SELECT
  CASE
    # 삼각형이 만들어지지 않는 경우
    WHEN A + B <= C OR B + C <= A OR C + A <= B THEN 'Not A Triangle'
		
    # 정삼각형인 경우
    WHEN A = B AND B = C THEN 'Equilateral'
		
    # 이등변삼각형인 경우('정삼각형인 경우'의 CASE WHEN문 하단에 위치하므로, A = B AND B = C인 조건을 고려할 필요가 없음)
    WHEN A = B OR B = C OR C = A THEN 'Isosceles'
    
    # 부등변삼각형인 경우('삼각형이 만들어지는 경우', '정삼각형'과 '이등변삼각형'을 제외하면 모두 '부등변삼각형'이므로, 조건을 생략하고 ELSE에 기입해도 됨)
    WHEN A != B AND B != C AND C != A THEN 'Scalene'  
    
    ELSE NULL
  END TYPE
FROM TRIANGLES;

# 간략한 쿼리
-- SELECT
--   CASE
--     WHEN A + B <= C OR B + C <= A OR C + A <= B THEN 'Not A Triangle'
--     WHEN A = B AND B = C THEN 'Equilateral'
--     WHEN A = B OR B = C OR C = A THEN 'Isosceles'
--     ELSE 'Scalene'  
--   END TYPE
-- FROM TRIANGLES;
