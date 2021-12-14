create database codejavadb;
use codejavadb;
select * from teachers;
use carrental;

select * from users;


use springboot;

create table springsecurity.user(
id int,
active boolean,
password varchar(20),
roles varchar(20),
user_name varchar(30)
);



insert INTO springsecurity.user values
(1,true,'u123','ROLL_USER','user'),
(2,true,'a123','ROLL_ADMIN','admin'),
(3,true,'s123','ROLL_USER','student');

insert INTO springboot.user values
(3,true,'s123','ROLL_USER','student');

select * from user;
update user set  user_name="student" where id=3;
SET SQL_SAFE_UPDATES = 0;

use carrental;
select * from users;
delete from users where user_id in(13,14) ;
