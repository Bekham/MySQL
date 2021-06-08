DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-15'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
  
DROP TABLE IF EXISTS day_week;
	CREATE TABLE day_week (
	name_week VARCHAR(255),
	count_days INT -- DEFAULT 0
	);

INSERT INTO day_week select 
DAYNAME(DATE_FORMAT(birthday_at,'2021-%m-%d')),
DAYOFWEEK(DATE_FORMAT(birthday_at,'2021-%m-%d')) 
from users;

SELECT name_week, COUNT(name_week) as 'Количество'
FROM day_week
GROUP BY name_week ;
