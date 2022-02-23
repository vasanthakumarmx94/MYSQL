
create database Checkdb;
use Checkdb;

select * from cars;

select * from carbooking;
select * from users;

create database poc2task;
use poc2task;
select * from student;
select * from project;
select * from user;
delete from student where id in(6,7,8,9,10);


insert into user values(2,TRUE,'a123','ROLE_ADMIN','admin');

-- ------------

create database poc2taskoauth2;
use poc2taskoauth2;
select * from student;
select * from project;
select * from user;
select * from role;
select * from user_roles;

insert into user values(1,"admin",'a123');
insert into user values(2,"user",'u123');

insert into role values(1,"ADMIN");
insert into role values(2,"USER");

insert into user_roles values(2,2);


use jwtbootdb;
-- [user, user123][admin,admin123]
select * from user;
desc user;
insert into user(password,username) values("admin123","admin");
insert into user(password,username) values("user123","user");

delete from user where id in(1,2);
create database poc2taskjwt;
use poc2taskjwt;
select * from role;
select * from user;
select * from user_role;





