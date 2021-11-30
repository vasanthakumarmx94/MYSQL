show databases;

create database if not exists mydb_test;

show create database mydb_test;

Use mydb_test;

show tables;

drop database if exists mydb3;
drop database if exists mydb_test;
drop schema if exists mydb_test;

create database if not exists mydb2;
use mydb2;

create table if not exists tasks(
task_id int auto_increment primary key,
tittle varchar(255) not null,
start_date date,
due_date date,
status Tinyint not null,
description text,
created_at timestamp default current_timestamp
);

describe tasks;

CREATE TABLE IF NOT EXISTS Test(
	test_id INT,
    test_name VARCHAR(255),
    test_score INT,
    test_status TINYINT,
    test_description TEXT,
    test_date DATE
);

show tables;
rename table test to new_Test;
rename table new_test to test;

-- adda column 
alter table test add test_grade varchar(2);
alter table test add test_grade1 varchar(2) first;
alter table test add test_grade2 varchar(2) after test_name;

alter table test 
add  test_grade3 varchar(2),
add  test_grade4 varchar(2),
add  test_grade5 varchar(2);

describe test;

-- modify column
alter table test 
modify test_grade1 varchar(10) Not Null;

alter table test 
modify test_grade3 varchar(10) Not Null,
modify test_grade4 varchar(10) Not Null;

-- change column name
alter table test 
change column test_grade1 test_test int(2) not null;

-- drop column

alter table test drop column test_test;

alter table test 
	drop column test_grade3,
	drop column test_grade2,
	drop column test_grade4;

-- drop table 
drop table test;

-- drop and create it again using truncate

truncate  table test;



create table users(
user_id int auto_increment primary key,
user_name varchar(50) not null,
user_pass varchar(15) not null,
user_email varchar (30) not null unique,
user_phone varchar(15) not null unique,
user_credit dec(5,2) default 0.1,
user_withdraw dec(5,2) not null check(user_withdraw >0)

);
describe users;

insert into users(user_name,user_pass,user_email,user_phone,user_withdraw)
values('vasu','vasu123','vasu@gmail.com','+91 8787666988',0.01);

insert into users(user_name,user_pass,user_email,user_phone,user_withdraw)
values('veru','varnuu123','varnu@gmail.com','+91 8785566988',0.01);

select * from users;

alter table users auto_increment=101;

insert into users(user_name,user_pass,user_email,user_phone,user_credit,user_withdraw)
values('usha','usha123','ush@gmail.com','+91 8785566999',0.5,0.01);


insert into users(user_name,user_pass,user_email,user_phone,user_credit,user_withdraw)
values('usha3','usha1313','ush3@gmail.com','+91 8785776999',0.5,4);

set sql_safe_updates=0;
update users set user_email="varma@gmail.com" where user_name="usha";
select * from users;


create table user_address(
id int auto_increment primary key,
city varchar(50) not null,
country varchar(50) not null,
user_id int,
foreign key (user_id) references users(user_id)
);
describe user_address;
insert into user_address(user_id,city,country)
values(1,"mysore","India");

-- insert into user_address(user_id,city,country)values(100,"mysore","India");
insert into user_address(user_id,city,country)
values(5,"tmk","India");
select * from user_address; 
select * from users; 

CREATE TABLE devices(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO devices(name) VALUES('Repeater 1'),('Repeater 2');
INSERT INTO devices(id,name) VALUES(3,'Printer1') ;
INSERT INTO devices(name) VALUES('Printer')
ON DUPLICATE KEY UPDATE name  = 'Printer';

INSERT INTO devices(id,name) VALUES(4,'Printer')
ON DUPLICATE KEY UPDATE name  = 'New Printer';

SELECT * FROM devices;

select * from users;
select * from user_address;

delete from users where user_id=1;
delete from user_address where user_id=1;

delete from user,user_address 
using user
inner join user_address
where  user.user_id=user_address.user_id;


DELETE mydb2.users, mydb2.users_address 
FROM users INNER JOIN users_address 
ON (users.user_id = users_address.user_id ) WHERE id = 1;





