DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at varchar(255) COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '05 may 1990'),
  ('Наталья', '12 november 1984'),
  ('Александр', '20 may 1985'),
  ('Сергей', '14 february 1988'),
  ('Иван', '12 january 1998'),
  ('Мария', '29 august 1992');
  
select name from users where birthday_at LIKE '%may%'
or birthday_at LIKE '%aug%';