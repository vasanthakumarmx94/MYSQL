-- Author: Vasanthakumar
-- Software Engineer Trainee 
-- Company:  NeoSoftTechnologies 

Use mydb;

select * from emp;

-- 23. Fetching (select queries only); use database mydb and emp tablefrom it
	-- 1.Decrement sal by 5% who is a clerk?
SELECT EMPNO,SAL AS oldsal,sal -(SAL*0.05)/100 AS newsal FROM EMP where job="CLERK";

	-- 2.Display eno and ename who have sal between 2000 and 3000?
select empno,ename,sal from emp where sal between 2000 and 3000;

	-- 3. Display eno and job who are from dept 10 or 20?
select empno,job,deptno from emp where deptno in(10,20);

	-- 4. Display eno,mgr who have salary > 2000 or deptno > 10 or job is clerk?
select empno,mgr,sal,deptno,job from emp where sal>2000 or deptno>10 or job="clerk";

select * from emp;
	-- 5. Increment sal by 15% who is not reporting to any one?
     select * from emp where mgr is null or empno=mgr;
    



-- ======================================================

-- 24 ORDER BY
-- 1. Increment sal by 7% who is a manager and display records in descending of sal?
select empno, ename,sal, sal+((sal*0.7)/100) As newsal from emp where job="MANAGER" order by newsal desc;


-- 2. Display eno and ename who have sal between 2000 and 3000. Display the records order by empno in ascending?
select empno,ename,sal from emp where sal between 2000 and 3000 order by empno ASC;

-- 3.Display unique records of empno and job who are from dept 10 or 20?

 select distinct (job),empno,deptno from emp where deptno in(10,20);

-- 4. Display unique jobs from emp except manager?
select distinct job from emp  where job not In('MANAGER'); 

-- ===========================================
-- 25. Group By
-- 1. Count total no. of emps?
select count(empno) from emp ;

-- 2. Count dept wise total emps?
select count(empno),deptno from emp group by deptno;

-- 3. Display min salary of emps?
select empno,ename,min(sal) from emp;

-- 4. Display the max salary of each dept?
select max(sal),deptno from emp group by deptno;

-- 5. Count people have salary > 2000?
select count(empno) from emp where sal>2000;

select * from emp;

-- 6.Count people from each dept have salary < 3000?
select deptno,count(empno) from emp where sal<3000 group by deptno;

-- 7. Display dept has < 3 people.
select deptno,count(empno)  from emp group by deptno having count(empno)<=3;

-- 8. Display deptno where dept's max(sal) > 3000?
select deptno ,max(sal) from emp having max(sal)>3000;

-- ===========================================================================
-- 26. Joins (emp+dept):
	insert into emp Values(1171,"Varu","Clerk",null,"1998-10-10",4000,null,40);
-- 1. Display emp details with 7% increment who belongs to BOSTON location.
select * from dept;
select * from emp;
select empno,ename, (sal*0.7) As newsal from emp where deptno in(select deptno from dept where loc="BOSTON");
select empno,ename, (sal*0.7) As newsal,d.loc from emp e,dept d where e.deptno=d.deptno and d.loc="BOSTON";

-- 2. Count the no. of employees works for RESEARCH dept.

select count(empno),d.dname
from EMP e
INNER JOIN DEPT d ON e.deptno=d.deptno where d.dname="RESEARCH";

-- 3. Find out the max salary received in SALES dept.
select max(sal),d.dname
from EMP e
INNER JOIN DEPT d ON e.deptno=d.deptno where d.dname="SALES";

-- 4. Display date of joining of emp whose dept location is not available.
insert into emp Values(1177,"Harsha","S/w Engnr",null,"2021-10-10",6000,null,50);
insert into emp Values(1179,"Prajwal","SE",null,"2021-09-10",6000,null,60);
insert into dept Values(50,"DEVELOPMENT",null);
insert into dept Values(60,"Tech TLead",null);

select ename,e.hiredate,d.deptno,d.dname
from EMP e
INNER JOIN DEPT d ON e.deptno=d.deptno where d.loc is null;

-- ====================================================================
-- 27. DDL+DML
-- create table student_info with columns rno,name,city 
-- where rno is a primary key and all columns do not accept null.
create table student_info(rno int primary key,name varchar(40) not null,city varchar(30) not null);

-- Insert below records:
insert into student_info values(1,'gautam','jalgaon'),
(2,'balaji','parbhani'),(3,'rushin','jalgaon');
select * from student_info;

-- create table marks with columns rno,sub_code number,marks and insert below records:
create table marks(rno int,sub_code int,marks int);
insert into marks values(1,100,80),(2,100,null),(1,101,90)
,(2,101,78),(3,100,30),(3,101,null);
select * from marks;

-- create table subject with columns sub_code number,sub_name and Insert below records
create table subject(sub_code int,sub_name varchar(30));
insert into subject values(100,'dbms'),(101,'SE');
select * from subject;
select * from marks;
select * from student_info;
-- 1. Find out average marks of each student along with roll number of student .
select rno,avg(marks) from marks  group by rno;
-- 2.Find out how many students have failed i.e. obtained less than 40 marks in DBMS.
select count(rno) from marks where marks< 40 and sub_code=(select sub_code from subject
where sub_name='dbms');

-- 3.Find names of Students who are absent in Exam i.e. students having null marks.
select rno,name from student_info where rno in(select rno from marks where marks is null);

-- 4.Find the name of students who live in either ‘pune’ or 'jalgaon’.
select * from student_info where city in('pune','jalgaon');

-- 5.Find out roll no and total marks of each student.
select rno ,sum(marks) from marks group by rno;

-- 6.Find those student names which start with 'ba'.
select * from student_info where name like 'ba%';

-- 7.Display total no of students having greater than 75 marks in any one subject.
select count(distinct rno) from marks where marks>75;

-- 8.Display marks of all students for DBMS subject.
select rno, marks from marks where sub_code=
(select sub_code from subject where sub_name='dbms');

-- 9.Display no of students appeared for the exam.
select count(distinct rno)  from marks where marks is not null;

-- 10 Display all subjects marks of students whose name is gautam.
select marks from marks where rno=(select rno from student_info where name="gautam");

-- =======================================================


-- GIVE 7% INCREMENT TO EMPLOYEES WHO ARE HERE SINCE LAST 5 YEARS AND SALARY < 2000?
SELECT sal, sal+((sal*7))/100 AS NEWSAL FROM EMP
      WHERE DATEDIFF(CURDATE(),HIREDATE)> 5 AND SAL < 2000;  

SELECT HIREDATE, sal+(7*SAL)/100 AS INCREMENTAL , YEAR(CURdATE())-YEAR(HIREDATE) AS EXP
                      FROM EMP
                      WHERE YEAR(CURDATE())-YEAR(HIREDATE)>= 5 AND SAL<2000;

-- DISPLAY YEARLY REPORT WHICH SHOWS YEAR WISE NO OF JOININGS?
SELECT COUNT(*) AS JOINING, date_format(HIREDATE , "%Y") AS YEAR FROM EMP
                                         GROUP BY YEAR;  

-- DISPLAY MONTHLY REPORT WHICH SHOWS MONTH WISE NO.OF JOININGS?
SELECT COUNT(*) AS JOINING, date_format(HIREDATE , "%M") AS MONTH FROM EMP
                                         GROUP BY MONTH;



-- Date Functions:
-- 1.Display the most seniour employees? (Based on days)
select * from emp having max(datediff(now(),hiredate) );
-- OR
select  * from emp 
where hiredate = ( select min(hiredate) from emp); 

-- 2.Give 5% increment to employees who are here since last 3 years?
select *,sal+(sal*5)/100 as newsal ,date_format(now(),'%Y')-date_format(hiredate,'%Y') as expe from emp where date_format(now(),'%Y')-date_format(hiredate,'%Y')<3 ;
-- **********************************
update emp set hiredate="2019-11-20" where empno=7499;

SET SQL_SAFE_UPDATES = 0;
-- 4.Display yearly report which shows year wise no. of joinings?
select * from emp;
select count(empno)as "no.Ofjoinings" ,date_format(hiredate,'%Y')as years from emp group by years;

-- 5.Display monthly report which shows month wise no. of joinings?
select count(empno)as "no.Ofjoinings" ,date_format(hiredate,'%M')as months from emp group by months;

-- 6. Create a seperate table from existing emp table for emps who have recently joined (i.e. last year).
CREATE TABLE emps AS (SELECT * FROM emp having date_format(now(), '%Y')-date_format(hiredate,'%Y')<2 );

select * from emps;

-- 29. Procedure and Function:
-- 1. Create a procedure to Display employees experience level with company. (With In as Empid and Out as Level)
-- If worked more than 2 and less than 4 years  - Middle
-- If worked more than 4 years - Seniour else Juniour

use mydb;

DELIMITER $$
create procedure experiencelevel(IN empId int,OUT Elevel varchar(20))
BEGIN
declare experience Varchar(20);
SELECT date_format(now(),'%Y')-date_format(hiredate,'%Y') INTO experience
	FROM emp WHERE empno=empId;
    IF experience >2 and experience<=4 THEN
		SET Elevel='Meddle';
	ELSEIF experience >4 THEN
		SET Elevel='Seniour';
	ELSE 
		SET Elevel='Juniour';
	END IF;
END $$
DELIMITER ;
-- drop procedure
DROP PROCEDURE mydb.GetAllEmployeeDept;

select * from emp;
call experiencelevel(7566,@exp);
select @exp as employeeExperience;
-- show procedure
show procedure status where db='mydb';

-- call procedure
CALL  GetAllEmployeeDept();
-- ==============================

-- Create a function to give incremented salary value if passed Int and Percentage parameter.
-- salIncre(2000,10) --> Output 2200   (10% incremented)  

DELIMITER $$
CREATE FUNCTION SalaryIncrement(salary int,inc int)
RETURNS int
DETERMINISTIC 
BEGIN
	declare newsal int;
    SET newsal=salary+((salary*inc))/100;  
    return newsal;
END $$
DELIMITER ; 

select empno,sal,SalaryIncrement(sal,10)as newsalary from emp;

===================================
DELIMITER $$
CREATE FUNCTION HikeSalary(salary int,inc int)
RETURNS int
DETERMINISTIC 
BEGIN
	declare newsal int;
    SET newsal=salary+((salary*inc))/100;  
    return newsal;
END $$
DELIMITER ; 

select empno,sal,SalaryIncrement(sal,10)as newsalary from emp;

-- ------------------------------------------------------------------------------------











-- PROCEDURE AND FUNCTIONS
-- CREATE A PROCEDURE TO DISPLAY EMPLOYEES EXPERIENCE LEVEL WITH COMPANY ?

delimiter &&
create function salIncre(
sal decimal(10,2),percentage int)
returns decimal(10,2)
deterministic 
begin
       set sal = sal+((sal*percentage)*0.01);
       return sal;
end &&
delimiter ;

DROP FUNCTION salIncre;

show function status where db = "mydb";
select salIncre(2450,7) as sallevel;






-- ===================================================================
DELIMITER $$
CREATE PROCEDURE GetEmpLevel(IN EMPID INT, OUT LEVEL VARCHAR(20))
BEGIN
	DECLARE YEARDIFF INT;
    select timestampdiff(YEAR,hiredate,CURDATE()) INTO YEARDIFF from emp WHERE empno = EMPID;
    IF YEARDIFF > 4 THEN
		SET LEVEL = "SENIOR";
	ELSEIF YEARDIFF BETWEEN 2 AND 4 THEN
		SET LEVEL = "MIDDLE";
	ELSE
		SET LEVEL = "JUNIOR";
	END IF;
END $$ 
DELIMITER ;

call GetEmpLevel(1177,@level);
