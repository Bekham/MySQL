DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '����������';

INSERT INTO users (name, birthday_at) VALUES
  ('��������', '1990-10-05'),
  ('�������', '1984-11-12'),
  ('���������', '1985-05-20'),
  ('������', '1988-02-15'),
  ('����', '1998-01-12'),
  ('�����', '1992-08-29');
  
DROP TABLE IF EXISTS day_week;
	CREATE TABLE day_week (
	name_week VARCHAR(255),
	count_days INT -- DEFAULT 0
	);

INSERT INTO day_week select 
DAYNAME(DATE_FORMAT(birthday_at,'2021-%m-%d')),
DAYOFWEEK(DATE_FORMAT(birthday_at,'2021-%m-%d')) 
from users;

SELECT name_week, COUNT(name_week) as '����������'
FROM day_week
GROUP BY name_week ;
