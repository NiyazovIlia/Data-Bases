/*процедуры*/
DROP PROCEDURE IF EXISTS hello;
delimiter //
CREATE PROCEDURE hello()
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00:00' AND '12:00:00' THEN
			SELECT 'Доброе утро';
		WHEN CURTIME() BETWEEN '12:00:00' AND '18:00:00' THEN
			SELECT 'Добрый день';
		WHEN CURTIME() BETWEEN '18:00:00' AND '00:00:00' THEN
			SELECT 'Добрый вечер';
		ELSE
			SELECT 'Доброй ночи';
	END CASE;
END //
delimiter ;

CALL hello();


/*тригеры*/
delimiter //
CREATE TRIGGER products_count_3 before INSERT ON products
FOR EACH ROW
BEGIN
  if (isnull(NEW.name) and isnull(NEW.desription)) then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Trigger Warning! NULL in both fields!';
  end if;
END//
delimiter ;

insert into products (name, desription) value ('sdds','csdf');
insert into products (name, desription) value ('sdds',null);
insert into products (name, desription) value (null,'csdf');
insert into products (name, desription) value (null, null);
SHOW TRIGGERS;
drop trigger products_count_3;