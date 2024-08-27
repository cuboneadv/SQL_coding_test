DELIMITER //

CREATE PROCEDURE PrintPattern(IN n INT)
BEGIN
    DECLARE i INT DEFAULT n;
    DECLARE row_pattern TEXT;
    
    WHILE i > 0 DO
        SET row_pattern = '';  -- Reset the pattern for the current row
        SET @j = i;
        
        WHILE @j > 0 DO
            SET row_pattern = CONCAT(row_pattern, '* ');
            SET @j = @j - 1;
        END WHILE;
        
        SELECT row_pattern;
        SET i = i - 1;
    END WHILE;
END //

DELIMITER ;

CALL PrintPattern(20);