-- vedavikas 1601CS31 --

-- -- Drop database
drop database SP;
 
-- Create database
create database SP;
 
-- Use database
use SP;
 
CREATE TABLE supplier(
sno varchar(4) NOT NULL PRIMARY KEY,
sname varchar(30),
city varchar(30),
phone varchar(10),
email varchar(30));
 
CREATE TABLE parts (
pno varchar(4) NOT NULL PRIMARY KEY,
pname varchar(30),
weight int,
color varchar(10));
 
 
CREATE TABLE sp (
sno varchar(4) NOT NULL,
pno varchar(4) NOT NULL,
qty int,
PRIMARY KEY (sno,pno),
CONSTRAINT for1 FOREIGN KEY (sno) REFERENCES supplier(sno),
CONSTRAINT for2 FOREIGN KEY (pno) REFERENCES parts(pno)
);
 
ALTER TABLE sp
ADD dos date;

ALTER TABLE parts
ADD dom date;

ALTER TABLE supplier
ADD dob date;

INSERT INTO supplier VALUES ('s1', 'vikas',
'erragadda','9000864833','SCHOLAR@GMAIL.COM','1998-01-16');
INSERT INTO supplier VALUES ('s2', 'shashank',
'champapet','9491746913','TOPPER@GMAIL.COM','2012-10-05');
INSERT INTO supplier VALUES ('s3', 'narayana', 'yadagiri
gutta','9445511332','BOY@GMAIL.COM','1978-12-25');
INSERT INTO supplier VALUES ('s4', 'sahruday', 'barbatta
centre','9000000000','QUESTIONMARK@GMAIL.COM','1999-09-18');
INSERT INTO supplier VALUES ('s5', 'krishna',
'paris','9490904211','DIRECT@GMAIL.COM','1999-09-06');



INSERT INTO parts VALUES ('P1',  'Nut',   '12',    'Red','2018-08-12');
INSERT INTO parts VALUES ('P2',  'Bolt',  '17',    'Green','2018-07-13');
INSERT INTO parts VALUES ('P3',  'Screw', '15',    'Blue','2018-07-26');
INSERT INTO parts VALUES ('P4',  'Screw', '17',    'Red','2018-08-15');
INSERT INTO parts VALUES ('P5',  'Cam',   '25',    'Blue','2018-08-17');
INSERT INTO parts VALUES ('P6',  'Cog',   '27',    'Red','2018-07-30');



INSERT INTO sp VALUES ('S1', 'P1', 300,'2012-08-22');
INSERT INTO sp VALUES ('S1', 'P2', 200,'2018-08-25');
INSERT INTO sp VALUES ('S1', 'P3', 400,'2018-08-27');
INSERT INTO sp VALUES ('S1', 'P4', 200,'2018-08-20');
INSERT INTO sp VALUES ('S1', 'P5', 100,'2018-08-15');
INSERT INTO sp VALUES ('S1', 'P6', 100,'2018-08-17');
INSERT INTO sp VALUES ('S2', 'P1', 300,'2018-08-18');
INSERT INTO sp VALUES ('S2', 'P2', 400,'2018-08-18');
INSERT INTO sp VALUES ('S3', 'P2', 200,'2018-08-20');
INSERT INTO sp VALUES ('S4', 'P2', 200,'2018-09-07');
INSERT INTO sp VALUES ('S5', 'P4', 300,'2017-09-06');
INSERT INTO sp VALUES ('S4', 'P5', 400,'2012-09-03');




select * from supplier where dob = (select max(dob) from supplier);


select * from supplier where (select DATEDIFF('2018-08-20',dob) / 365.25) > 30.00 ;


select AVG(YEAR(NOW())-YEAR(dob)),city from supplier GROUP BY city ORDER BY city; 

select sname from supplier where sno in (select sno from sp where year(dos) = "2012");

select sname from supplier where sno in (select sno from sp  WHERE dos BETWEEN '2015-02-01' AND '2018-08-20');

select distinct s.p from (select  pname as p from parts inner join sp on parts.pno = sp.pno ORDER BY dos DESC  LIMIT 3) s;

select sname from supplier, (SELECT DISTINCT s1.sno FROM sp s1
    JOIN sp s2
    ON s1.sno=s2.sno AND s1.pno!=s2.pno AND DATEDIFF(s1.dos, s2.dos)<=30)
as A where A.sno = supplier.sno;



select pno,DATE_ADD(dos,interval 3 month) as expiry_date,sno from sp where CURDATE() > dos;

select sno,pno,qty as part_no from sp where  (CURDATE() BETWEEN dos AND DATE_ADD(dos,interval 3 month)) or (CURDATE() < dos);

select distinct sname from supplier, (SELECT DISTINCT s1.sno FROM sp s1
    JOIN parts s2
    ON s1.pno=s2.pno  AND  TIMESTAMPDIFF(MONTH,s1.dos, s2.dom) > 6) as A where A.sno = supplier.sno;


