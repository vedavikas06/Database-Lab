 drop database DB;
-- Create database
create database DB;
 
-- Use database
use DB;


CREATE TABLE BRANCH(
BRANCHID varchar(20) not null unique, BRANCH_name
varchar(20) not null unique,
 BRANCH_city varchar(20), 
assets varchar(20)
not null , 
ModifiedDate date);

CREATE TABLE ACCOUNT(ACCOUNTID varchar(20) primary key , 
BRANCHID varchar(20) , 
ACCOUNTNumber varchar(20) , 
ACCOUNTType varchar(20) 
,Balance float , 
ModifiedDate date ,
CONSTRAINT FK_ACCOUNT_BRANCH FOREIGN KEY (BRANCHID) REFERENCES
BRANCH(BRANCHID) 
);

CREATE TABLE CUSTOMER( CustomerID varchar(20) PRIMARY KEY,
Name varchar(20), 
Street varchar(20),
 City varchar(20), 
State varchar(20), 
Zip varchar(20), 
Country varchar(20),
ModifiedDate DATE );

CREATE TABLE LOAN(LoanID varchar(20) PRIMARY KEY,
ACCOUNTID varchar(20),
BRANCHID varchaR(20),
LoanNumber varchar(20),
LoanType  VARCHAR(20), 
ModifiedDate DATE,
CONSTRAINT FK_LOAN_ACCOUNT FOREIGN KEY (ACCOUNTID) REFERENCES
ACCOUNT(ACCOUNTID) ON DELETE CASCADE,
CONSTRAINT FK_LOAN_BRANCH FOREIGN KEY (BRANCHID) REFERENCES
BRANCH(BRANCHID) ON DELETE CASCADE);

CREATE TABLE DEPOSITOR(CustomerID varchar(20) ,
ACCOUNTID varchar(20),
ModifiedDate DATE , 
primary key (ACCOUNTID, CustomerID),
CONSTRAINT FK_DEPOSITOR_ACCOUNT FOREIGN KEY ( ACCOUNTID ) REFERENCES
ACCOUNT(ACCOUNTID) ON DELETE CASCADE,
CONSTRAINT FK_DEPOSITOR_CUSTOMER FOREIGN KEY ( CustomerID ) REFERENCES
CUSTOMER(CustomerID));

CREATE TABLE BORROWER(CustomerID varchar(20),
LoanID varchar(20),
ModifiedDate DATE,
PRIMARY KEY ( CustomerID, LoanID ),
CONSTRAINT FK_BORROWER_CUSTOMER FOREIGN KEY ( CustomerID ) REFERENCES
CUSTOMER(CustomerID),
CONSTRAINT FK_BORROWER_LOAN FOREIGN KEY ( LoanID ) REFERENCES LOAN(LoanID) );

CREATE TABLE TRANSACTION(
TRANSACTIONID varchar(20),
 ACCOUNTID varchar(20),
TranType VARCHAR(20), 
Amount FLOAT, 
ModifiedDate DATE,
PRIMARY KEY ( TRANSACTIONID ),
CONSTRAINT FK_TRANSACTION_ACCOUNT  FOREIGN KEY ( ACCOUNTID ) REFERENCES
ACCOUNT(ACCOUNTID) ON DELETE CASCADE );


-- Insert into BRANCH
insert into BRANCH values ('b1','ba','bc1',121123,'1980-08-10');
insert into BRANCH values ('b2','bb','bc2',323123,'1930-06-12');
insert into BRANCH values ('b3','bc','bc3',121123,'2018-08-10');
insert into BRANCH values ('b4','bd','bc4',161123,'1980-03-10');
insert into BRANCH values ('b5','be','bc5',181123,'1970-08-12');
insert into BRANCH values ('b6','bf','bc6',121123,'2020-08-10');
insert into BRANCH values ('b7','bg','bc7',721123,'2980-09-15');
insert into BRANCH values ('b8','bh','bc8',731123,'2780-09-15');

-- Insert into ACCOUNT
insert into ACCOUNT values ('a1','b1','ac1','sav',200,'1970-08-10');
insert into ACCOUNT values ('a2','b2','ac2','sav',1200,'1940-08-10');
insert into ACCOUNT values ('a3','b3','ac3','cur',5500,'1920-08-10');
insert into ACCOUNT values ('a4','b4','ac4','sav',3000,'2018-08-10');
insert into ACCOUNT values ('a5','b5','ac5','sav',10200,'1970-08-10');
insert into ACCOUNT values ('a6','b6','ac6','cur',15320,'2970-08-10');
insert into ACCOUNT values ('a7','b7','ac7','cur',1000,'1370-08-10');
insert into ACCOUNT values ('a8','b8','ac8','sav',100,'1570-08-10');

-- Insert into customer
insert into CUSTOMER values ('c1','ca','s1','city1','st1',33414,'cou1','2019-08-10');
insert into CUSTOMER values ('c2','cb','s2','city2','st2',33214,'cou2','2970-08-10');
insert into CUSTOMER values ('c3','cc','s3','city3','st3',33414,'cou1','1970-08-10');
insert into CUSTOMER values ('c4','cd','s4','city4','st4',63414,'cou3','1970-03-10');
insert into CUSTOMER values ('c5','ce','s5','city5','st5',33414,'cou1','1970-02-10');
insert into CUSTOMER values ('c6','cf','s6','city6','st6',23414,'cou6','1930-08-10');
insert into CUSTOMER values ('c7','cg','s7','city7','st7',33514,'cou1','1970-08-10');
insert into CUSTOMER values ('c8','ch','s8','city8','st8',33514,'cou1','1970-08-10');

-- Insert into loan
insert into LOAN values ('l1','a1','b1','ln1','personal',23414,'2019-08-10');
insert into LOAN  values ('l2','a2','b2','ln2','car',103414,'1929-08-10');
insert into LOAN  values ('l3','a2','b3','ln4','home',102414,'1919-08-10');
insert into LOAN  values ('l4','a4','b4','ln5','personal',23414,'1019-08-10');
insert into LOAN  values ('l5','a5','b5','ln4','personal',23414,'2019-08-10');
insert into LOAN  values ('l6','a6','b6','ln1','car',33414,'2019-08-10');
insert into LOAN  values ('l7','a8','b7','ln2','home',23414,'2019-08-10');
insert into LOAN  values ('l8','a8','b8','ln1','car',13414,'1918-08-10');

-- Insert into DEPOSITOR
insert into DEPOSITOR values ('c1','a1','2018-08-10');
insert into DEPOSITOR values ('c2','a2','1920-04-10');
insert into DEPOSITOR values ('c3','a3','1970-08-10');
insert into DEPOSITOR values ('c4','a4','1930-03-20');
insert into DEPOSITOR values ('c5','a5','1970-08-13');
insert into DEPOSITOR values ('c6','a6','2010-02-17');
insert into DEPOSITOR values ('c7','a7','2070-08-10');
insert into DEPOSITOR values ('c8','a8','1970-03-10');

-- Insert into BORROWER
insert into BORROWER values ('c1','l1','2010-03-10');
insert into BORROWER values ('c2','l2','1970-03-10');
insert into BORROWER values ('c3','l3','2010-03-10');
insert into BORROWER values ('c4','l4','1970-03-10');
insert into BORROWER values ('c5','l5','1930-03-10');
insert into BORROWER values ('c6','l6','1970-03-10');
insert into BORROWER values ('c7','l7','1970-03-10');
insert into BORROWER values ('c8','l8','2018-03-10');

-- Insert into TRANSACTION
insert into TRANSACTION values ('t1','a1','loan payment',3020,'2018-03-10');
insert into TRANSACTION values ('t2','a2','loan taken',9000,'1958-09-10');
insert into TRANSACTION values ('t3','a4','simple deposit',800,'1918-03-10');
insert into TRANSACTION values ('t4','a5','simple withdraw',500,'2018-07-10');
insert into TRANSACTION values ('t5','a6','simple withdraw',3000,'2038-06-10');
insert into TRANSACTION values ('t6','a7','simple deposit',500,'1918-02-10');
insert into TRANSACTION values ('t7','a8','simple withdraw',1000,'1938-03-10');
insert into TRANSACTION values ('t8','a1','loan taken',3200,'2018-03-10');
insert into TRANSACTION values ('t9','a2','simple deposit',3000,'1918-03-10');
insert into TRANSACTION values ('t10','a3','loan taken',1000,'2018-03-10');


select * FROM BRANCH;
select * from ACCOUNT;
select * from CUSTOMER;
select * FROM LOAN;
select * from DEPOSITOR;
select * FROM BORROWER;
select * from TRANSACTION;


UPDATE ACCOUNT SET Balance = Balance - (Balance*3)/100
where Balance < 3000;


select * FROM BRANCH;
select * from ACCOUNT;
select * from CUSTOMER;
select * FROM LOAN;
select * from DEPOSITOR;
select * FROM BORROWER;
select * from TRANSACTION;

DELETE FROM ACCOUNT WHERE Balance < 500;

SAVEPOINT SP1;


select * FROM BRANCH;
select * from ACCOUNT;
select * from CUSTOMER;
select * FROM LOAN;
select * from DEPOSITOR;
select * FROM BORROWER;
select * from TRANSACTION;

SELECT * from CUSTOMER AS C WHERE C.CustomerID IN (select  CustomerID from BORROWER AS b INNER JOIN  LOAN AS l ON b.LoanID = l.LoanID group by b.CustomerID having count(*) >= 2);


select * FROM BRANCH;
select * from ACCOUNT;
select * from CUSTOMER;
select * FROM LOAN;
select * from DEPOSITOR;
select * FROM BORROWER;
select * from TRANSACTION;

Delete from CUSTOMER Where CustomerID in (select CustomerID from BORROWER AS b INNER JOIN  LOAN AS l WHERE b.LoanID = l.LoanID group by b.CustomerID having COUNT(DISTINCT LoanType) = 3);



select * FROM BRANCH;
select * from ACCOUNT;
select * from CUSTOMER;
select * FROM LOAN;
select * from DEPOSITOR;
select * FROM BORROWER;
select * from TRANSACTION;

ROLLBACK;



Lock TABLE ACCOUNT READ;
UPDATE ACCOUNT
SET Balance = Balance*1.05
WHERE Balance > 10000;


UNLOCK TABLES ;
UPDATE ACCOUNT
SET Balance = Balance*1.05
WHERE Balance > 10000;


select * FROM BRANCH;
select * from ACCOUNT;
select * from CUSTOMER;
select * FROM LOAN;
select * from DEPOSITOR;
select * FROM BORROWER;
select * from TRANSACTION;

UNLOCK TABLES ;








