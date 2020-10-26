DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(45) NOT NULL,
	str_id BIGINT(20) NOT NULL,
	name_value VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;

drop trigger if EXISTS after_users;
delimiter //
create trigger after_users after insert on users
for each row
begin
	insert into logs (created_at,table_name,str_id,name_value) values (now(), 'users', new.id, new.name);
end//
delimiter ;

drop trigger if EXISTS after_users;
delimiter //
create trigger after_users after insert on catalogs
for each row
begin
	insert into logs (created_at,table_name,str_id,name_value) values (now(), 'catalogs', new.id, new.name);
end//
delimiter ;

drop trigger if EXISTS after_users;
delimiter //
create trigger after_users after insert on products 
for each row
begin
	insert into logs (created_at,table_name,str_id,name_value) values (now(), 'products ', new.id, new.name);
end//
delimiter ;

INSERT INTO users (name, birthday_at) VALUES ('Rtyn', '1900-01-01');
insert into catalogs (name) values ('scsdvsv');
insert into products (name,desription,price) values ('ssdcs', 'dcsdsf', 78568);
select * from logs;