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

CALL `mydb`.`GetEmpLevel`(7566, @v);


select * from emp;




 -- Q28
-- DATE FUNCTIONS
-- DISPLAY THE MOST SENIOUR EMPLOYEE?
select sal from emp;

select * from emp where period_diff(date_format(now(),'%d%Y%m'),date_format(hiredate,'%d%Y%m'))=
(select max(period_diff(date_format(now(),'%d%Y%m'),date_format(hiredate,'%d%Y%m'))) from emp);

SELECT * FROM EMP WHERE HIREDATE > (SELECT MIN(datediff(CURDATE(),HIREDATE)) FROM EMP);
-- GIVE 5% INCREMENT TO EMPLOYEES WHO ARE HERE SINCE LAST 3 YEARS?
SELECT SAL*0.05 AS NEWSAL FROM EMP WHERE DATEDIFF(CURDATE(),HIREDATE)> 3;

SELECT HIREDATE, (0.05*SAL) AS INCREMENTAL , YEAR(CURdATE())-YEAR(HIREDATE) AS EXP
                      FROM EMP  
                      WHERE YEAR(CURDATE())-YEAR(HIREDATE)>= 3;
                      

-- GIVE 7% INCREMENT TO EMPLOYEES WHO ARE HERE SINCE LAST 5 YEARS AND SALARY < 2000?
SELECT SAL*0.07 AS NEWSAL FROM EMP
      WHERE DATEDIFF(CURDATE(),HIREDATE)> 5 AND SAL < 2000;
      
SELECT HIREDATE, (0.07*SAL) AS INCREMENTAL , YEAR(CURdATE())-YEAR(HIREDATE) AS EXP
                      FROM EMP  
                      WHERE YEAR(CURDATE())-YEAR(HIREDATE)>= 5 AND SAL<2000;

-- DISPLAY YEARLY REPORT WHICH SHOWS YEAR WISE NO OF JOININGS?
SELECT COUNT(*)
 AS JOINING, date_format(HIREDATE , "%Y") AS YEAR FROM EMP
                                         GROUP BY YEAR;
                                         
-- DISPLAY MONTHLY REPORT WHICH SHOWS MONTH WISE NO.OF JOININGS?
SELECT COUNT(*)
 AS JOINING, date_format(HIREDATE , "%M") AS MONTH FROM EMP
                                         GROUP BY MONTH;
                                         
                                         
                                         
                                         
                                         
-- ============================================================



-- GIVE 7% INCREMENT TO EMPLOYEES WHO ARE HERE SINCE LAST 5 YEARS AND SALARY < 2000?
SELECT SAL*0.07 AS NEWSAL FROM EMP
      WHERE DATEDIFF(CURDATE(),HIREDATE)> 5 AND SAL < 2000;  

SELECT HIREDATE, (0.07*SAL) AS INCREMENTAL , YEAR(CURdATE())-YEAR(HIREDATE) AS EXP
                      FROM EMP
                      WHERE YEAR(CURDATE())-YEAR(HIREDATE)>= 5 AND SAL<2000;

-- DISPLAY YEARLY REPORT WHICH SHOWS YEAR WISE NO OF JOININGS?
SELECT COUNT(*) AS JOINING, date_format(HIREDATE , "%Y") AS YEAR FROM EMP
                                         GROUP BY YEAR;  

-- DISPLAY MONTHLY REPORT WHICH SHOWS MONTH WISE NO.OF JOININGS?
SELECT COUNT(*) AS JOINING, date_format(HIREDATE , "%M") AS MONTH FROM EMP
                                         GROUP BY MONTH;