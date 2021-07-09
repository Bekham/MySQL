-- Поиск фильмов с самым выским рейтингом

select 
fg.body Film , avg(l.rating) Rating
from likes l 
join
film_group fg on l.film_id = fg.group_id
group by l.film_id 
order by rating desc 
limit 10;

/*UPDATE likes SET rating = FLOOR(RAND()*100); - приведение рейтинга к бальной системе от 1 до 100*/
-- Поиск комедий с самым выским рейтингом
select 
fg.body Film , c.comedy film_type, avg(l.rating) Rating
from likes l 
join
film_group fg on l.film_id = fg.group_id
join
films f on f.film_group_id = fg.group_id 
join 
categories c on f.category = c.cat_id 
where c.comedy = 1
group by id 
order by rating desc 
limit 10;

-- подсчет количества поставленных лайков мужчинами и женщинами 
select 
(select Count(profile_id) 
from likes
where profile_id in (select user_id from profiles p 
where gender = 'f')) as female,
(select Count(profile_id)
from likes
where profile_id in (select user_id from profiles p 
where gender = 'm')) as male
from likes limit 1;

/*set foreign_key_checks = 0;
UPDATE view_history SET film_id = FLOOR(RAND()*1000);
set foreign_key_checks = 1; обновление списка просмотренных фильмов для более наглядного результата*/
-- список наиблее популярных фильмов по просмотрам
select fg.body as Film, count(vh.film_id) as views
from view_history vh 
join films f on vh.film_id = f.film_id 
join film_group fg on f.film_group_id = fg.group_id 
group by fg.body
order by views desc 
limit 10;

-- представление последених новостей из мира кино
CREATE OR REPLACE VIEW last_news (`news`, `film`, `views`, `date`)
AS 
SELECT n.content, fg.body, n.views, n.news_updated_at FROM news n
join
film_group fg on fg.group_id = n.film_id 
order by news_updated_at desc limit 10;

SELECT * FROM last_news;

-- представление торрент ссылок на самые популярные фильмы

CREATE OR REPLACE VIEW pop_torrent (`film`, `rating`, `link`, `size`)
AS 
SELECT fg.body, avg(l.rating) rating, t.link, t.`size` FROM torrents t 
join 
films f on f.film_id = t.film_id
join
film_group fg on fg.group_id = f.film_id 
join
likes l on l.film_id = fg.group_id 
group by l.film_id
order by rating desc limit 10;

SELECT * FROM pop_torrent;

-- триггеры. проверка фамилии и имени на нулевое значение

delimiter //
//
create trigger check_name before insert on profiles
for each row
begin
	if (new.firstname is null  or
	new.lastname is null
	) then 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled. Wrong firstname or lastname!!!';
	end if;
end //
delimiter ;
set foreign_key_checks = 0;
INSERT INTO `profiles` (`user_id`, `firstname`, `lastname`, `phone`, `gender`, `birthday`, `photo_id`, `created_at`, `updated_at`, `hometown`) VALUES (1001, NULL, 'Lockmen', '222172', 'f', '1989-05-09', '50', '2007-12-28 17:10:13', '1970-04-13 09:02:17', 'Central African Republic');
set foreign_key_checks = 1;

-- функция. вывод количества фильмов, выпущенных за указанный год
drop function if exists year_films;
delimiter //
//
create function year_films(insertyear char(4))
returns int 
deterministic
begin
	declare _filmscount_ int;
	set _filmscount_ = (select count(1) 
	from film_group
	where year(created_at)=insertyear);
    return _filmscount_;
end
//
delimiter ;
select year_films(2000);
