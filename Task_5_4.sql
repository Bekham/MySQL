DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at varchar(255) COMMENT '���� ��������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '����������';

INSERT INTO users (name, birthday_at) VALUES
  ('��������', '05 may 1990'),
  ('�������', '12 november 1984'),
  ('���������', '20 may 1985'),
  ('������', '14 february 1988'),
  ('����', '12 january 1998'),
  ('�����', '29 august 1992');
  
select name from users where birthday_at LIKE '%may%'
or birthday_at LIKE '%aug%';