DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO storehouses_products (storehouse_id, product_id, value) VALUES
  (2, 1, 20),
  (2, 2, 5),
  (2, 3, 4),
  (2, 4, 0),
  (2, 5, 15),
  (2, 6, 1),
  (2, 7, 0);
  
select * 
from   storehouses_products ORDER by IF(value > 0,  1,  0) DESC,
value ASC
