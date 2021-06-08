DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = '����������';

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
  ('��������', '1990-10-05', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('�������', '1984-11-12', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('���������', '1985-05-20', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('������', '1988-02-14', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('����', '1998-01-12', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('�����', '1992-08-29', '20.10.2017 8:10', '20.10.2017 8:10');

select * from users;
 update users set created_at = STR_TO_DATE(updated_at, '%d.%m.%Y %T');
 update users set updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %T');

select * from users;
  
 