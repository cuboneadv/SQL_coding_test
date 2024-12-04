# 첫 번째 풀이
-- SELECT 
--     ANIMAL_ID, 
--     NAME, 
--     CASE
--         WHEN SEX_UPON_INTAKE LIKE '%Neutered%' THEN 'O'
--         WHEN SEX_UPON_INTAKE LIKE '%Spayed%' THEN 'O'
--         ELSE 'X' 
--     END AS '중성화'
-- FROM 
--     ANIMAL_INS
-- ORDER BY 
--     ANIMAL_ID;

# 두 번째 풀이
-- SELECT 
--     ANIMAL_ID, 
--     NAME, 
--     CASE
--         WHEN SEX_UPON_INTAKE LIKE '%Neutered%' OR SEX_UPON_INTAKE LIKE '%Spayed%' THEN 'O'
--         ELSE 'X' 
--     END AS '중성화'
-- FROM 
--     ANIMAL_INS
-- ORDER BY 
--     ANIMAL_ID;

# 세 번째 풀이
SELECT 
    ANIMAL_ID, 
    NAME, 
    CASE 
        WHEN SEX_UPON_INTAKE REGEXP 'Neutered|Spayed' THEN 'O'
        ELSE 'X' 
    END AS '중성화'
FROM 
    ANIMAL_INS
ORDER BY 
    ANIMAL_ID;