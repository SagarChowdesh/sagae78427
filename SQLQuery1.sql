+
umSELECT NAME, FILENAME FROM SYS.SYSALTFILES

CREATE DATABASE Payroll
Use Payroll

Create Table tblDepartments
( 

DepartmentID int,
EmployeeName varchar(50),
Location varchar(50)
)

drop table tblDepartments



 
 insert into tblEmployee values(2926,'Nishanth','DB','10/16/2023','nishanth@excelindia.com','Mysore',18000,10)
 insert into tblEmployee values(2927,'Sagar','Software Engineer Trainee','10/28/2023','sagar@excelindia.com','Tumkur',30000,20)
 insert into tblEmployee values(2928,'Ganesh','Back end','11/20/2023','ganesh@excelindia.com','Tipturu',18000,30)
 insert into tblEmployee values(2929,'Pavithra','HR','10/08/2023','pavithra@excelindia.com','Bangalore',20000,40)
 insert into tblEmployee values(2929,'Amjali','HR','10/08/2023','anjali@excelindia.com','Bangalore',20000,40)
 insert into tblEmployee values(2931,'Prajwal','Front end','10/16/2023','prajwal@excelindia.com','Mysore',10000,60)
 insert into tblEmployee values(2932,'Bhommika','DB','10/08/2023','bhoomika@excelindia.com','Tumkur',45000,70)
 insert into tblEmployee values(2933,'Rajshaker','Software Trainee','08/28/2016','rajshaker@excelindia.com','Hebbal',15000,80)
 insert into tblEmployee values(2934,'Manoj','PHP developer','04/23/2012','manoj@excelindia.com','Kolar',90000,90)
 insert into tblEmployee values(2935,'Mandara','Sales','03/15/2023','Mandara@excelindia.com','Shimoga',15000,10)



 select *
 from tblEmployee
 select *
 from tblDepartments





insert into tblDepartments values(10,'DB','Mysore')
 insert into tblDepartments values(20,'Software Engineer Trainee','Tumkur')
 insert into tblDepartments values(30,'Back end','Tipturu')
 insert into tblDepartments values(40,'HR','Bangalore')
 insert into tblDepartments values(50,'HR','Bangalore')
 insert into tblDepartments values(60,'Front end','Mysore')
 insert into tblDepartments values(70,'DB','Tumkur')
 insert into tblDepartments values(80,'Software trainee','Hebbal')
 insert into tblDepartments values(90,'PHP developer','Kolar')
 insert into tblDepartments values(10,'Sales','Shimoga')






                                      

 alter tblEmployee
 delete tblEmployee where employee=2926
 insert into tblEmployee values(2929,'Manu','DB',11/16/2023,'manu@excelindia.com','mandya',18000,10)

 update tblEmployee
 set DepartmentID=40
 where EmployeeName='Manu'
---------------------------------------------------------------------------------------------------------------------------
                                          Assignemt- 1
-----------------------------------------------------------------------------------------------------------------------------
 2. select*
 from tblemployee

 3. select Employeename, Employee, DepartmentID
 from tblEmployee

 4. select Employeename, Employee, 
 from tblEmployee
 where departmentID in ('20','40')

 5. select*
 from tblEmployee
 where role='Software Engineer Trinee' and salary<2000

 6. select *
 from tblEmployee
 where DepartmentID=20 and salary>2000

 7. select *
 from tblEmployee
 where hiredate is NULL

 8. select EmployeeName,DepartmentID
 from tblEmployee
 where role='business analyst'

 9. select employeename,role,salary
 from tblemployee
 where departmentID=30 and salary between 20000 and 40000

 10. SELECT DISTINCT  hiredate FROM TBLEMPLOYEE ORDER BY hiredate

 11. select *
 from tblemployee
 where departmentID in (20,30) and salary>20000

 12. select departmentID, role, datepart(day,hiredate) as day,datepart(month,hiredate) as month, datepart(year,hiredate) as year
     from tblemployee
     where  departmentID=20 




 13. select Employeename
from tblemployee
where substring (employeename,1,1) in ('a','e','i','o','u')
       or
	   
	   select EmployeeName
from tblEmployee
where EmployeeName like '%[aeiou]%'

14. select *
 from tblemployee
 where Employeename like '_________'

15 SELECT EMPLOYEENAME 
 FROM TBLEMPLOYEE
 WHERE EMPLOYEENAME LIKE '%N%'

16.  select *
 from tblemployee
 where datediff (year,joindate,'2023-10-19')>3

 17. select *
 from tblemployee
 where datepart(DW,hiredate)=2


 18.SELECT *
 FROM TBLEMPLOYEE
 WHERE day(hiredate)=1

 19 SELECT *
 FROM TBLEMPLOYEE
 WHERE Month(hiredate)=1

 select joindate
 from tblemployee
 where day(joindate)=8
 
 20. select employeeName
from tblemployee
where employeename like '% _% _%'

     or like '% _ _'

21. alter table tblemployee
add bonus int

22. update tbldepartments
set departmentname='' 
23. update tblemployee 
set bonus=10000
where datediff(YYYY,joindate,getdate())>=2

24. select salary+ ISNULL(bonus,0) as totalsalary       or isnull---> coalesce
from tblemployee

(to rename column)
exec sp_rename 'tbldepartments.employeename','departmentname','column'
------------------------------------------------------------------------------------------------------------------------
=-------------------------------------------------------------------------------------------------------------------------------
 
 
 
 
 16.  select *
 from tblemployee
 where datediff (year,joindate,'2023-10-19')>3

 17. select *
 from tblemployee
 where datepart(DW,joindate)=2

 

 15 SELECT EMPLOYEENAME 
 FROM TBLEMPLOYEE
 WHERE EMPLOYEENAME LIKE '%N%'

 . SELECT *
 FROM TBLEMPLOYEE
 WHERE datepart(wk, joindate) =2

 19 SELECT *
 FROM TBLEMPLOYEE
 WHERE Month(joindate)=1

 14. select *
 from tblemployee
 where Employeename like '_________'

 15. select employeename
 from tblemployee
 where employeename like 'A%'

 

20. select employeename
from tblemployee
where employeename like '% %'; or like '% _ _'

21. alter table tblemployee
add bonus int

22. update tbldepartments
set departmentname=null
where departmentname='software engineer trainee'

23. update tblemployee 
set bonus=10000
where (dateadd(YYYY,joindate,getdate()))>=2

24.  select sum(salary)+bonus
from tblemployee
where salary=(select sum(salary)from 
group by employeename

update table tbldepartments
rename column employeename to departmentname
-------------------------------------------------------------------------------------------------------------------------
1. select getdate()
 
2. select datepart (month,getdate())

3. select employeename
from tblemployee
where employeename like '%t'

4. select EmployeeName
from tblEmployee
where EmployeeName like '%y%'

5. select employeename+location as 'emp loc', salary,salary*.5 as ' hike'
from tblemployee

3. CREATE TABLE STUDENT (
     STUDENTID INT UNIQUE,
	 STUDENTNAME VARCHAR(50) NOT NULL,
	 STUDENTLOCATION VARCHAR(50) NOT NULL,
	 AGE INT ,
	 CONSTRAINT CHK_AGE CHECK(AGE>20))

	 INSERT INTO STUDENT (STUDENTID,STUDENTNAME,STUDENTLOCATION,AGE)
	 VALUES(10,'SAGAR','MYSORE',22)

	 SELECT *
	 FROM STUDENT

23. create table emp(
      id int,
	  lastname varchar(50) not null,
	  firstname varchar(50) not null,
	  age int,
	  constraint pk_id primary key (id,lastname))

	 INSERT INTO emp (id,lastname,firstname,AGE)
	 VALUES(10,'sagar','chowdesh',22)
	 INSERT INTO emp (id,lastname,firstname,AGE)
	 VALUES(10,'nishanth','sagar',22)
	 
	 SELECT *
	 FROM emp

----------------------------------------------------------------------------------------------
	                                   Assignment -2
-----------------------------------------------------------------------------------------------------

24. Create Table tblEmployee2
( 
EmployeeID int primary key,
EmployeeName varchar(50) not null,
Role varchar(50) not null,
Hiredate date default getdate(),
EmailID varchar(50) not null unique,
Salary int check(salary>15),
DepartmentID int Foreign  key references tblDepartment2(departmentID),
)


\insert into tblEmployee2(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0021,'Nishanth','DB','10/16/2023','nishanth@excelindia.com',18000,2926)
insert into tblEmployee2(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0023,'Ganesh','Back End','11/10/2018','ganesh@excelindia.com',50000,2928)
insert into tblEmployee2(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0024,'Anjali','HR','07/08/2025','anjali@excelindia.com',46000,2929)
insert into tblEmployee2(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0025,'Rajshaker','PHP Developer','02/14/2023','rajshaker@excelindia.com',65000,2930)
insert into tblEmployee2(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0022,'Pooja','Software Engineer Trainee','02/25/2021','pooja@excelindia.com',25000,2927)

SELECT*
from tblemployee2
---------------------------------------------------------------------------------------------------------------
 
create table tblDepartment2
(
DepartmentID int primary key ,
DepartmentName varchar(50) not null,
Location varchar(50) not null
)

insert into tblDepartment2(Departmentid,Departmentname,Location)
values (2926,'DB','mysore')
insert into tblDepartment2(Departmentid,Departmentname,Location)
values (2927,'Software Engineer Trainee','tumkur')
insert into tblDepartment2(Departmentid,Departmentname,Location)
values (2928,'Back End','shivamogga')
insert into tblDepartment2(Departmentid,Departmentname,Location)
values (2929,'HR','managlore')
insert into tblDepartment2(Departmentid,Departmentname,Location)
values (2930,'PHP Developer','bangalore')

select *
from tblDepartments

--------------------------------------------------------------------------------

create table tblSubject
(
SubjectID int primary key,
SubjectName Varchar(50) not null
)

insert into tblSubject(SubjectID,SubjectName)
values(101,'English')
insert into tblSubject(SubjectID,SubjectName)
values(102,'Kannada')
insert into tblSubject(SubjectID,SubjectName)
values(103,'Social')
insert into tblSubject(SubjectID,SubjectName)
values(104,'Science')
insert into tblSubject(SubjectID,SubjectName)
values(105,'Maths')

select *
from tblSubject
---------------------------------------------------------------------------
create table tblStudent
(
StudentID int primary key,
StudentName Varchar(50) not null
)

insert into tblStudent(StudentID,StudentName)
values(001,'Sagar')
insert into tblStudent(StudentID,StudentName)
values(002,'Nishanth')
insert into tblStudent(StudentID,StudentName)
values(003,'Pooja')
insert into tblStudent(StudentID,StudentName)
values(004,'Anjali')
insert into tblStudent(StudentID,StudentName)
values(005,'Rajshaker')

select*
from tblStudent
---------------------------------------------------------------------------
create table tblStudentSubMarks
(
StudentID int foreign key references tblStudent(StudentId),
SubjectID int Foreign Key references tblSubject(SubjectID),
Constraint primarykey_id primary key(studentid,subjectiD),
Marks decimal not null
)

insert into tblStudentSubMarks(StudentID,SubjectID,Marks)
values(001,101,98.42)
insert into tblStudentSubMarks(StudentID,SubjectID,Marks)
values(002,102,82.34)
insert into tblStudentSubMarks(StudentID,SubjectID,Marks)
values(003,103,90.12)
insert into tblStudentSubMarks(StudentID,SubjectID,Marks)
values(004,104,77.98)
insert into tblStudentSubMarks(StudentID,SubjectID,Marks)
values(005,105,65.55)

select*
from tblStudentSubMarks

-----------------------------------------------------------------------------------------------------------------
                              25\10\23
------------------------------------------------------------------------------------------------------------------
1. select employeename, max(salary)
from tblemployee2
where salary=(select max(salary)
       from tblemployee2)

2. select designation, departmentID, count(*)
from tblemployee
group by designation ,departmentID
having designation,departmentID
order by count(*) desc
-------------------------------------------------------------------------------------------------
                                       Assignment-3

====================================================================================================
1. select *
from tblemployee2
order by hiredate asc, employeename desc;

2. exec sp_rename 'tblemployee2.employeename','emplyee_firstname','column'
alter table tblemployee2
add employee_lastname varchar(50)

select*
from tblemployee

3. exec sp_rename 'tblemployee2','Employees'

4. update tblemployee
set salary=35000
where location='mysore'

5. update tblemployee
set designation=' '
where designation ='software engineer trainee'

6. alter table employees 
add bonus money
update tblemployee set bonus=salary*10 where datediff(yyyy,joindate,getdate())>2;

7.select  top 5 salary,employeename
from tblemployee
where location in ('mysore','hyderbad')
order by salary desc

8. select top 3 with ties salary, employeename
 from tblemployee
 order by salary desc

9. select top 1 percent *
from tblemployee
where location in ('noida','bangalore')
order by salary desc

10. select avg(salary) as avgsalary, sum(salary) as sumsalary,designation
from tblemployee
group by designation

11. select max(salary) as maxsalary ,designation
from tblemployee
group by designation

12. select min(salary) as minsalary,designation
from tblemployee
group by designation

13. select designation, max(salary)-min(salary)
 from tblemployee
 group by designation

14. select avg(salary) as Maxsalary,sum(salary) as Sumsalary
from tblemployee
where designation='software trainee'

15. select count(distinct designation) as totaldifferentjob
from tblemployee
where departmentID=30;

17. select count(employeename) as employee,avg(salary*12),designation
from tblemployee
group by designation;

16 select max(salary) as higestsalary, min(salary) as lowestsalary
from tblemployee
where designation not like'%manager%' 

18. select joindate, count(*)
 from tblemployee
 group by joindate
 having count(*)>1

19.  same as 18 joindate=experience

20. select designation ,salary,count(*) ---------------->department
 from tblemployee
 group by designation,salary
 having count(*)>1

21. select designation ,count(*) as above35years      ---------------->department
 from tblemployee
 where datediff( yyyy,joindate,getdate())>35
 group by designation;

                      JOINS   26/10/23
============================================================================================================================
CREATE TABLE Salesmen(
Snum int primary key,
Sname varchar(20),
city varchar(20),
Comission decimal(6,2))

select*
from salesmen

CREATE TABLE orders(
Onum int primary key,
OAmt decimal(7,2),
Odate datetime ,
Cnum int references customers(cnum),
Snum int references salesmen(Snum))

select *
from orders

select *
from Customers

Create table customers(
Cnum int primary key,
Cnam varchar(20),
City varchar(20),
Rating int,
Snum int references salesmen(Snum))

1. SELECT Onum,cnam,oamt,odate
from customers inner join orders
on orders.cnum=customers.cnum 


INSERT INTO Salesmen VALUES(1005,'Sagar','Mysore',0.3)

2. Select Cnam,Sname
from customers 
RIGHT join salesmen ON salesmen.snum=customers.snum

3. select Onum,Cnam,Sname,OAmt,Odate
From Customers inner join orders
on customers.cnum=orders.cnum inner join salesmen on salesmen.snum=orders.snum

4. Select Sname,Cnam,Oamt
from Customers inner join orders
on customers.cnum=orders.cnum inner join salesmen on salesmen.snum=orders.snum
order by sname desc

5. select cnam,Oamt, Odate
from customers left join orders 
ON customers.cnum=orders.cnum
order by oamt asc

6. Select Sname, count(Cnum)
from customers 
right join salesmen ON salesmen.snum=customers.snum
Group by sname

7. Select Cnam,count(onum) as 'Orders number'
from customers 
left join orders ON orders.cnum=customers.cnum
group by Cnam
having count(Onum)>1

8. Select Customers.city as 'Customers city',count(ONum) as totalorder,SUM(OAmt) as totaRevenue
from Customers left join orders
on customers.cnum=orders.cnum 
group by customers.city

=============================================================================
1. Select EmployeeName,DepartmentName
   From tblEmployee1 inner join tblDepartment1
   ON DepartmentID.tblEmployee1=DepartmentID.tblDepartment1

   alter table tblemployee
   add ManagerID int null

   select *
   from tblemployee

======================================================================================
                             self join
=========================

1.   SELECT E1.employeename,E2.employeename as 'manager'
   from tblemployee E1 INNER JOIN tblEmployee E2
   ON E1.managerID=E2.employee
   
 ----->  NO OF EMPLOYEE REPORTING TO MANAGER

2. SELECT E2.managerID,count(E1.employee)
   from tblemployee E1 RIGHT JOIN tblEmployee E2
   ON E1.managerID=E2.employee   
   group by E2.Managerid
                              
   -------------- at least onE
3. SELECT E2.managerID,count(E1.employee)
   from tblemployee E1 INNER JOIN tblEmployee E2
   ON E1.managerID=E2.employee   
   group by E2.Managerid
   having count(e1.employee)>0



   ON E1.employee=E2.managerID


                                          27/10/23
==========================================================================================================================
Create drop table tblCustomers(
CustID int Primary Key,                       ----------------->C
CustName Varchar(10) NOT NULL,
CustType Char(1))

select *
from tblcustomers

Create Table tblCategory(     ----------------c1
CID char(4) primary key,
CName varchar(10))

select *
from tblcategory

Create Table tblToys(            ------------------>t1
ToyID char(5) primary key ,
ToyName Varchar(50) unique not null,
CID char(4) references tblcategory(CID) not null,
Price int not null,
Stock int not null)
-
select *
from tbltoys

Create table tblTransaction(          ----------->T
TxnID int primary key,
CustID int references tblcustomers(custID),
ToyID char(5) references tblToys (toyId),
Quantity int,
TxnCost int)

select *
from tbltransaction


1. select C.CustName , Sum(T.TxnCost) AS 'TotalPurchase'
from tblCustomers C inner join tblTransaction T
ON C.CustID=T.CustID 
group by C.CustName
having count(T.TxnCost)>1000;

2. Select T1.ToyID, Count(T.Quantity) AS 'Total Quantity' ----> coalesce (count(T1.quantity),0)
from tblToys T1 inner join tblTransaction T
ON T1.ToyID=T.ToyID
group by T1.ToyID

3. select TOP 1 C1.CName, T1.ToyName,sum(T.Quantity) 
from tblTransaction T  inner join tbltoys T1
On T.ToyID=T1.ToyID inner join tblcategory C1
ON  T1.CID=C1.CID
group by T1.ToyName,C1.CName
order by sum(T.Quantity) desc



=========================================================================================================================




Create Table tblPatient(
PatientID  char(5) primary key,
Pname varchar(50),
City varchar(50))

Select *
from tblPatient

Create table tblDoctor(
DoctorID char(5) primary key,
Dname varchar(50),
Dept varchar(50),
salary int)

select *
from tbldoctor

Create Table tblConsultation(
ConsultationID int unique,
PatientID char(5) references tblPatient(patientID),
DoctorID char(5) references tblDoctor(doctorID),
Fee int)

select *
from tblconsultation

--------------> display 4th Maximum salary
1. Select max(salary) As 'maxsalary'
from tblemployee
where salary=(select max(salary)
from tblemployee
where salary<(select max(salary)
from tblemployee
where salary<(select max(salary)
from tblemployee
where salary<(select max(salary)
from tblemployee))));

2. 



===================================================================================================================================
                                                    30/10/23

Create table AccountTransaction(
Tid int primary key,
AccNo int foreign key references CustomerDetails(AccNo),
Amount money,
DateofTrans date,
TransType int foreign key references TransactionType(TransType))

Create table Accounttype(
AccType int primary key,
Accountname varchar(50))

create table TransactionType(
TransType int primary key,
TransName varchar(50))

create table CustomerDetails(

AccNo int primary key,
CustName varchar(50),
Address Varchar(50),
AccType int Foreign key references Acc




INSERT INTO Salesman (Sid, Sname, Location)
VALUES
    (1, 'John Smith', 'New York'),
    (2, 'Jane Doe', 'Los Angeles'),
    (3, 'Robert Johnson', 'Chicago'),
    (4, 'Alice Brown', 'Houston'),
    (5, 'Michael Davis', 'Miami');

-- Insert sample data into the Product table
INSERT INTO Product (Prodid, Pdesc, Price, Category, Discount)
VALUES
    (101, 'Laptop', 800.00, 'Electronics', 0.10),
    (102, 'Smartphone', 500.00, 'Electronics', 0.05),
    (103, 'Desk Chair', 100.00, 'Furniture', 0.15),
    (104, 'Coffee Maker', 50.00, 'Appliances', 0.08),
    (105, 'T-shirt', 20.00, 'Clothing', 0.20);

-- Insert sample data into the Sale table
INSERT INTO Sale (Saleid, Sid, Sldate, Amount)
VALUES
    (1001, 1, '2023-10-30', 720.00),
    (1002, 2, '2023-10-30', 475.00),
    (1003, 3, '2023-10-30', 95.00),
    (1004, 4, '2023-10-30', 42.00),
    (1005, 5, '2023-10-30', 15.00);

-- Insert sample data into the Saledetail table
INSERT INTO Saledetail (Saleid, Prodid, Quantity)
VALUES
    (1001, 101, 2),
    (1002, 102, 1),
    (1003, 103, 4),
    (1004, 104, 3),
    (1005, 105, 5);


















