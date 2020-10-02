-- этот код испольщуется для вставки данных, есть несколько вариаций как можно это делать
insert into users (id, name,surname,email,phone,gender,birthday,hometown,photo_id,pass,created_at) values 
(1,'Сергей','Сергеев','qwe@asdf.qw',123123123,'m','1983-03-21','Саратов',NULL,'fdkjgsdflskdjfgsdfg142356214','2020-09-25 22:09:27.0');

insert into users (name,surname,email,phone,gender,birthday,hometown,photo_id,pass) values
('Ирина','Кийко','cattack2@unc.edu',2139527247,'f','1986-05-22','Саратов',NULL,'5f91ea663688cc873be65a6cc107f07da84664ae');

insert into users values
(3,'Виктория','Водопьянова','scasotti3@usgs.gov',4187011526,'f','1984-04-06','Челябинск',NULL,'f93c320ee2275544eb1b42d8278133c343fa5030','2020-09-25 22:09:27.0');

insert into users set 
name='Евгений',surname='Грачев',email='dcolquita@ucla.edu',phone='9744906651',gender='m',birthday='1987-11-26',hometown='Омск',pass='1487c1cf7c24df739fc97460a2c791a2432df062';

-- благодаря этому коду, мы можем брать данные из другой таблицы
insert communities
select * from snet1.communities;  

-- этот код используется для вывода информации
select * from snet1509.communities;
select * from users limit 10;
select * from users limit 3 offset 8; -- показыает 3 строки после 8 строки
select concat(surname,' ',name) persons from users; -- объединяем данные и показываем их в новом временном столбце
select distinct hometown from users; -- distinct помогает брать только уникальные значения из столбца

select * from users where name = 'Сергей'; -- where позволяет показывать лишь те данные которые равны элементам указанные нами

select name, surname, pass from users where birthday >= '1985-01-01';

select name,surname,hometown from users where hometown != 'Москва'; -- покажи данные где город не равен Москва

select name,surname,hometown from users where hometown in ('Москва', 'Санкт-Петербург', 'Нижний Новгород'); -- покажи данные где город Москва или Санкт-Петербург или Нижний-Новгород

select count(*) from users; -- возвращает кооличество строк в таблице
select min(birthday) from users; -- наименьший день рождения

-- при помощи этой команды мы можем менять данные в таблице
update friend_requests 
	set status = 'approved'
	where initiator_user_id = 1 and target_user_id = 2; -- обновляем данные на approved
    
delete from communities where name = 'Биология клетки'; -- удаляем где имя Биология клетки
delete from communities where id between 1 and 10; -- удаляем где id с 1 по 10
delete from communities; -- удаляем все данные
truncate table communities; -- так е удаляем все данные

set foreign_key_checks = 0; -- отключаем внешние ключи
truncate table communities;
set foreign_key_checks = 1;-- включаем внешние ключи

-- при помощи этой команды мы можем просматривать таблицы
show tables;

show create table users_communities; -- показывает данные при создании таблицы

CREATE TABLE `users_communities` (
  `user_id` bigint unsigned NOT NULL,
  `community_id` bigint unsigned NOT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) 
  	REFERENCES `users` (`id`) ON delete SET null ON update SET NULL,
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
)