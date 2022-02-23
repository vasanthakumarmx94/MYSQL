

use poctask;

select * from employee;

create database checkemplyeedb;
use checkemplyeedb;
Create table tbl_Employees  
(  
     Id int primary key ,  
     FirstName varchar(50),  
     LastName varchar(20),  
     Location varchar(20),  
     Gender varchar(50),  
     Salary int  
) ;

Insert into tbl_Employees values (1,'Chittaranjan', 'Swain','Odisha', 'Male', 80000);
Insert into tbl_Employees values (2,'Chandin', 'Swain', 'Pune','Female', 76000);  
Insert into tbl_Employees values (3,'Mitu', 'Pradhan','Delhi', 'Male', 55000); 
Insert into tbl_Employees values (4,'Jeni', 'Swain','Chennai', 'Female', 76000) ;
Insert into tbl_Employees values (5,'Adyashree', 'Swain','UK', 'Female', 49000);  
Insert into tbl_Employees values (6,'Ram', 'Kumar','US', 'Male', 39000);  
Insert into tbl_Employees values (7,'Jitendra', 'Gouad','Hydrabad', 'Male', 35000);  
Insert into tbl_Employees values (8,'Dibas', 'Hembram','Bangalore', 'Male', 55000);


select * from tbl_Employees ;
Select Max(Salary) as Salary from tbl_Employees ;
Select MIN(Salary) as Salary from tbl_Employees ;
select distinct salary from tbl_Employees order by Salary desc ;
select * from tbl_Employees ORDER BY `Salary` asc limit 5,3;

select * from tbl_Employees ORDER BY `Salary` asc;
SELECT *,Salary from tbl_Employees e1 where 
        3-1= (SELECT COUNT(DISTINCT salary)from tbl_Employees e2 where e2.Salary > e1.Salary) ;

Select * from tbl_Employees order by Salary DESC limit 3,1;








