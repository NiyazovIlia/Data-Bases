SELECT * FROM lathes;

select * from drilling_and_boring where id_types_drilling_and_boring > 3;

select * from machine_tool_classification order by id desc;

select * from grinding_combined left join types_combined on grinding_combined.id_types_grinding_combined = types_combined.id;

select name, power from drilling_and_boring group by name;

create view lathes_name(id, name, characteristics, weight, power, type_name) as
select lathes.id, lathes.name, lathes.characteristics, lathes.weight, lathes.power, types_of_lathes.name from lathes left join types_of_lathes on lathes.id_types_of_lathes = types_of_lathes.id;

select * from lathes_name;

create view types_name(name_type,name,id) as
select machine_tool_classification.name, types_drilling_and_boring.name, types_drilling_and_boring.id from machine_tool_classification right join types_drilling_and_boring on machine_tool_classification.id = types_drilling_and_boring.id_machine_tool_classification;

select * from types_name;

delimiter //
CREATE PROCEDURE month_now()
BEGIN
	CASE 
		WHEN month(now()) IN (11,12,1) THEN
			SELECT 'Зима';
		WHEN month(now()) IN (2,3,4) THEN
			SELECT 'Весна';
		WHEN month(now()) IN (5,6,7) THEN
			SELECT 'Лето';
		ELSE
			SELECT 'Осень';
	END CASE;
END //
delimiter ;

call month_now();



delimiter //
CREATE TRIGGER new_trigger_2 BEFORE INSERT ON drilling_and_boring
FOR EACH ROW
BEGIN
	IF(drilling_and_boring.power > 2000) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Сила больше 2000!';
	END IF;
END //
delimiter ;

INSERT INTO `ilia_project`.`drilling_and_boring` (`id_types_drilling_and_boring`, `name`, `characteristics`, `weight`, `power`) VALUES ('4', '2204ВМ1Ф4.0', 'Станки модели 2204вм1ф4.0 предназначены для комплексной обработки корпусых деталей средних размеров без переустановки', '6000', '24568');

select * from new_trigger;

show triggers;