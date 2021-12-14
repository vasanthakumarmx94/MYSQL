use carrental;
select * from cars;
select * from users;
delete from users where user_id in(16,18,19);
select * from carbooking;
create database crms;
use crms;


create database temprature;
use temprature;


insert into temp_exchange
(id,temp_from,temp_to,conversion_multiple,environment)
values(10003,'dg','fh',1.80,'');
insert into temp_exchange
(id,temp_from,temp_to,conversion_multiple,environment)
values(10004,'fh','dg',0.55,'');

update temp_exchange set conversion_multiple=1.80 where id=10003;

select * from temp_exchange;

delete from temp_exchange where id in(10001,10002);





