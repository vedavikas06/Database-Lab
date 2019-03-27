 drop database DB;
-- Create database
create database DB;
 
-- Use database
use DB;

CREATE TABLE Customer(
Customer_Id varchar(10),
Customer_Name varchar(20),
City varchar(10), 
Pincode varchar(6), 
State varchar(20), 
Balance_Due float(10,2),
PRIMARY KEY(Customer_Id)
);



CREATE TABLE product(
Product_Code varchar(10),
Product_Name varchar(20), qty_Available varchar(1), 
Cost_Price float(10,2), 
Selling_Price float(10,2),
PRIMARY KEY(Product_Code)
);

CREATE TABLE Orderr(
Order_No varchar(10), 
Order_Date Date,
Customer_Id varchar(10), 
Product_Code varchar(10), 
Quantity int
);

insert into Customer values('cu001','jonh','new delhi','9899','up',1000);
insert into Customer values('cu002','chris','new york ','98909','nu',91000);
insert into Customer values('cu003','hemilton','ca','89989','fa',1800);

insert into product values('pr001','mobile ','2',14000,12000);
insert into product values('pr002','mobile ','4',15000,12000);
insert into product values('pr003',' car','6',1450000,1200000);
insert into product values('pr004','laptop ','1',140000,120000);

insert into Orderr values('O001',now(),'cu001','p001',2);
insert into Orderr values('O002',now(),'cu002','p003',1);

CREATE UNIQUE INDEX Cust_ind
ON Customer(Customer_Id);


select * from Customer use index(Cust_ind);


CREATE UNIQUE INDEX Ord_ind
ON Orderr(Order_No,Customer_Id,Product_Code);

select * from Orderr use index(Ord_ind);




CREATE TABLE employees

( employee_id INT(6)
, first_name VARCHAR(20)
, last_name VARCHAR(25) NOT NULL
, email VARCHAR(25) NOT NULL UNIQUE
, phone_number VARCHAR(20)
, hire_date DATE DEFAULT '2018-09-30' NOT NULL
, job_id VARCHAR(10) NOT NULL
, salary float(8,2) NOT NULL  CHECK (salary > 0)
, commission_pct INT(2)
, manager_id INT(6)
, department_id INT(4)
, dn VARCHAR(300)
) ;

insert into employees values(121,'Abhi','Sid','Sick@df.com','9848022338','1985-04-03','12345',20000,3,110010,3,'1232');
insert into employees values(122,'veda','pot','ved@df.com','9848022339','2000-04-03','12346',10000,1,110011,3,'1234');
insert into employees values(123,'sahru','sad','question@df.com','9848022331','1981-04-03','12347',1000,10,110014,2,'1237');




alter table employees add combined float(8,2);

UPDATE employees SET combined = (salary + (salary*commission_pct));
CREATE INDEX income_ix ON employees(combined);


SELECT first_name,last_name
FROM employees use index(income_ix)
WHERE salary + (salary*commission_pct) > 15000;


