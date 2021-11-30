USE mydb;
-- all clms
SELECT * FROM EMP;

select *,EMPNO from EMP;

select JOB,SAL,DEPTNO FROM EMP;

SELECT EMPNO,SAL AS oldsal,(SAL*1.05)AS newsal FROM EMP;
select 100*1.05 As Result;

SELECT empno,sal FROM EMP order by empno;

select empno,ename,sal from emp where sal>1200 order by empno desc;

select * from emp where  sal>800 and sal<3000 and deptno>20;

select * from emp where  sal<1000 or sal>1600;

select * from emp where (sal between 1000 and 2000) or (sal between 5000 and 6000) ;

select * from emp where sal not between 1200 and 2000;

select * from emp where job in('CLERK','MANAGER','PRESEDENT');

select * from emp where job not in('CLERK','MANAGER','PRESEDENT');

-- like
select ename from emp where ename like 'A%';
select ename from emp where ename like '_A%';
select ename from emp where ename like '_AR%';
select ename from emp where ename like '%D';
select ename from emp;
-- limit ,offset
select * from emp LIMIT 5;
select * from emp where job in('CLERK','MANAGER','PRESEDENT') order by empno Limit 5;

select * from emp where job in('CLERK','MANAGER','PRESEDENT') order by empno Limit 2,5;
-- 7369,7566,7782,7839
select * from emp LIMIT 5;

select * from emp where comm IS NULL and mgr IS NOT NULL;

select distinct sal,job from emp;
select * from emp;

select * from emp where sal between 2000 and 6000 ;

select * from emp where job in('CLERK','PRESIDENT') order by sal desc;

select * from emp where mgr in(7902,7698,7839,7566,7788);

select empno,ename,sal from emp  where job in('SALESMAN','CLERK','ANALYST') and
 sal between 2000 and 6000 Limit 5; 

select * from emp where job='MANAGER' order by empno asc;

select empno,ename,sal,(SAL*10/100)AS newsal from emp where job='MANAGER';

select ename,sal from emp where ename like '__R%' and job='SALESMAN';
-- alias colm name
select ename employee_name from emp;
select ename 'employee_name' from emp;
select ename as employee_name from emp;

select max(sal),min(sal),avg(sal) from emp;

select max(sal) from emp;
-- hiest salary  emp details 
select * from emp where sal=(select max(sal) from emp);

-- secand hiest salary
select * from emp where sal=
	(select max(sal) from emp -- second max
		where sal<
			(select max(sal) from emp)); -- max


select e.ename from(select * from emp where sal<3000) as e;

-- to describe the table 
DESCRIBE emp;
-- joining 

-- ON is used when diff column names
select e.empno,e.sal,d.dname,d.loc
from EMP e
INNER JOIN DEPT d ON e.deptno=d.deptno;

-- USING used when same column name
select e.empno,e.sal,d.dname,d.loc
from EMP e
INNER JOIN DEPT d USING(deptno);
-- count
SELECT count(*) from(select e.*,dname,d.loc
from EMP e
INNER JOIN DEPT d using(deptno))x;

select e.*,d.loc
from EMP e
INNER JOIN DEPT d USING(deptno);


select e.*,d.loc
from EMP e
RIGHT JOIN DEPT d USING(deptno);

select e.*,d.loc
from EMP e
LEFT JOIN DEPT d USING(deptno);

INSERT INTO EMP VALUES(111,'xyz','clerk',null,null,2000,null,50);
INSERT INTO DEPT VALUES(60,'UNKNOWN','NA');

USE mydb;

select e.*
from EMP e
LEFT JOIN DEPT d USING(deptno) where d.deptno IS NULL;

select count(*) from(select e.*
from EMP e
CROSS JOIN DEPT d)x;
-- 15*5=75



-- ===================================================
-- day 2 SQL
use mydb;

select count(*) from emp;

select * from emp;
select deptno,count(*) as COUNTER from emp where deptno>10 
group by deptno order by 2 desc;

select deptno, count(*) as emps, max(sal) as maxsal, 
min(sal) as minsal from emp group by 1;
select deptno, count(*) as emps
from emp group by 1 having emps>4;
select deptno
from emp group by 1 having max(sal)>3000;




select empno,ename,job, avg(sal)as averagesal from emp 
group by job;

select empno,ename,job,deptno,max(sal)as maxsalary, 
avg(sal)as averagesal from emp group by deptno
 having averagesal>2000;

select empno,ename,deptno,max(sal) as maxsalary 
from emp where deptno>10  group by deptno having maxsalary>3000 ;

select empno,ename,deptno,job,max(sal)as maxsalary 
from emp where job  not in('MANAGER') group by job  ;
 
 
 select *  from emp;
 
 select curdate(); 
 select curtime();
 select now();
 select sysdate();
 
 select date_add('2021-10-25',interval 30 day);
select date_add('2021-10-25',interval 30 day);
 
 select date_add(curdate(),interval 1 year);
 select date_add(curdate(),interval 10 hour);
 
 select datediff('2021-10-25','2021-08-25');
 select date('2021-10-25 16:12:10')as mydate;
 
 select datname(curdate(),dayofmonth(),curdate(),dayofweek(),dayofyear());
 -- 2 date query 
 select hour(curdate()),minute(curtime());
 
 select date_format('2021-10-25 16:12:10','%w %m %y');
 select date_format('2021-10-25 16:12:10','%H :%i %s %p');
 select date_format('2021-10-25 16:12:10','%h :%i %s ');
 
 -- %j is day of year
 select date_format('2021-10-25 16:12:10','%D :%y %a %d %m %b %j');

 select * from emp ;
 select * from dept;
 
 select empno,ename,sal,(sal* 1.05) as newsal,min(datediff(curdate(),hiredate)) as daytediff from emp ;
 
 select empno,ename,sal, count(empno) from emp group by deptno having min(datediff(curdate(),hiredate));
 
 select ename,sal,e.deptno,d.loc,hiredate ,max(datediff(curdate(),hiredate)) from emp e,dept d where  e.deptno=d.deptno ;
 
 
 select period_diff(date_format(now(), '%Y%m'), 
 date_format(hiredate, '%Y%m')) as months from emp;
 
 -- correct
 select e.ename,e.sal,d.deptno,d.dname from emp e 
 inner join dept d
 using (deptno) where datediff(curdate(),e.hiredate)=
 (select max(datediff(curdate(),hiredate)) from emp);
 
-- juniors
SELECT COUNT(*) as juniors FROM EMP WHERE 
period_diff(date_format(now(), '%Y%m'), date_format(hiredate, '%Y%m')) = 
(select MIN(period_diff(date_format(now(), '%Y%m'), date_format(hiredate, '%Y%m'))) FROM emp);
 
 -- update 
 SET SQL_SAFE_UPDATES=0;
 
 update emp set sal=1600,comm=500 where deptno in(30,20);
 
 delete from emp where deptno=30;
 
 
 
 



