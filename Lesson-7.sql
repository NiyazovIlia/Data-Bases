select * from users where id in (select user_id from orders group by user_id having count(user_id) > 1)

select * from products as p join catalogs as s on p.catalog_id  = s.id;

select id, `from`,name, `to`, name from flights left join cities on flights.`from` = cities.label;