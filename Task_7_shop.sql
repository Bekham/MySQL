drop database if exists shop;
create database shop;
use shop;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

-- DROP TABLE IF EXISTS rubrics;
CREATE TABLE rubrics (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO rubrics VALUES
  (NULL, 'Видеокарты'),
  (NULL, 'Память');

-- DROP TABLE IF EXISTS users;
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
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

-- DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  desription TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  -- KEY index_of_catalog_id (catalog_id)
  FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
) COMMENT = 'Товарные позиции';

INSERT INTO products
  (name, desription, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

-- DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  -- KEY index_of_user_id(user_id)
  FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT = 'Заказы';

INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('1', '1', '2003-07-30 11:26:49', '1986-04-29 07:50:40');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('2', '2', '1996-07-10 20:59:22', '1990-06-05 00:09:51');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('3', '3', '2012-04-21 10:32:31', '1985-05-12 18:46:13');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('4', '4', '2006-09-19 17:53:00', '1979-02-23 11:29:57');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('5', '5', '1988-07-24 04:04:10', '1995-08-01 21:07:15');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('6', '6', '2001-12-09 04:57:31', '1979-07-20 11:21:15');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('7', '1', '1993-10-23 03:44:55', '1970-06-23 17:59:28');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('8', '2', '2013-04-08 09:20:13', '1979-03-05 09:06:23');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('9', '3', '1978-05-19 18:23:10', '2000-01-31 12:35:02');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('10', '4', '1981-07-14 07:33:29', '1984-12-17 21:24:05');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('11', '5', '2006-06-24 03:31:48', '2014-11-21 18:22:20');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('12', '6', '1980-11-17 14:22:48', '1983-04-04 13:52:33');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('13', '1', '1971-03-02 05:55:34', '1976-07-29 13:30:04');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('14', '2', '1990-09-13 05:39:34', '2014-06-17 03:40:22');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('15', '3', '1985-12-24 21:07:44', '1999-06-05 03:44:56');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('16', '4', '1971-11-11 12:55:09', '2003-08-06 10:51:34');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('17', '5', '1981-05-01 09:05:07', '1981-03-19 22:15:44');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('18', '6', '1991-03-03 03:25:03', '2000-04-30 20:53:44');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('19', '1', '1988-05-23 06:46:14', '1976-12-29 00:55:30');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('20', '2', '1983-02-15 14:49:02', '2011-03-21 05:26:42');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('21', '3', '2013-11-21 22:34:04', '1996-10-05 00:51:48');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('22', '4', '2020-07-03 23:53:40', '1992-09-06 01:30:46');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('23', '5', '1998-02-22 23:07:46', '1991-12-05 20:52:39');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('24', '6', '1974-11-17 02:24:11', '2021-05-14 00:35:56');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('25', '1', '2018-06-25 22:47:22', '1990-01-13 16:20:57');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('26', '2', '1974-12-11 08:49:34', '1977-08-06 21:32:02');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('27', '3', '1982-06-08 16:41:08', '1991-11-04 14:15:36');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('28', '4', '1998-06-22 20:13:02', '1979-07-09 14:42:08');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('29', '5', '2016-06-26 13:00:35', '2016-11-22 11:06:55');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('30', '6', '1972-09-02 02:21:04', '2016-04-03 01:52:52');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('31', '1', '2007-10-15 02:05:20', '1984-12-26 16:16:37');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('32', '2', '1997-08-07 22:04:10', '1999-07-25 21:16:42');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('33', '3', '1978-12-23 00:54:41', '2012-11-26 20:34:33');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('34', '4', '1995-03-28 19:22:28', '2006-07-01 18:56:57');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('35', '5', '1984-11-02 07:59:35', '1996-02-10 16:28:31');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('36', '6', '1983-12-30 23:46:32', '2003-07-27 06:21:51');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('37', '1', '1983-06-19 20:23:47', '1975-09-28 09:10:17');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('38', '2', '1992-08-30 02:41:27', '1973-07-01 04:29:49');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('39', '3', '2013-04-11 23:18:38', '1983-05-12 12:35:50');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('40', '4', '1999-12-26 21:05:31', '1989-05-25 10:56:10');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('41', '5', '1993-03-06 11:43:15', '1976-04-03 18:00:09');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('42', '6', '2016-09-14 04:27:17', '1980-07-15 05:04:08');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('43', '1', '1998-06-19 14:18:22', '2003-01-23 04:16:53');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('44', '2', '1997-01-01 06:29:05', '2015-06-18 13:48:00');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('45', '3', '1987-05-01 01:35:41', '2012-03-09 13:02:51');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('46', '4', '1980-12-11 01:23:24', '1992-04-29 07:41:49');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('47', '5', '2015-04-28 16:11:56', '2001-12-24 02:51:03');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('48', '6', '1999-10-25 04:26:01', '1991-06-02 19:06:14');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('49', '1', '2007-03-23 06:06:55', '1991-03-01 12:54:46');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('50', '2', '2000-12-18 00:17:06', '2006-03-24 19:28:04');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('51', '3', '2004-05-10 10:27:53', '2002-08-19 07:47:50');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('52', '4', '2011-10-11 12:52:37', '2013-12-24 11:20:03');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('53', '5', '2014-01-23 10:41:08', '1983-03-08 02:40:25');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('54', '6', '1971-10-20 19:55:09', '2008-03-10 20:59:46');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('55', '1', '1997-03-23 21:20:04', '2003-02-27 09:56:29');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('56', '2', '1997-05-20 13:24:46', '1975-02-21 05:43:43');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('57', '3', '1987-07-10 05:36:30', '2012-08-29 10:19:10');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('58', '4', '2013-07-28 17:24:51', '2005-12-12 23:30:02');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('59', '5', '2009-01-07 13:21:42', '2018-06-19 01:45:57');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('60', '6', '1970-11-23 09:48:57', '2011-03-28 09:22:01');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('61', '1', '2007-09-26 01:53:36', '1989-10-22 21:07:28');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('62', '2', '1970-06-26 01:28:08', '2000-11-03 06:24:02');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('63', '3', '1990-10-10 23:24:29', '1976-12-13 05:16:44');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('64', '4', '2020-01-17 16:41:10', '1975-04-09 14:36:32');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('65', '5', '2021-03-01 04:30:29', '1995-06-03 21:40:43');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('66', '6', '1994-09-30 23:19:21', '1999-02-08 23:54:22');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('67', '1', '2015-09-16 06:28:03', '1999-06-20 03:54:08');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('68', '2', '1980-06-09 21:39:25', '2005-05-21 07:07:56');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('69', '3', '1977-12-31 12:38:39', '1970-05-28 08:47:33');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('70', '4', '1991-10-03 17:09:24', '1973-11-22 04:19:09');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('71', '5', '2016-08-23 22:09:58', '1970-12-17 00:16:14');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('72', '6', '1995-07-03 04:04:15', '1982-02-16 04:12:51');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('73', '1', '2015-08-16 14:22:41', '1996-04-13 17:29:46');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('74', '2', '2012-04-21 14:47:55', '1970-11-05 17:00:17');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('75', '3', '1990-11-23 16:16:02', '2019-10-13 11:49:22');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('76', '4', '1975-10-18 22:07:31', '2006-08-12 06:02:49');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('77', '5', '1996-05-08 23:53:22', '2009-08-03 00:45:05');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('78', '6', '1991-09-13 18:38:18', '1990-05-01 22:22:50');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('79', '1', '1985-06-27 13:58:18', '1990-04-16 22:57:43');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('80', '2', '2010-03-12 18:26:00', '1999-12-27 17:30:31');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('81', '3', '2013-05-08 01:25:53', '1991-06-25 17:54:21');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('82', '4', '1990-03-21 17:04:35', '1973-03-03 13:08:06');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('83', '5', '1986-05-18 21:57:24', '1985-06-19 18:31:01');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('84', '6', '1972-04-07 00:33:20', '1974-10-13 03:02:08');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('85', '1', '1986-11-04 19:18:02', '2019-06-24 20:39:52');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('86', '2', '2004-03-17 21:14:08', '1970-09-21 11:00:26');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('87', '3', '1984-09-19 18:35:12', '2006-06-28 23:17:21');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('88', '4', '1983-01-27 12:41:04', '1976-06-24 22:12:23');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('89', '5', '1986-06-22 19:38:41', '2013-08-19 11:12:18');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('90', '6', '1992-01-17 09:30:24', '2002-02-22 01:26:13');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('91', '1', '2010-10-01 16:56:39', '1982-06-19 01:39:29');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('92', '2', '1988-08-30 10:45:28', '1983-03-10 21:33:58');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('93', '3', '2010-05-02 20:31:42', '2011-05-11 05:46:19');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('94', '4', '1995-10-08 21:50:10', '1991-07-14 18:23:12');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('95', '5', '1978-08-18 05:11:33', '1972-06-15 21:21:24');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('96', '6', '2018-07-07 11:39:29', '1983-07-16 16:32:50');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('97', '1', '2009-12-19 02:14:15', '1985-07-18 14:34:09');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('98', '2', '2012-01-24 00:37:28', '1998-04-10 07:30:35');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('99', '3', '1971-01-23 12:30:11', '1975-03-27 09:17:53');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('100', '4', '2008-10-25 20:40:31', '2015-05-21 22:31:48');

-- DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
  order_id INT UNSIGNED,
  product_id INT UNSIGNED,
  total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Состав заказа';

-- DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  product_id INT UNSIGNED,
  discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  KEY index_of_product_id(product_id)
) COMMENT = 'Скидки';

-- DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';

-- DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';
