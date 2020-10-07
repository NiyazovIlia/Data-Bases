select AVG(age) as avg from users;
select *, dayofweek(birthday_at) as day, dayname(birthday_at) as dayname from users;
select exp(sum(ln(value))) from tbl;