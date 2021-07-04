-- Task 11_1
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(45) NOT NULL,
	str_id BIGINT(20) NOT NULL,
	value_name VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;

DROP TRIGGER IF EXISTS users_log;
delimiter //
CREATE TRIGGER users_log AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, value_name)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS catalogs_log;
delimiter //
CREATE TRIGGER catalogs_log AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, value_name)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS products_log;
delimiter //
CREATE TRIGGER products_log AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, value_name)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;

-- Task 11_2

DROP TABLE IF EXISTS test_users; 
CREATE TABLE test_users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	birthday_at DATE,
	`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
 	`updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP PROCEDURE IF EXISTS insert_100_users ;
delimiter //
CREATE PROCEDURE insert_100_users ()
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i < 101 DO
		INSERT INTO test_users(name, birthday_at) VALUES (CONCAT('user_', i), NOW());
		SET i = i + 1;
	END WHILE;
end //
delimiter ;


CALL insert_100_users();
SELECT * FROM test_users;

