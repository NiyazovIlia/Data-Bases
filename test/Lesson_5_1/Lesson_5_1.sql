UPDATE `lesson_5_1`.`users` SET `created_at` = now(),  `updated_at` = now() WHERE (`id` < '7');

ALTER TABLE `lesson_5_1`.`users` 
CHANGE COLUMN `created_at` `created_at` DATETIME NULL DEFAULT NULL,
CHANGE COLUMN `updated_at` `updated_at` DATETIME NULL DEFAULT NULL ;

select * from storehouses_products order by value;