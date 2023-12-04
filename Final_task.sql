-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER //

DROP FUNCTION IF EXISTS task_01//

CREATE FUNCTION task_01(value INT)
RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE days, hours, minutes, seconds INT DEFAULT 0;
    
	SET days = value DIV (86400);
	SET value = value - (86400 * days);
    
	SET hours = value DIV 3600;
	SET value = value - (3600 * hours);
    
	SET minutes = value DIV 60;
	SET value = value - (60 * minutes);

	RETURN CONCAT(days, ' days ', 
    hours, ' hours ', 
    minutes, ' minutes ', 
    value, ' seconds');
END//

SELECT task_01(123456) AS Result//

-- Выведите только четные числа от 1 до 10. 
-- Пример: 2,4,6,8,10 
DROP PROCEDURE IF EXISTS task_02//

CREATE PROCEDURE task_02()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 10 DO
	IF i % 2 = 0 
	  THEN SELECT i;
    END IF;
    SET i = i + 1;
  END WHILE;
END//

CALL task_02()//