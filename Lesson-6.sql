/* ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.
 * 
 * ��� ������� ���������� �� �������, ������� �� ��� ����������)*/
select * from users order by birthday limit 10; -- ������ ������ id � ���������� ��
select * from users where id in (38,111,26,101,47,141,154,31,163,36);
select sum(likepage) from likes_posts where user_id in(select id from users where id in (38,111,26,101,47,141,154,31,163,36));


/*���������� ��� ������ �������� ������ (�����) - ������� ��� �������?
 * 
 * ������ �������*/
select sum(likepage) from likes_posts where user_id in (select id from users where gender = "m");
select sum(likepage) from likes_posts where user_id in (select id from users where gender = "f");

/*����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ����.
 * 
 * � ����� ��� ��� ������ ��������� ���*/
select * from users order by created_at desc limit 10;