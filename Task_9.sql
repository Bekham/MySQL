-- Task 6_1
drop database if exists sample;
create database sample;
use sample;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

start transaction;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
SET FOREIGN_KEY_CHECKS=0;
delete FROM shop.users WHERE id = 1;
SET FOREIGN_KEY_CHECKS=1;
commit;

-- Task 6_2

CREATE OR REPLACE VIEW task_6_2 (`products`, `catalog`)
AS 
SELECT p.name, c.name FROM shop.products p 
JOIN shop.catalogs c ON p.catalog_id = c.id;
SELECT * FROM task_6_2;

-- Task 6_3 Make this task later...
-- Task 6_4 Make this task later...

-- Task 7. Administration. Make this task later...

-- Task 8_1

drop function if exists hello;
delimiter //
//
create function hello()
returns TEXT 
deterministic
begin
	declare curr_time int;
	set curr_time = hour(NOW());
	case curr_time
	when (curr_time >= 0 and curr_time < 7 )
	then 
		return "Доброй ночи";
	when (curr_time >= 7 and curr_time < 12 )
	then 
		return "Доброе утро";
	when (curr_time >= 12 and curr_time < 18 )
	then 
		return "Добрый день";
	else
		return "Добрый вечер";
	end case;
end
//
delimiter ;
select hello();

-- Task 8_2
delimiter //
//
create trigger not_null before update on products
for each row
begin
	if (new.name is null and new.desription is null) then 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled. name and desription is NULL!!!';
	end if;
end //
delimiter ;
delimiter //
//
create trigger not_null_insert before insert on products
for each row
begin
	if (new.name is null and new.desription is null) then 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT canceled. name and desription is NULL!!!';
	end if;
end
//
delimiter ;
UPDATE products SET name = null WHERE id = 5;
UPDATE products SET 
name = NULL,
desription = NULL 
WHERE id = 3;
INSERT INTO products
  (name, desription)
VALUES
  (null, null);
DROP TRIGGER IF EXISTS shop.not_null_insert;
USE shop;

-- Task 8_3 Make this task later...


