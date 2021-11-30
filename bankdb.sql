create database  if not exists bankdb;

use bankdb;

create table if not exists customer(accountNo int primary key  auto_increment,
cName varchar(30) not null,
cAddress varchar(40) not null,
cContactno varchar(12),
cUsername varchar(30) not null,
cPassword varchar(30) not null,
Balance double not null

);
select * from customer;
select * from transaction;
insert into customer values(1,'vasu','Tumakur','8787666788','vasu123','Vasu@123',20000.00);

SELECT * FROM customer WHERE accountNo=(SELECT MAX(accountNo) FROM customer);

create table if not exists transaction
(transactionID int primary key  auto_increment,
transactionTimestamp varchar(60) not null,
amountTransferred varchar(40) not null,
destiAccno int,
AccountNo varchar(30)
);

use bankdb;
select * from transaction;
select * from customer;
SELECT * FROM customer WHERE accountNo=(SELECT MAX(accountNo) FROM customer);
alter table transaction add message varchar(100);

alter table customer drop message;

delete from customer where accountNo=14;
delete from transaction where transactionID=6;





