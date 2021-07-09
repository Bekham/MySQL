-- DROP DATABASE IF EXISTS online_films;
CREATE DATABASE online_films;
USE online_films;

-- DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL, 
    email VARCHAR(120) UNIQUE,
 	password_hash VARCHAR(100), 
	last_login DATETIME ON UPDATE CURRENT_TIMESTAMP
) COMMENT 'юзеры';

create table categories (
	cat_id SERIAL,
	romcom bool,
	sci_fi bool,
	horror bool,
	documentary bool,
	animation bool,
	`action` bool,
	тhriller bool,
	drama  bool,
	comedy bool,
	adventure bool
) comment 'категории фильмов';


-- DROP TABLE IF EXISTS film_group;

create table film_group (
	group_id SERIAL,
	body text, -- Описание фильма: название, содержание, актеры, режиссер и т.д.
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
    ) comment 'объединение фильма с разным качеством, переводом в одну группу';

-- DROP TABLE IF EXISTS films;  

create table films (
	film_id SERIAL,
	filename varchar(255),
	film_group_id BIGINT UNSIGNED NOT NULL, -- Объединение одинаковых фильмов с разными переводами в группу
	category BIGINT UNSIGNED NOT NULL,
	metadata text,
	link blob,
	`size` INT,
	lang varchar(3),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (film_group_id) REFERENCES film_group(group_id),
    FOREIGN KEY (category) REFERENCES categories(cat_id)
) comment 'фильмы';

-- DROP TABLE IF EXISTS pro_photo;

create table pro_photo (
	photo_id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	metadata text,
	link blob,
	`size` INT UNSIGNED NOT NULL,
	body text,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id)
	) comment 'фото профиля';
	
create table profiles (
	user_id BIGINT UNSIGNED NOT NULL,
	firstname VARCHAR(50),
    lastname VARCHAR(50),
    phone BIGINT UNSIGNED UNIQUE, 
    gender CHAR(1) NOT NULL,
    birthday DATE,
	photo_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    hometown VARCHAR(100),
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES pro_photo(photo_id)
	) comment 'Профили';
	
create table view_history (
	profile_id bigint unsigned not null,
	film_id bigint unsigned not null,
	vewed_time TIME default '00:00:00', -- Время на котором окончился просмотр
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (profile_id) REFERENCES profiles(user_id),
    FOREIGN KEY (film_id) REFERENCES films(film_id)
	) comment 'История просмотров';


DROP TABLE IF EXISTS likes;

create table likes (
	id SERIAL, 
	profile_id bigint unsigned not null,
	film_id bigint unsigned not null,
	rating tinyint UNSIGNED,
	
	FOREIGN KEY (profile_id) REFERENCES profiles(user_id),
    FOREIGN KEY (film_id) REFERENCES film_group(group_id)
	) comment 'Оценки фильмов';

ALTER TABLE online_films.likes MODIFY COLUMN rating FLOAT NULL;
	
create table favorite (
	fav_group_id bigint unsigned not null,
	fav_group_name varchar(255),
	profile_id bigint unsigned not null,
	film_id bigint unsigned not null,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY (profile_id) REFERENCES profiles(user_id),
    FOREIGN KEY (film_id) REFERENCES film_group(group_id)
    ) comment 'Избранные группы';
    
create table torrents (
	film_id bigint unsigned not null,
	link blob,
	`size` INT,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (film_id) REFERENCES films(film_id)
	) comment 'Сылка на торрент';


-- DROP TABLE IF EXISTS news;

create table news (
	id SERIAL,
	film_id bigint unsigned not null,
	news_name VARCHAR(255) not null,
	content text,
  	news_size INT,
   	news_created_at DATETIME DEFAULT NOW(),
    news_updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	photo_metadata text,
	photo_link blob,
	photo_size INT,
	views bigint unsigned DEFAULT NULL,
	
	FOREIGN KEY (film_id) REFERENCES film_group(group_id)
	 ) comment 'Новости о фильмах';
	
