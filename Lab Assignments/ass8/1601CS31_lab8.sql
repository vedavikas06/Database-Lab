 drop database DB;
-- Create database
create database DB;
 
-- Use database
use DB;

CREATE TABLE Location(
Location_Id varchar(20),
Regional_Group varchar(30),
PRIMARY KEY(Location_Id)
);

CREATE TABLE Department(
Department_Id varchar(20) ,
Name varchar(30),
Location_Id varchar(20),
PRIMARY KEY(Department_Id),
CONSTRAINT FK_Location_Id FOREIGN KEY (Location_Id) REFERENCES Location(Location_Id)
);


CREATE TABLE Job(
Job_Id varchar(20) ,
Function varchar(30),
PRIMARY KEY(Job_Id)

);



CREATE TABLE Employee(
Employee_Id varchar(20) ,
Last_Name varchar(30) NOT NULL,
First_Name varchar(30),
Middle_Name varchar(30),
Job_Id varchar(20),
Manager_Id varchar(20),
Hire_Date date,
Salary INT,
Comm INT,
Department_Id varchar(20),
PRIMARY KEY (Employee_Id),
CONSTRAINT FK_Department_Id FOREIGN KEY (Department_Id ) REFERENCES Department (Department_Id ),
CONSTRAINT FK_Job_Id FOREIGN KEY (Job_Id ) REFERENCES Job(Job_Id )
);

insert into Location values('l123','Ranchi');
insert into Location values('l124','Ranch');
insert into Location values('l125','Ranci');
insert into Location values('l126','Ranhi');
insert into Location values('l127','Rachi');
insert into Location values('l128','Rahi');
insert into Location values('l129','Rnchi');
insert into Location values('l130','Rani');


insert into Department values('d10','Accounting','l123');
insert into Department values('d124','Research','l124');
insert into Department values('d125','EE','l125');
insert into Department values('d126','ME','l126');
insert into Department values('d127','CSE','l127');
insert into Department values('d128','CB','l128');
insert into Department values('d129','Accounting','l129');
insert into Department values('d20','EE','l130');


insert into Job values('j123','Clerk');
insert into Job values('j124','Staff');
insert into Job values('j125','Analyst');
insert into Job values('j126','Clerk');
insert into Job values('j127','Clerk');
insert into Job values('j128','Salesman');
insert into Job values('j129','Manager');
insert into Job values('j130','President');

insert into Employee
values('e123','Abhi','Sid','Sick','j123','m123','1985-04-03',20000,3000,'d10');
insert into Employee
values('e124','Abh','Sidi','','j123','m124','1985-04-04',2000,3000,'d10');
insert into Employee
values('e125','Abi','Sid','Sick','j125','m125','2018-02-05',20000,300,'d125');
insert into Employee
values('e126','Abhi','Sd','','j126','m126','1985-04-06',3200,3000,'d126');
insert into Employee
values('e127','Abhi','Si','Sick','j127','m127','1985-04-07',20000,300,'d10');
insert into Employee
values('e128','Ai','Sid','Sick','j128','m128','2018-02-08',20000,3000,'d10');
insert into Employee
values('e129','Abhi','Sid','','j123','m129','2018-02-09',10000,3000,'d124');
insert into Employee
values('e130','Abhi','S','Sick','j130','m130','2018-04-03',20000,1000,'d20');


CREATE VIEW p1 AS SELECT First_Name,Last_Name,Salary,comm FROM Employee;
select * from p1;

CREATE VIEW p2 AS SELECT First_Name,Middle_Name,Last_Name,Salary*12 FROM Employee;
select * from p2;

CREATE VIEW p3 AS SELECT First_Name,Middle_Name,Last_Name FROM Employee where Department_Id = 'd20';
select * from p3;

CREATE VIEW p4 AS SELECT First_Name,Middle_Name,Last_Name FROM Employee where Salary BETWEEN 3000 and 4500 ;
select * from p4;


CREATE VIEW p5 AS SELECT First_Name,Middle_Name,Last_Name,Employee_Id FROM Employee where Department_Id = 'd10' or Department_Id = 'd20';
select * from p5;


CREATE VIEW p6 AS SELECT First_Name,Middle_Name,Last_Name,Employee_Id,Salary FROM Employee where  First_Name like 'S%' ;
select * from p6;


CREATE VIEW p7 AS SELECT First_Name,Middle_Name,Last_Name,Employee_Id,Salary FROM Employee where  First_Name like 'S___' ;
select * from p7;



CREATE VIEW p8 AS SELECT First_Name,Middle_Name,Last_Name,Employee_Id,Salary FROM Employee ORDER BY Last_Name ASC, Salary DESC;
select * from p8;

CREATE VIEW p9 AS SELECT MAX(Salary),MIN(SALARY),AVG(Salary),Department_Id FROM Employee GROUP BY Department_Id ;
select * from p9;

CREATE VIEW p10 AS SELECT COUNT(*),Hire_Date FROM Employee GROUP BY Month(Hire_Date),Year(Hire_Date) order BY Year(Hire_Date),Month(Hire_Date);
select * from p10;

CREATE VIEW p11 AS SELECT Department_Id FROM Employee GROUP BY Department_Id having count(*)>=4;
select * from p11;

CREATE VIEW p12 AS SELECT count(*) FROM Employee where Month(Hire_Date) = 1;
select * from p12;


CREATE VIEW p13 AS select Department_Id from Employee
where year(Hire_Date) = 1985 and MONTH(Hire_Date)= 4
group by Department_Id having COUNT(*)>=3;
select * from p13;

CREATE VIEW p14 AS select First_Name from Employee where Job_Id in (
select Job_Id from Employee e natural join Department d where d.Name = 'Research' ) and 
Job_id in (
select Job_id from Employee e natural join Department d where d.Name = 'Research' );
select * from p14;


