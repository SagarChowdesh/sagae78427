CREATE TABLE tblDirectors(
Director_id int PRIMARY KEY,
First_name varchar(150) Not Null,
Last_name varchar(150) NOT NULL
);

select * from tblDirectors

INSERT INTO Public.tblDirectors(Director_id,First_name,Last_name)
VALUES (1,'Joshna','Priya'),
(2,'Sri','Krishna'),
(3,'Varsha','Mahadev'),
(4,'Sandhya','Shree'),
(5,'Anusha','Gowda'),
(6,'Joyline','Maxima');

CREATE TABLE tblMovies(
Movie_id int PRIMARY KEY,
Movie_name varchar(100) NOT NULL,
Movie_length int NOT NULL,
Movie_lang Varchar(20) NOT NULL,
Movie_certificate varchar(5) NOT NULL, 
Release_date date NOT NULL,
Director_id int references tblDirectors(Director_id)
);

 select * from tblMovies
 
INSERT INTO Public.tblMovies(Movie_id,Movie_name,Movie_length,Movie_lang,Movie_certrificate,Release_date,Director_id)
VALUES(1,'Leo',250,'Tamil','B','2023-11-08',1),
(2,'Mersal',250,'Tamil','B','2023-10-08',2),
(3,'Ghili',250,'Tamil','B','2023-09-08',3),
(4,'Master',250,'Tamil','B','2023-08-08',4),
(5,'Bigil',250,'Tamil','B','2023-07-08',5),
(6,'Thuppakki',250,'Tamil','B','2023-06-08',6),
(7,'Theri',250,'Tamil','B','2023-05-08',2),
(8,'Kushi',250,'Tamil','B','2023-04-08',1),
(9,'Thalaiva',250,'Tamil','B','2023-03-08',2),
(10,'Nanban',250,'Tamil','B','2023-02-08',3);



CREATE TABLE tblActors(
Actor_id int PRIMARY KEY,
First_name Varchar(150) NOT NULL,
Last_name Varchar(150) NOT NULL,
Gender char(2) NULL,
Date_of_birth Date NOT NULL,
Movie_id int References tblMovies(Movie_id)
)

select * from tblActors

INSERT INTO Public.tblActors(Actor_id,First_name,Last_name,Gender,Date_of_birth,Movie_id)
VALUES (1,'Vijay','Joseph','M','1980-11-08',10),
(2,'Vijay','Sethupathi','M','1981-11-08',9),
(3,'Medona','Sebastin','F','1982-11-08',8),
(4,'Samantha','RuthPrabhu','F','1983-11-08',2),
(5,'Rajini','Kanth','M','1984-11-08',6),
(6,'Jesmitha','Vegus','F','1985-11-08',5),
(7,'Dilip','Raju','M','1986-11-08',4),
(8,'Sanjay','Datt','M','1987-11-08',3),
(9,'Priya','Peter','F','1988-11-08',2),
(10,'Joshna','John','F','1989-11-08',1);

--1.Display Movie name, movie language and release date from movies table. 
SELECT Movie_name,Movie_lang,Release_date
FROM tblMovies;

--2.Display only 'Kannada' movies from movies table. 
SELECT Movie_name
FROM tblMovies
WHERE Movie_lang='Kannada';

--3.Display movies released before 1st Jan 2011. 
SELECT Movie_name
FROM tblMovies
WHERE (EXTRACT(YEAR FROM Release_date )<2011 
 AND EXTRACT(MONTH FROM Release_date )=1 
 AND EXTRACT(DAY FROM Release_date )=1);

--4.Display Hindi movies with movie duration more than 150 minutes. 
SELECT Movie_name          --(hindi)
FROM tblMovies
WHERE Movie_lang='Tamil' AND Movie_length>150;

--5.Display movies of director id 3 or Kannada language. 
SELECT Movie_name
FROM tblMovies
Where Director_id=3 or Movie_lang='Tamil';  --(kannada)

--6.Display movies released in the year 2023. 
SELECT Movie_name
FROM tblMovies
WHERE Extract(Year from Release_date)=2023;

--7.Display movies that can be watched below 15 years. 
SELECT Movie_name
FROM tblMovies
WHERE EXTRACT(YEAR FROM Release_date)<15;

--8.Display movies that are released after the year 2015 and directed by directorid 3.
SELECT Movie_name
FROM tblMovies
WHERE EXTRACT(YEAR FROM Release_date)>2015 AND Director_id=3;

--9.Display all other language movies except Hindi language. 
SELECT Movie_name
FROM tblMovies
WHERE Movie_lang !='Hindi'

--10.Display movies whose language name ends with 'u'. 
SELECT Movie_name
FROM tblMovies
WHERE Movie_name Like '%u';

--11.Display movies whose language starts with 'm'. 
SELECT Movie_name
FROM tblMovies
WHERE Movie_lang like 'T%';

--12.Display movies with language name that has only 5 characters. 
SELECT Movie_name
FROM tblMovies
WHERE LENGTH(Movie_name)=5;

--13.Display the actors who were born before the year 1980. 
SELECT First_name, Last_name
FRom tblActors
WHERE EXTRACT( YEAR FROM Date_of_birth)<1980;

--14.Display the youngest actor from the actors table. 
SELECT First_name,Last_name
FROM tblActors
ORDER BY Date_of_birth DESC
LIMIT 1;

--15.Display the oldest actor from the actors table. 
SELECT First_name,Last_name
FROM tblActors
ORDER BY Date_of_birth ASC
LIMIT 1;

--16.Display all the female actresses whose ages are between 30 and 35. 
SELECT First_name,Last_name
FROM tblActors
WHERE Gender='F' AND Extract (YEAR From Age(now(),Date_of_birth)) BETWEEN 30 AND 35;

--17.Display the actors whose movie ids are in 1 to 5. 
SELECT First_name,Last_name
FROM tblActors 
WHERE Movie_id in (1,5);

--18.Display the longest duration movie from movies table.
SELECT Movie_name
FROM tblMovies
ORDER BY Movie_length DESC
LIMIT 1;

--19.Display the shortest duration movie from movies table. 
SELECT Movie_name
FROM tblMovies
Order By Movie_length ASC
LIMIT 1;

--20.Display the actors whose name starts with vowels. 
SELECT First_name
FROM tblActors
WHERE SUBSTRING(First_name, 1 , 1) IN ('A','E','I','O','U');

--21.Display all the records from tblactors by sorting the data based on the fist_name in the 
--ascending order and date of birth in the descending order.
SELECT *
FROM tblActors
order by First_name Asc,Date_of_birth Desc;

--22.Write a query to  return the data related to movies by arranging the data in ascending order 
--based on the movie_id and also fetch the data from the fifth value to the twentieth value. 
 SELECT Release_date
 FROM tblMovies
 ORDER BY Movie_id ASC  
 OFFSET 4 ROWS
 FETCH FIRST 15 ROWS ONLY;
 
-------------------------------------------------------------------------------------
 --DATE:

--The DATE type is used for storing dates without any time information.
--Example: 2023-11-24

--TIME:

--The TIME type is used for storing time of day without any date information.
--Example: 14:30:00

--TIMESTAMP:

--The TIMESTAMP type is used for storing both date and time.
--Example: 2023-11-24 14:30:00

--TIMESTAMP WITH TIME ZONE:

--The TIMESTAMP WITH TIME ZONE type is similar to TIMESTAMP but includes time zone information.
--Example: 2023-11-24 14:30:00+00

--INTERVAL:

--The INTERVAL type represents a period of time.
--Example: INTERVAL '1 day'

--TIMETZ:

--The TIMETZ type stores time of day with time zone.
--Example: 14:30:00+00

--TIMESTAMP WITHOUT TIME ZONE:

--The TIMESTAMP WITHOUT TIME ZONE type is like TIMESTAMP but does not include time zone information.
--Example: 2023-11-24 14:30:00

--TIME WITHOUT TIME ZONE:

--The TIME WITHOUT TIME ZONE type is like TIME but does not include time zone information.
--Example: 14:30:00


SELECT First_name
FROM tblActors
WHERE First_name ~'^[aeioAEIOU].*$';
----------------------------------------------------------------------------
INSERT INTO ORDER(INFO)
VALUES ('{
"Name": "Sagar",
"Age":22,
"Gender":"Male",
"Subjects":{"Java","C","C++"}
}')

                                 
								
--------------------------------------------------------------------------------------
                                  --JSON 
----------------------------------------------


CREATE TABLE json_sample
(
   student_id SERIAL PRIMARY KEY,
   student_details JSON NOT NULL);
   
INSERT INTO json_sample(student_details) VALUES
('{ "subject": "Science", "category": {"Physics": 30,"Chemistry": 60}}');

INSERT INTO json_sample(student_details) VALUES
('{ "subject": "Science", "category": {"Physics": 30,"Chemistry": 60}}'),
('{ "subject": "Maths", "category": {"Geometry": 50,"Trignometry": 85}}'),
('{ "subject": "English", "category": {"Literature": 76,"Grammar": 90}}');


INSERT INTO json_sample(student_details) VALUES
('{ "subjects": "Science", "category": {"Physics": 30,"Chemistry": 60}}');

select * from json_sample;

SELECT student_details FROM json_sample;

SELECT student_details -> 'subject' AS subject
FROM json_sample;

SELECT student_details ->> 'subject' AS subject
FROM json_sample;

SELECT student_details -> 'category' as category
FROM json_sample;

SELECT student_details -> 'category'->>'Physics' as category
FROM json_sample;

----aggregate function for JSON objects

SELECT 
   MIN (CAST (student_details -> 'category' -> 'Physics' AS INTEGER)),
   MAX (CAST (student_details -> 'category' ->> 'Physics' AS INTEGER)),
   SUM (CAST (student_details -> 'category' ->> 'Physics' AS INTEGER)),
   AVG (CAST (student_details -> 'category' ->> 'Physics'  AS INTEGER))
FROM json_sample;

------------------------------------------------------------------------------------
-- Table Departments

create TABLE Departments (
DepartmentId NUMERIC PRIMARY KEY,
DepartmentName VARCHAR(200));

-- Table Employees

CREATE TABLE Employees (
EmployeeId NUMERIC PRIMARY KEY, 
FirstName VARCHAR(200) NOT NULL, 
LastName VARCHAR(200) NOT NULL,
EmailId VARCHAR(200) UNIQUE, 
PhoneNumber VARCHAR(200),
HireDate DATE DEFAULT CURRENT_DATE,
JobId VARCHAR(200),
Salary NUMERIC CHECK (salary > 0),
DepartmentId NUMERIC REFERENCES  Departments(DepartmentId),
ManagerId NUMERIC REFERENCES Employees(EmployeeId)
ON DELETE SET NULL ON UPDATE SET NULL, 
Commission_pct numeric(2,2) );

-- Table JobHistory

CREATE TABLE JobHistory (
EmployeeId NUMERIC,
StartDate DATE,
EndDate DATE,
JobId VARCHAR(200),
DepartmentId NUMERIC REFERENCES Departments(DepartmentId)
ON DELETE SET NULL ON UPDATE SET NULL,
CONSTRAINT PK_JobHistory PRIMARY KEY (EmployeeId, StartDate), 
CONSTRAINT FK_JobHistory_EmployeeId FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
ON DELETE SET NULL ON UPDATE SET NULL,
CONSTRAINT CK_JobHistory_Date CHECK (StartDate < EndDate) );

INSERT INTO Departments (DepartmentId, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations'),
(6, 'Sales'),
(7, 'Engineering'),
(8, 'Customer Service'),
(9, 'Research'),
(10, 'Legal');

-- Insert data into Employees table

INSERT INTO Employees (EmployeeId, FirstName, LastName, EmailId, PhoneNumber, HireDate, JobId, Salary, DepartmentId, ManagerId, Commission_pct) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '123-456-7890', '2023-01-15', 'Manager', 70000, 1, NULL, 0.05),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', '2023-02-20', 'Developer', 60000, 7, 1, 0.02),
(3, 'Mike', 'Johnson', 'mike.j@email.com', '555-123-4567', '2023-03-10', 'Analyst', 55000, 3, 1, NULL),
(4, 'Emily', 'White', 'emily.white@email.com', '333-555-7890', '2023-04-05', 'Marketing Specialist', 65000, 4, 1, 0.03),
(5, 'Chris', 'Lee', 'chris.lee@email.com', '111-222-3333', '2023-05-12', 'Customer Support', 50000, 8, 3, NULL),
(6, 'Sarah', 'Brown', 'sarah.b@email.com', '777-888-9999', '2023-06-18', 'Sales Representative', 60000, 6, 4, 0.01),
(7, 'Alex', 'Wong', 'alex.w@email.com', '444-666-7777', '2023-07-25', 'Engineer', 75000, 7, 6, NULL),
(8, 'Laura', 'Miller', 'laura.m@email.com', '222-444-8888', '2023-08-30', 'Researcher', 58000, 9, 6, 0.02),
(9, 'Tom', 'Chen', 'tom.c@email.com', '999-000-1111', '2023-09-05', 'Legal Counsel', 80000, 10, 7, 0.04),
(10, 'Olivia', 'Taylor', 'olivia.t@email.com', '666-999-2222', '2023-10-10', 'IT Specialist', 70000, 2, 7, NULL);

-- Insert data into JobHistory table

INSERT INTO JobHistory (EmployeeId, StartDate, EndDate, JobId, DepartmentId) VALUES
(1, '2023-01-15', NULL, 'Manager', 1),
(2, '2023-02-20', NULL, 'Developer', 7),
(3, '2023-03-10', NULL, 'Analyst', 3),
(4, '2023-04-05', NULL, 'Marketing Specialist', 4),
(5, '2023-05-12', NULL, 'Customer Support', 8),
(6, '2023-06-18', NULL, 'Sales Representative', 6),
(7, '2023-07-25', NULL, 'Engineer', 7),
(8, '2023-08-30', NULL, 'Researcher', 9),
(9, '2023-09-05', NULL, 'Legal Counsel', 10),
(10, '2023-10-10', NULL, 'IT Specialist', 2);


SELECT * FROM departments
SELECT * FROM employees
SELECT * FROM JobHistory


--1.Retrieve the information of all the employees working in the organization. 
SELECT * 
FROM Employees;

--2.fetch the specific details like employee_id, first_name, email_id and salary from the 
--employees table.
SELECT Employeeid, FirstName,EmailId,Salary
FROM Employees;

--3.Display the department numbers in which employees are present. If the 
--department_id is present more than once then, only one value should be retrieved. 
SELECT DISTINCT Departmentid
FROM Employees;

--4. Display different job roles that are available in the company.  
SELECT DISTINCT DepartmentName
FROM Departments;

--5.Display the department data  in the ascending order and salary must be in 
--descending order. 
SELECT *
FROM Employees
ORDER BY EmployeeID ASC,Salary DESC;

--6.retrieve the details of all the employees working in 10th department. 
SELECT *
FROM Employees
WHERE DepartmentID=10;

--7.details of the employees working in 10th department along with the employee 
--details whose earning is more than 40000. 
SELECT *
FROM Employees
WHERE DepartmentID=10 AND salary>40000;

--8.display the last name and the job title of the employees who were not allocated to 
--the manager.

SELECT LastName,JobId
FROM Employees
WHERE ManagerId IS NULL;

--9.Generate a report for the employees whose salary ranges from 5000 to 12000 and 
--they should either belongs to department 20 or department 50. Display the last name and 
--the salary of the employee.
SELECT LastName, Salary
FROM Employees
WHERE (Salary BETWEEN 55000 AND 70000) AND DepartmentID IN (7,10);

--10. the employees details who had joined in the year 2003  
SELECT *
FROM Employees
WHERE EXTRACT(YEAR FROM Hiredate)=2003;

--11.Write a query to display the last_name and number of  months for which the 
--employee have worked rounding the months_worked column to its nearest whole number.   
--Hint: No of months should be calculated from the date of joining of an employee to till date. 
SELECT LastName, ROUND(MONTHS_BETWEEN(CURRENT_DATE, Hiredate))
FROM Employees;

-- SELECT 
-- 	AGE(NOW(),'2003-01-12'),
-- 	EXTRACT(YEAR FROM AGE(NOW(),'2003-01-12'))*12 +
-- 	EXTRACT(MONTH FROM AGE(NOW(),'2003-01-12'))
SELECT LastName,
 EXTRACT(YEAR FROM AGE(NOW(),Hiredate))*12 +
			  EXTRACT(MONTH FROM AGE(NOW(),Hiredate))
			  FROM Employees;
			  
--select LastName,age(CURRENT_DATE, Hiredate)
--FROM Employees;

--12.calculate their spending's designation-wise from each department.  
SELECT DepartmentId,JobId,SUM(Salary)
FROM Employees
GROUP BY DepartmentId,JobId;

--13.calculate the following details of the employees using aggregate function in a 
--department. 
--∙Employee with highest salary 
--∙Employee with lowest salary 
--∙Total salary of all the employees in the department  
--∙Average salary of the department 
--Write a query to display the output  rounding the resultant values to its nearest whole 
--number.
SELECT DepartmentId, MAX(Salary) AS "highest salary",MIN(Salary) AS "lowest salary",
          SUM(Salary) AS "Total salary", AVG(Salary) AS "Average salary"
FROM Employees
Group By DepartmentId;
================================================
SELECT FirstName,salary
FROM Employees
where salary=(select max(salary) from employees);

SELECT FirstName,salary
FROM Employees
where salary=(select min(salary) from employees);

SELECT DepartmentID,SUM(Salary)
FROM Employees
GROUP BY DepartmentID;

SELECT DepartmentID,AVG(Salary)
FROM Employees
GROUP BY DepartmentID;

SELECT DepartmentID, 
Round(MAX(Salary)) AS "Highest Salary",
Round(MIN(Salary)) AS "Lowest Salary",
Round(SUM(Salary)) AS "Totel Salary",
Round(AVG(Salary)) AS "Average Salary"
FROM Employees 
GROUP BY DepartmentID;

--14.Modify the result obtained in the previous exercise to display the minimum, 
--maximum, total and average salary for each job type. 
SELECT DepartmentId, MAX(Salary) AS "highest salary",MIN(Salary) AS "lowest salary",
          SUM(Salary) AS "Total salary", AVG(Salary) AS "Average salary"
FROM Employees
Group By DepartmentId;

--15.fetch the details of the departments having less than 3 employees and are working in 
--the department whose department_id is greater than 10. 
SELECT D.DepartmentId,D.DepartmentName,COUNT(D.DepartmentId)
FROM Departments D JOIN Employees E
ON D.DepartmentId=E.DepartmentId
WHERE D.DepartmentId>10
GROUP BY D.DepartmentId
HAVING COUNT(D.DepartmentID)<3;

--16.fetch the manager_id and the minimum salary of the employee reporting to him. 
--Arrange the result in descending order of the salaries excluding the details given below: 
--∙Exclude the employee whose manager is not mapped / not known. 
--∙Exclude the details if the minimum salary is less than or equal to 6000. 

SELECT ManagerId,MIN(Salary) AS "Minimum Salary"
FROM Employees
WHERE Managerid IS NOT NULL
GROUP BY ManagerId
HAVING MIN(Salary)<=6000
ORDER BY MIN(Salary) DESC;

--17. details of the employees who have never changed their job role in the company. 
SELECT *
FROM employees e
WHERE NOT EXISTS (
    SELECT j.EmployeeId
    FROM jobhistory j
    WHERE j.employeeid = e.employeeid
	GROUP BY j.EmployeeId
    HAVING COUNT(DISTINCT j.jobid) > 1);
	
--18.fetch the employee names and their departments in which they are working
SELECT CONCAT(E.FirstName,' ',E.LastName) AS "EMP Name",D.DepartmentName
FROM Employees E JOIN Departments D
ON E.Departmentid=D.DepartmentId;

--19.retrieve all the department information with their corresponding employee names 
--along with the newly added departments. 
SELECT d.departmentid,d.departmentname,e.employeeid,e.firstname,e.lastname
FROM Departments d
LEFT JOIN employees e ON d.departmentid = e.departmentid;

--20.details of the employee along with their managers. 
SELECT e.employeeid,
  e.firstname AS "employee firstname",
  e.lastname AS "employee lastname",
  e.managerid,m.firstname AS "manager firstname",
  m.lastname AS "manager lastname"
FROM employees e
LEFT JOIN employees m ON e.managerid = m.employeeid;

--21. employee details who are reporting to the same manager as Maria reports to.
SELECT e.employeeid,CONCAT(e.firstname,' ',e.lastname),e.managerid
FROM employees e
WHERE e.managerid = (SELECT managerid FROM employees WHERE firstname = 'Maria');

--22.fetch the details of the employees working in the Executive department. 
SELECT e.EmployeeId,e.FirstName,e.LastName,e.JobId,e.Salary,d.DepartmentName
FROM Employees e JOIN Departments d
ON e.DepartmentId=d.DepartmentId
WHERE d.DepartmentName='Executive';

--23.fetch the details of employee whose salary is greater than the average salary of all 
--the employees. 
SELECT employeeid,firstname,lastname,salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--24. Write a query which displays all Ellen's colleague's names. Label the name as "Ellen's 
--colleague".
SELECT FirstName AS "Alex Colleague"
FROM Employees
WHERE DepartmentId=(Select DepartmentId
					 From Employees 
					 Where FirstName='Alex');
					 
--25.which employees from adminstration team is/are earning less than all the 
--employees.
SELECT e.employeeid,e.firstname,e.lastname,e.salary
FROM employees e
JOIN departments d ON e.departmentid = d.departmentid
WHERE d.departmentname = 'adminstration'
  AND e.salary < ALL (SELECT salary FROM employees WHERE departmentid <> d.departmentid);

--26. Write a query to display the last name and salary of those who reports to King. 
SELECT e.lastname,e.salary
FROM employees e
JOIN employees m ON e.managerid = m.employeeid
WHERE m.lastname = 'King';


--27. Write a query to display the below requirement.   
--Fetch employee id and first name of who work in a department with the employee's having 
--‘u’ in the  last_name. 
SELECT employeeid,firstname
FROM employees
WHERE departmentid IN (SELECT departmentid 
					   FROM employees 
					   WHERE lastname LIKE '%u%');
					   
--28.the employee who is getting highest pay in the specific department.
SELECT employeeid,firstname,lastname,salary
FROM employees
WHERE (departmentid, salary) IN 
      (SELECT departmentid, MAX(salary) AS "max salary"
       FROM employees
       GROUP BY departmentid);

--29. the details of different employees who have atleast one person reporting to them. 
SELECT e.employeeid,e.firstname,e.lastname
FROM employees e
WHERE e.employeeid IN (SELECT DISTINCT managerid 
					   FROM employees 
					   WHERE managerid IS NOT NULL);

--30. the departments which was formed but it does not have employees working in 
--them currently. 
SELECT d.departmentid,d.departmentname
FROM departments d
LEFT JOIN employees e ON d.departmentid = e.departmentid
WHERE e.departmentid IS NULL;


===========================================================================================
CREATE TABLE tblDirectors(
Director_id int PRIMARY KEY,
First_name varchar(150) Not Null,
Last_name varchar(150) NOT NULL
);

select * from tblDirectors

INSERT INTO Public.tblDirectors(Director_id,First_name,Last_name)
VALUES (1,'Joshna','Priya'),
(2,'Sri','Krishna'),
(3,'Varsha','Mahadev'),
(4,'Sandhya','Shree'),
(5,'Anusha','Gowda'),
(6,'Joyline','Maxima');

CREATE TABLE tblMovies(
Movie_id int PRIMARY KEY,
Movie_name varchar(100) NOT NULL,
Movie_length int NOT NULL,
Movie_lang Varchar(20) NOT NULL,
Movie_certificate varchar(5) NOT NULL, 
Release_date date NOT NULL,
Director_id int references tblDirectors(Director_id)
);

 select * from tblMovies
 
INSERT INTO Public.tblMovies(Movie_id,Movie_name,Movie_length,Movie_lang,Movie_certrificate,Release_date,Director_id)
VALUES(1,'Leo',250,'Tamil','B','2023-11-08',1),
(2,'Mersal',250,'Tamil','B','2023-10-08',2),
(3,'Ghili',250,'Tamil','B','2023-09-08',3),
(4,'Master',250,'Tamil','B','2023-08-08',4),
(5,'Bigil',250,'Tamil','B','2023-07-08',5),
(6,'Thuppakki',250,'Tamil','B','2023-06-08',6),
(7,'Theri',250,'Tamil','B','2023-05-08',2),
(8,'Kushi',250,'Tamil','B','2023-04-08',1),
(9,'Thalaiva',250,'Tamil','B','2023-03-08',2),
(10,'Nanban',250,'Tamil','B','2023-02-08',3);



CREATE TABLE tblActors(
Actor_id int PRIMARY KEY,
First_name Varchar(150) NOT NULL,
Last_name Varchar(150) NOT NULL,
Gender char(2) NULL,
Date_of_birth Date NOT NULL,
Movie_id int References tblMovies(Movie_id)
)

select * from tblActors

INSERT INTO Public.tblActors(Actor_id,First_name,Last_name,Gender,Date_of_birth,Movie_id)
VALUES (1,'Vijay','Joseph','M','1980-11-08',10),
(2,'Vijay','Sethupathi','M','1981-11-08',9),
(3,'Medona','Sebastin','F','1982-11-08',8),
(4,'Samantha','RuthPrabhu','F','1983-11-08',2),
(5,'Rajini','Kanth','M','1984-11-08',6),
(6,'Jesmitha','Vegus','F','1985-11-08',5),
(7,'Dilip','Raju','M','1986-11-08',4),
(8,'Sanjay','Datt','M','1987-11-08',3),
(9,'Priya','Peter','F','1988-11-08',2),
(10,'Joshna','John','F','1989-11-08',1)

--1.List the different languages of movies. 
 SELECT DISTINCT Movie_Lang
 FROM tblMovies;

--2.Display the unique first names of all directors in ascending order by 
--their first name and then for each group of duplicates, keep the first row in the 
--returned result set. 

SELECT DISTINCT First_Name
FROM TblDirectors
ORDER BY First_Name ASC;

--3. write a query to retrieve 4 records starting from the fourth one, to 
--display the actor ID, name (first_name, last_name) and date of birth, and 
--arrange the result as Bottom N rows from the actors table according to their 
--date of birth.   
SELECT Actor_id,First_Name,Last_Name,Date_Of_Birth
FROM TblActors
ORDER BY Date_Of_Birth Desc
OFFSET 3 ROWS 
Limit 4;


--4.Write a query to get the first names of the directors who holds the letter 
--'S' or 'J' in the first name.   
SELECT First_Name
FROM TblDirectors
Where First_Name ~'^[sjSJ].*';

--5.Write a query to find the movie name and language of the movie of all 
--the movies where the director name is Joshna.
SELECT Movie_Name,Movie_Lang 
FROM tblMovies
WHERE Director_id =(Select Director_id
                         FROM TblDirectors
                    Where First_Name='Joshna');
					
					

--6.Write a query to find the number of directors available in the movies 
--table. 
SELECT Count(DISTINCT First_Name)
FROM tblDirectors;

--7. Write a query to find the total length of the movies available in the 
--movies table. 
SELECT SUM(Movie_length)
FROM TblMovies;

--8.Write a query to get the average of movie length for all the directors 
--who are working for more than 1 movie. 

SELECT D.Director_Id,Count(D.Director_Id),AVG(M.Movie_Length)
FROM tblDirectors D INNER JOIN TblMovies M
ON D.Director_Id=M.Director_Id
GROUP BY D.Director_Id
HAVING COUNT(D.director_id)>1
ORDER BY D.Director_Id Asc;

(OR)

SELECT D.Director_Id,Count(Director_Id),AVG(M.Movie_Length)
WHERE Director_Id=(select Director_Id
                    From tblDirectors
                    GROUP BY Director_id
                    Having Count(*)>0)
	                    GROUP BY Director_id;

--9.Write a query to find the age of the actor vijay for the year 2001-04-10. 
SELECT CONCAT(First_name,' ',Last_name) AS "Actor_Name",Date_of_Birth, AGE(' 2001-04-10',Date_of_Birth)
FROM tblActors
WHERE First_name Like '%Vijay%';

--10.Write a query to fetch the week of this release date 2020-10-10 
--13:00:10. 
SELECT *, TO_CHAR(Release_Date,'ww') AS "WEEK"
FROM TblMovies
WHERE Release_Date='2023-11-8';

--11.Write a query to fetch the day of the week and year for this release date 
--2020-10-10 13:00:10.        
 SELECT *, TO_CHAR(Release_Date,'DAY') AS "DAY_OF_WEEK",
 TO_CHAR(Release_Date,'YEAR') AS "YEAR"
 FROM TblMovies
 WHERE Release_Date='2023-11-08 13:00:10';
 
 --12.Write a query to convert the given string '20201114' into date and time. 
SELECT TO_TIMESTAMP('20201114','YYYYMMDD');

--13.Display Today's date. 
select current_Date;
         --(OR)
select to_char(current_date,'yyyy-mm-dd');

--14.Display Today's date with time.
SELECT CURRENT_TIMESTAMP;
       --(OR)
SELECT NOW();

--15.Write a query to add 10 Days 1 Hour 15 Minutes to the current date. 
SELECT CURRENT_DATE + INTERVAL '10 Days 1 Hour 15 Minutes';

--16.Write a query to find the details of those actors who contain eight or 
--more characters in their first name.
SELECT *
FROM tblActors
WHERE First_Name Like '%________%' 

(OR )

SELECT *
FROM tblActors
WHERE LENGTH (First_name)>=8;

--18.Write a query to get the actor id, first name and birthday month of an 
--actor. 
SELECT Actor_Id,First_name,Extract(MONTH FROM DATE_OF_BIRTH)
FROM TBLACTORS;

--19.Write a query to get the actor id, last name to discard the last three 
--characters. 
SELECT Actor_ID, left(Last_Name,LENGTH(Last_Name)-3)
FROM tblActors;

--20.Write a query that displays the first name and the character length of 
--the first name for all directors whose name starts with the letters 'A', 'J' or 'V'. 
--Give each column an appropriate label. Sort the results by the directors' first 
--names. 
SELECT First_Name, LENGTH(First_Name)
FROM TblDirectors
WHERE First_Name ~'^[ajvAJV].*'
ORDER BY First_Name ASC;

--21.Write a query to display the first word in the movie name if the movie 
--name contains more than one words. 
SELECT Movie_Name,SUBSTRING(Movie_Name,1,POSITION(' ' IN Movie_Name)-1)
FROM tblMovies
WHERE Movie_Name ILIKE '% %';

--22.Write a query to display the actors name with movie name.  
SELECT CONCAT(First_Name,' ',Last_Name) AS "Actor Name",Movie_Name
FROM tblActors A JOIN tblmovies M
ON A.Movie_Id=M.Movie_id;

--23.Write a query to make a join with three tables movies, actors, and 
--directors to display the movie name, director name, and actors date of birth. 
SELECT M.Movie_Name,CONCAT(D.First_Name,' ',D.Last_Name) AS "Director Name",A.Date_Of_Birth
FROM tblDirectors D JOIN tblMovies M
ON D.Director_Id=M.Director_Id JOIN tblActors A
ON A.Movie_id=M.Movie_Id;

--24.Write a query to make a join with two tables directors and movies to 
--display the status of directors who is currently working for the movies above 1.
SELECT First_Name,Last_Name,COUNT(M.Movie_Id)
FROM TblDirectors D JOIN TblMovies M
ON D.Director_id=M.Director_id
GROUP BY First_Name,Last_Name
HAVING COUNT(M.Director_Id)>1

--25.Write a query to make a join with two tables movies and actors to get 
--the movie name and number of actors working in each movie. 
SELECT M.Movie_Name,COUNT(A.Actor_Id) AS "Actors"
FROM TblMovies M JOIN tblActors A
ON M.Movie_id=A.Movie_id
GROUP BY M.Movie_Name

--26.Write a query to display actor id, actors name (first_name, last_name)  
--and movie name to match ALL records from the movies table with each 
--record from the actors table.
SELECT Actor_Id, CONCAT(First_Name,' ',Last_Name) AS "NAME",Movie_Name
FROM tblActors CROSS JOIN tblMovies;

--dISPLAY ALL MOVIES WITH THERE ACTORS 
select M.mOVIE_ID,M.mOVIE_nAME,a.fIRST_NAME,A.lAST_nAME
from TBLmOVIES m LEFT jOIN TBLaCTORS A
on m.moVIE_iD=A.mOVIE_iD
order by M.mOVIE_ID ASC


================================================================================
 CREATE TABLE tblE
(
 Id int Primary Key,
 Name varchar(30),
 Gender varchar(10),
 DepartmentId int
);

CREATE TABLE tblD
(
DeptId int Primary Key,
DeptName varchar(20)
);

Insert into tblE values (1,'John', 'Male', 3),
(2,'Mike', 'Male', 2),
(3,'Pam', 'Female', 1), 
(4,'Todd', 'Male', 4),
(5,'Sara', 'Female', 1),
(6,'Ben', 'Male', 3);
 
Insert into tblD values (1,'IT'),
 (2,'Payroll'),
 (3,'HR'),
 (4,'Admin');

WITH Employee_EX
AS
(
SELECT ID,NAME,GENDER,DEPARTMENTID FROM TBLE
)
SELECT * FROM Employee_EX;

------------------------------------------------
WITH cte AS (
    SELECT id,gender FROM tble where id=2
)

UPDATE tble
SET gender = 'female'
FROM cte
WHERE tble.id =cte.id

-------------------------------
select * from tbld


WITH Employee_EX1(ID,NAME,GENDER,DEPARTMENTID)
AS
(
	SELECT ID,NAME,GENDER,DEPARTMENTID FROM TBLE
)
UPDATE Employee_EX1 SET GENDER='Female' WHERE Employee_EX1.id=tble.id;

---------------------------------------------------------
WITH Employee_ex2(id,name,gender,deptname from tble e join tbld d on tble.departmentid=tbld.deptid
				  where e.deptid=1)
update 

=========================================================================================

CREATE TABLE tbldepartments
(
   department_id INT PRIMARY KEY,
   department_name VARCHAR(100));

CREATE TABLE tblstudents
(
  student_id INT PRIMARY KEY,
  student_name VARCHAR(100),
  student_department INT REFERENCES tbldepartments(department_id),
  stipend INT);
  
INSERT INTO tbldepartments values
(1,'Science'),
(2,'Commerce'),
(3,'Bio-Chemistry'),
(4,'Bio-Medical'),
(5,'Fine Arts'),
(6,'Literature'),
(7,'Animation'),
(8,'Marketing');

select student_id, student_name,student_department,stipend
from students order by student_id limit 20

INSERT INTO tblstudents values
(1,'Hadria',7,2000),
(2,'Trumann',2,2000),
(3,'Earlie',3,2000),
(4,'Monika',4,2000),
(5,'Aila',5,2000),
(6,'Trina',5,2000),
(7,'Esteban',3,2000),
(8,'Camilla',1,2000),
(9,'Georgina',4,2000),
(10,'Reed',6,16000),
(11,'Northrup',7,2000),
(12,'Tina',2,2000),
(13,'Jonathan',	2,2000),
(14,'Renae',7,2000),
(15,'Sophi',6,16000),
(16,'Rayner',3,2000),
(17,'Mona',6,16000),
(18,'Aloin',5,2000),
(19,'Florance',5,2000),
(20,'Elsie',5,2000);

--stored procedures
--1.Write a stored procedure to insert values into the 
--student table ans also update the student_department to 7 when the student_id
--is between 400 and 700.
CREATE OR REPLACE PROCEDURE updateStudents(
	P_Student_id int,
	P_Student_name varchar(50),
	P_Student_Department int,
	P_Stipend INT
)

LANGUAGE SQL
AS $$

 INSERT INTO tblStudents(Student_id,Student_name,Student_Department,Stipend)
 VALUES(P_Student_id,P_Student_name,P_Student_Department,P_Stipend );
 
 Update tblstudents
 SET student_department=7
 WHERE Student_id BETWEEN 400 AND 700
$$

CALL updateStudents(401,'RAJU',08,2000)

SELECT * FROM tblstudents;
SELECT * FROM tbldepartments;

--2.Write a procedure to update the department name to 'Animation' when the department id is
--7. This command has to be committed.
--Write another statement to delete the record from the students table based on the 
--studentid passed as the input parameter.This statement should not be committed.
CREATE or replace PROCEDURE usp_Animation(
P_Student_Id int
)
LANGUAGE plpgSQL
AS $$
BEGIN

UPDATE tblDepartments
SET Department_name='Animation'
WHERE Department_id=8;
COMMIT;

DELETE FROM tblStudents
WHERE Student_id=P_student_id;
ROLLBACK;
END
 $$
 
CALL usp_Animation(9) 
 
--3.Write a procedure to display the sum,average,minimum and maximum values of the column
--stipend from the students table.
CREATe PROCEDURE usp_Ex3(
INOUT "SUM" INT=0,
INOUT "AVG" INT=0,
INOUT "MIN" INT=0,
INOUT "MAX" INT=0
)
LANGUAGE plpgSQL
AS $$
BEGIN
  SELECT SUM(STIPEND),AVG(STIPEND),MIN(STIPEND),MAX(STIPEND)
  INTO "SUM","AVG","MIN","MAX"
  FROM tblStudents;
  
 END
 $$
 

call usp_Ex3()
-----------------------------------
CREATE PROCEDURE usp_Ex4(
INOUT SUM INT DEFAULT NULL,
INOUT AVG INT DEFAULT NULL,
INOUT MIN INT DEFAULT NULL,
INOUT MAX INT DEFAULT NULL
)
LANGUAGE plpgSQL
AS $$
BEGIN
  SELECT SUM(STIPEND),AVG(STIPEND),MIN(STIPEND),MAX(STIPEND)
  INTO SUM,AVG,MIN,MAX
  FROM tblStudents;
  
 END
 $$

CALL usp_Ex4()
------------------------------------------------------------------------
--subqueries

--1.Fetch all the records from the table students where the stipend is more 
--than 'Florance'
SELECT *
FROM tblStudents
WHERE stipend>(select stipend
			   from tblstudents
			   where Student_name='Florance');
			   
--2.Return all the records from the students table who get more than the minimum
--=stipend for the department 'FineArts'.
SELECT *
FROM tblStudents s , tblDepartments d
where s.Stipend>(Select Min(s.stipend)
			     from tblStudents s
			     where d.department_name='Fine Arts');
			 
(or)

SELECT * 
FROM tblstudents
where stipend>(select min(stipend)
			  from tblstudents
			  where student_department=(select department_id 
								        from tbldepartments
								        where department_name='Fine Arts'));
			 
--Questions based on the employee table 

--1.Using a subquery, list the name of the employees, paid more than 
--'Fred Costner' from employees.
SELECT Student_name
FROM tblStudents 
where Stipend>(Select Max(stipend)
			   from tblStudents 
			   where Student_name='Rayner');
			 
			 (or)
SELECT firstname
FROM employees 
where salary>(Select Max(salary)
			 from employees 
			 where firstname='Alex');
			 
select * from employees
--2.Find all employees who earn more than the average salary in their department.
select s.student_name,s.stipend
from tblstudents s
where s.stipend>(select avg(stipend)
			     from tblstudents
		         where student_department=s.student_department);
				 
----------------------------------
--select student_name from tblstudents s
--inner join (select student_department,avg(stipend) from tblstudents
--group by student_department) d
--on s.student_department=d.student_department
--where stipend >(select avg(stipend)
--from tblstudents )


				 
--3.Write a query to select those employees who does not work in those 
--department where the managers of ID between 100 and 200 works.
select CONCAT(firstname,' ',lastname) as "Name"
from employees
where departmentid not in (select Departmentid
						   from employees
						   where employeeid in (select managerId
						   from employees
						   where employeeid between 100 and 200));
--4.Find employees who have at least one person reporting to them.
	select firstname 
	from employees
	where employeeid in (select managerid
	                     from employees
	                     group by managerid
	                     having count(employeeid)>=1);

--1.Write a query to fetch the student_name,stipend and department_name
--from the students and departments table where the student_id is between 
--1 to 5 AND stipend is in the range of 2000 to 4000.
WITH cte_EX1(Student_name,Stipend,Department_name)
AS (
SELECT s.Student_name,s.Stipend,d.Department_name
FROM tblstudents s join tbldepartments d ON s.student_department=d.department_id
where s.student_id between 1 and 5 and s.stipend between 2000 and 4000
)
select Student_name,Stipend,Department_name
from cte_EX1;

--2.Write a query to fetch the sum value of the stipend from the students 
--table based on the department_id where the departments 'Animation' and 'Marketing'
--should not be included and the sum value should be less than 4000.
WITH cte_EX2(sumstipend,department_id,department_name)
AS 
(select sum(s.stipend),department_id,department_name
from tblstudents s join tbldepartments d ON s.student_department=d.department_id
where department_name not in ('Animation','Marketing')
group by department_id
having sum(s.stipend)<4000)
select *
from cte_EX2;

--3.Using the concept of multiple cte, fetch the maximum value, minimm value, 
--average and sum of the stipend based on the department and return all the values.
with cte_ex3(student_department,maxstipend)
as(
select student_department,max(stipend)
from tblstudents
group by student_department),
 cte_ex4(student_department,minstipend)
as(
select student_department,min(stipend)
from tblstudents
group by student_department),
 cte_ex5(student_department,avgstipend)
as(
select student_department,avg(stipend)
from tblstudents
group by student_department),
 cte_ex6(student_department,sumstipend)
as(
select student_department,sum(stipend)
from tblstudents
group by student_department)
select *
from cte_ex3
union 
select *
from cte_ex4
union 
select *
from cte_ex5
union 
select *
from cte_ex6



with cte_ex3(student_department,maxstipend)
as(
select student_department,max(stipend)
from tblstudents
group by student_department),
 cte_ex4(student_department,minstipend)
as(
select student_department,min(stipend)
from tblstudents
group by student_department),
 cte_ex5(student_department,avgstipend)
as(
select student_department,avg(stipend) --::numeric(10,2)
from tblstudents
group by student_department),
 cte_ex6(student_department,sumstipend)
as(
select student_department,sum(stipend)
from tblstudents
group by student_department)

select s.student_department,maxstipend,minstipend,avgstipend,sumstipend
from cte_ex3 s join cte_ex4 r 
on s.student_department=r.student_department join cte_ex5 p
ON s.student_department=p.student_department join cte_ex6 q
ON s.student_department=q.student_department;


CREATE TABLE tbldepartments
(
   department_id INT PRIMARY KEY,
   department_name VARCHAR(100));

CREATE TABLE tblstudents
(
  student_id INT PRIMARY KEY,
  student_name VARCHAR(100),
  student_department INT REFERENCES tbldepartments(department_id),
  stipend INT);
--stored procedures
--1.Write a stored procedure to insert values into the 
--student table ans also update the student_department to 7 when the student_id
--is between 400 and 700.
create or replace procedure sp_S1(
    S_studentI_id int,
	S_student_name varchar(100),
	S_student_department int,
	Stipend int
	)
Language plpgsql
AS $$
BEGIN

insert into tblstudents(student_id,student_name,student_department,stipend)
values(S_studentI_id,S_student_name,S_student_department,Stipend);

update tblstudents
set student_department=7
where student_id between 400 and 700;
end;
$$

call sp_S1(502,'GURU',8,56000)
						 
--2.Write a procedure to update the department name to 'Animation' when the 
--department id is 7. This command has to be committed.
--Write another statement to delete the record from the students table based 
--on the studentid passed as the input parameter.This statement should not be 
--committed.
create procedure sp_S2(s_department_id int)
language plpgsql
AS $$
BEGIN
  update tbldepartment
  set department_name='Animation'
  where department_id=7;
  commit;
  delete from tblStudent
  where student_id=s_department_id;
  rollback;
  
  end; $$
  
call sp_S2(7)



CREATE OR REPLACE FUNCTION F_ASS1(s_sales_id INT)
LANGUAGE plpgsql;
RETURNS TABLE (
    sales_id INT,
    product_name VARCHAR(200),
    category_name VARCHAR(200),
    user_name VARCHAR(200),
    Cost DECIMAL(10, 2),
    profit_loss VARCHAR(500)
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
       s.sales_id,
        p.product_name,
       c.category_name,
        u.user_name,
        p.Product_Price AS Cost,
        CASE
            WHEN p.product_price > 2000 THEN 'The product has gained profit'
            WHEN p.product_price BETWEEN 500 AND 1000 THEN 'The product has incurred loss'
            WHEN p.product_price < 500 THEN 'No profit no loss'
            --ELSE 'Unknown'
        END CASE profit_loss
    FROM
        tblSales s  
		--SELECT
        --s.sales_id,
        --p.product_name,
        --c.category_name,
        --u.user_name,
        --p.Product_Price from  tblSales s
        JOIN tblProducts p ON s.product_id = p.product_id
        JOIN tblCategory c ON p.category_id = c.category_id
        JOIN tblUsers u ON s.sales_user_id = u.user_id
    WHERE
        s.sales_id = s_sales_id;
END;
$$ 

-----------------
select * from F_ASS1(500);
-----------------------------------------------------------------------------------
-- Create tblUsers table
CREATE TABLE tblUsers (
    User_id SERIAL PRIMARY KEY,
    User_name VARCHAR(200),
    Email VARCHAR(200)
);

-- Insert data into tblUsers
INSERT INTO tblUsers (User_id, User_name, Email) VALUES
    (1001, 'Akash', 'akash@gmail.com'),
    (1002, 'Arvind', 'arvind123@gmail.com'),
    (1003, 'Sakshi', 'sakshimys12@gmail.com'),
    (1004, 'Kumar', 'kumar987@gmail.com');

-- Create tblCategory table
CREATE TABLE tblCategory (
    Category_id SERIAL PRIMARY KEY,
    Category_name VARCHAR(200),
    Description VARCHAR(200)
);

-- Insert data into tblCategory
INSERT INTO tblCategory (Category_id, Category_name, Description) VALUES
    (201, 'Electronics', 'One stop for electronic items.'),
    (202, 'Apparel', 'Apparel is the next destination for fashion.'),
    (203, 'Grocery', 'All needs in one place.');

-- Create tblProducts table
CREATE TABLE tblProducts (
    Product_id SERIAL PRIMARY KEY,
    Product_name VARCHAR(200),
    Quantity INT,
    Product_price DECIMAL(10, 2),
    Category_id INT REFERENCES tblCategory(Category_id)
);

-- Insert data into tblProducts
INSERT INTO tblProducts (Product_id, Product_name, Quantity, Product_price, Category_id) VALUES
    (1, 'Mobile Phone', 1000, 15000.00, 201),
    (2, 'Television', 500, 40000.00, 201),
    (3, 'Denims', 2000, 700.00, 202),
    (4, 'Vegetables', 4000, 40.00, 203),
    (5, 'Ethnic Wear', 300, 1500.00, 202),
    (6, 'Wireless Earphone', 5000, 2500.00, 201),
    (7, 'Lounge Wear', 200, 1600.00, 202),
    (8, 'Refrigerator', 50, 30000.00, 201),
    (9, 'Pulses', 60, 150.00, 202),
    (10, 'Fruits', 100, 250.00, 202);

-- Create tblSales table
CREATE TABLE tblSales (
    Sales_id SERIAL PRIMARY KEY,
    Sales_user_id INT REFERENCES tblUsers(User_id),
    Product_id INT REFERENCES tblProducts(Product_id)
);

-- Insert data into tblSales
INSERT INTO tblSales (Sales_id, Sales_user_id, Product_id) VALUES
    (500, 1001, 1),
    (501, 1002, 1),
    (502, 1003, 2),
    (504, 1004, 3),
    (505, 1004, 1),
    (506, 1004, 1),
    (507, 1002, 2),
    (508, 1003, 1),
    (509, 1001, 7),
    (510, 1001, 8);
 SELECT * from tblUsers;
 select * from tblCategory;
 select * from tblProducts;
 select * from tblSales;
-------------------------------------------------------------------------------
--1.Write a function to fetch the names of the product,category and users along 
--with the cost for each product sold depending on the sales_id. 
--Also if the cost for each product is more than 2000, then display a message stating 
--that 'The product has gained profit'.  
--If the product cost is between 500 and 1000, then raise a message stating that 
--'The product has occured loss'. 
--If the product cost is less than 500, then raise an exception stating 
--'No profit no loss

-- Create a function to fetch product details and evaluate profit/loss

CREATE or REPLACE  FUNCTION F_ASS2(S_sales_Id INT)
RETURNS TABLE(p_product_Name VARCHAR(30),
c_Category varchar(30),
u_user_name VARCHAR(30),
p_PRICE INT)
LANGUAGE PLPGSQL
 AS $$
   declare profit INT;

 BEGIN
 RETURN QUERY
    SELECT P.Product_name,C.Category_name,U.User_name ,P.Product_price 
    FROM tblproducts P
    INNER JOIN tblcategory c ON P.Category_id=C.Category_id INNER JOIN tblsales S
    ON S.product_id= P.product_id INNER JOIN tblusers U 
	on S.Sales_user_id=U.USER_ID
    WHERE S.sales_id=S_sales_id;

    select Product_price into profit from tblsales s
    inner join tblproducts p ON P.product_id=S.product_id
    where s.sales_id=S_sales_id;


  IF (profit>2000) THEN
    RAISE NOTICE  'The product has gained profit';
  end if;

  IF (profit >500 AND profit <1000) THEN
    RAISE NOTICE 'The product has occured loss';
  END IF;

  IF (profit<500) THEN
    RAISE EXCEPTION 'NO PROFIT AND LOSS';
  END IF;

END;
$$

select * from F_ASS2(501)




========================================================
--2.Write a procedure to update the name of the category from 
--'Electronics' to 'Modern Gadgets' and 
--also  
--fetch the category and product names when the userid is 
--passed as the input parameter. 

CREATE OR REPLACE PROCEDURE C_UPDATE( IN U_user_id INT,
  INOUT C_Customer_NAME VARCHAR(30) DEFAULT NULL,
  INOUT P_Product_NAME VARCHAR(30) DEFAULT NULL)
LANGUAGE PLPGSQL
AS $$
 BEGIN
    UPDATE  tblcategory
    SET Category_Name='Modern Gadgets'
    WHERE Category_Name='Electronics';

    SELECT P.Product_Name INTO P_Product_NAME
    FROM tblSales s INNER JOIN tblProducts p ON s.Product_id = p.Product_id
    INNER JOIN tblCategory c ON c.Category_id=p.Category_id
    WHERE s.Sales_user_id=U_user_id;

    SELECT C.Category_Name INTO C_Customer_NAME
    FROM tblSales s INNER JOIN tblProducts p ON s.Product_id = p.Product_id
    INNER JOIN tblCategory c ON c.Category_id=p.Category_id
    WHERE s.Sales_user_id=U_user_id;

 END;
 $$

select * from tbl
=======
  CALL C_UPDATE(1004);
=======
                       --FUNCATION
====================================================================
CREATE OR REPLACE FUNCTION F_TEST(sale_id_param INT)
RETURNS TABLE (
    product_name VARCHAR(255),
    category_name VARCHAR(255),
    user_name VARCHAR(255),
    product_cost DECIMAL(10, 2)
)
LANGUAGE plpgsql
AS $$
DECLARE
    product_price DECIMAL(10, 2);
BEGIN
    SELECT p.product_name, c.category_name, u.user_name, p.product_price
    INTO product_name, category_name, user_name, product_cost
    FROM tblSales s
    INNER JOIN tblUsers u ON s.sales_user_id = u.user_id
    INNER JOIN tblProducts p ON s.product_id = p.product_id
    INNER JOIN tblCategory c ON p.category_id = c.category_id
    WHERE s.sales_id = sale_id_param;

    IF product_cost > 2000 THEN
        RAISE NOTICE 'The product has gained profit';
    ELSIF product_cost BETWEEN 500 AND 1000 THEN
        RAISE NOTICE 'The product has occurred loss';
    ELSIF product_cost < 500 THEN
        RAISE NOTICE 'No profit no loss';
    END IF;

    RETURN NEXT;

    RETURN;
  END; 
  $$ 

=======
   SELECT * FROM F_TEST(504);
==================================================================




