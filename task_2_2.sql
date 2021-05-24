DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'name'
) COMMENT = 'users';
DESCRIBE users;
INSERT INTO users (name) VALUES ('Antonio');
INSERT INTO users (name) VALUES ('Igorio');
INSERT INTO users (name) VALUES ('Romario');
SELECT * FROM users;
