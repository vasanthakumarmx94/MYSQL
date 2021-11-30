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
 
 
 
 
 