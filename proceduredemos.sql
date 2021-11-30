
-- create a procedure to get all empo with dept details
use mydb;

DELIMITER $$
create procedure GetAllEmployeeDept()
BEGIN
select * from emp 
INNER JOIN dept using(deptno);
END $$
DELIMITER ;
-- drop procedure
DROP PROCEDURE mydb.GetAllEmployeeDept;

-- show procedure
show procedure status where db='mydb';

-- call procedure
CALL  GetAllEmployeeDept();
--  it was error to workout

DELIMITER $$
create procedure GetAllEmployeeDept(IN dno INT)
BEGIN
select * from emp 
INNER JOIN dept using(deptno) where emp.deptno=dno;
END $$
DELIMITER ;
call GetAllEmployeeDept(20);

select * from emp,dept


-- out example
DELIMITER $$
create procedure GetEmpCountByJob(IN jb varchar(30),OUT counter int)
BEGIN
	select count(*) INTO counter
	from emp where job=jb;
END $$
DELIMITER ;

call GetEmpCountByJob('MANAGER',@COUNTER); -- @counter may be anything
select @COUNTER as counter;

select *,count(*) 
	from mydb.emp where job="MANAGER";


-- 

DELIMITER $$
CREATE PROCEDURE GetEmpCountByJob(IN jb VARCHAR(20), OUT counter INT) 
BEGIN 
	SELECT COUNT(*) 
    INTO counter 
    FROM MYDB.EMP WHERE job=jb;
END $$
DELIMITER ;

CALL GetEmpCountByJob('MANAGER',@total_managers);
SELECT @total_managers as counter;

SELECT count(*) FROM MYDB.EMP WHERE job='MANAGER';
