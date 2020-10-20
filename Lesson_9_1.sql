/*транзакции*/
start transaction;

replace sample_9.users select * from shop_9.users where id = 1;

commit;

/*представления*/

create view new_view as select products.name as name_prod, catalogs.name from products left join catalogs on products.catalog_id = catalogs.id;

select * from new_view;