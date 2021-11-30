Use mydb;
-- INOUT param

DELIMITER $$
create procedure 
setCounter(INOUT counter INT ,IN incre INT)
BEGIN
SET counter=counter+incre;
END $$
DELIMITER ;

-- execute
set @counter=1;
call Setcounter(@counter,1);
call Setcounter(@counter,1);
call Setcounter(@counter,5);
select @counter;

select * from emp;
-- create  function 
DELIMITER $$
CREATE FUNCTION SalLevel(
salary decimal(10,2))
RETURNS varchar(20)
DETERMINISTIC 
BEGIN
	DECLARE sal_Level varchar(20);
    IF salary >2000 THEN
		SET sal_Level='High';
    ELSE 
		SET sal_Level='LOW';
	END IF;
    RETURN sal_Level;
	
END $$
DELIMITER ; 

SHOW FUNCTION STATUS WHERE db='mydb';

SELECT  empno,ename,sal,SalLevel(sal) as SalLevel from emp;

SELECT SalLevel(5000) as SalLevel;

select * from sample;

CALL GetAllEmployeeDept(20);

use mydb;
select * from profile;
delete from profile where sid in(1,3,4,5);
drop table profile;



  CREATE TABLE MYDB.student(stid INT AUTO_INCREMENT PRIMARY KEY,
stname VARCHAR(50) NOT NULL,
stcourse VARCHAR(50) NOT NULL,
marks INT(2) NOT NULL);


INSERT INTo mydb.student(stname,stcourse,marks)
VALUES('vasu','java',90),
('ram','php',80),
('raj','c#',60),
('karan','HTMl',70);



INSERT INTO MYDB.student(stname,stcourse,marks) 
VALUES('Smita','Java',90), 
('Abitha','Java',93), 
('Saba','Python',91), 
('Sarwar','Python',95), 
('Arif','Java',98); 

select * from student;
