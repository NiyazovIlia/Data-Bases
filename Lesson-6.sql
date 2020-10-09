/* Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
 * 
 * как сделать правильнее не понимаю, надеюсь вы мне подскажите)*/
select * from users order by birthday limit 10; -- узнаем нужные id и используем их
select * from users where id in (38,111,26,101,47,141,154,31,163,36);
select sum(likepage) from likes_posts where user_id in(select id from users where id in (38,111,26,101,47,141,154,31,163,36));


/*Определить кто больше поставил лайков (всего) - мужчины или женщины?
 * 
 * Больше женщины*/
select sum(likepage) from likes_posts where user_id in (select id from users where gender = "m");
select sum(likepage) from likes_posts where user_id in (select id from users where gender = "f");

/*Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
 * 
 * Я думаю что это должно выглядеть так*/
select * from users order by created_at desc limit 10;