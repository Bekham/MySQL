-- Task 7.1 Total orders of each user

select u.name, u.birthday_at , count(1) as Total_orders 
from users u 
join orders o on u.id = o.user_id 
group by u.name, u.birthday_at 

-- Task 7.2 List of products and catalogs 

select p.name, p.price, c.name 
from products p 
left join catalogs c on p.catalog_id = c.id 

-- Task 7.3 Translate names of cities in russian

DROP DATABASE IF EXISTS fly;
CREATE DATABASE fly;
USE fly;
CREATE TABLE flights (
	id SERIAL,
 	`from` VARCHAR(255),
 	`to` VARCHAR(255)
);

INSERT INTO flights (`from`, `to`) VALUES
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');
  
 
 CREATE TABLE cities (
	`label` VARCHAR(255),
 	`name` TEXT
);

INSERT INTO cities (`label`, `name`) VALUES
  ('moscow', 'Москва'),
  ('irkutsk', 'Иркутск'),
  ('novgorod', 'Новогород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');
 
 select
  case
	when f.`from` = c1.label THEN c1.name
  end as `from`,
    case
	when f.`to` = c2.label THEN c2.name 
  end as `to`
from
  flights f 
 join cities c1 on f.`from` = c1.label
 join cities c2 on f.`to` = c2.label


  
 