SELECT
    IF(ID < (SELECT MAX(ID) FROM SEAT),
        IF(ID % 2 = 0, ID - 1, ID + 1),
        IF(ID % 2 = 0, ID - 1, ID)
    ) AS ID,
    STUDENT
FROM SEAT
ORDER BY ID;