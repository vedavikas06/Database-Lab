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


INSERT INTO supplier VALUES ('S121', 'vikas',
'erragadda','9000864833','ERRI@GMAIL.COM');
INSERT INTO supplier VALUES ('S122', 'shashank',
'champapet','9491746913','TOPPER@iitp.ac.in.COM');
INSERT INTO supplier VALUES ('S123', 'narayana', 'yadagiri
gutta','9445511332','LOVERBOY@hotmail.COM');
INSERT INTO supplier VALUES ('S124', 'sahruday', 'barbatta
centre','9000000000','QUESTIONMARK@GMAIL.COM');
INSERT INTO supplier VALUES ('S125', 'krishna',
'paris','9490904211','DIRECT@GMAIL.COM');



INSERT INTO parts VALUES ('P1',  'Nut',   '12',    'Red');
INSERT INTO parts VALUES ('P2',  'Bolt',  '17',    'Green');
INSERT INTO parts VALUES ('P3',  'Screw', '15',    'Blue');
INSERT INTO parts VALUES ('P4',  'Screw', '17',    'Red');
INSERT INTO parts VALUES ('P5',  'Cam',   '25',    'Blue');
INSERT INTO parts VALUES ('P6',  'Cog',   '27',    'Red');



INSERT INTO sp VALUES ('S121', 'P1', 300);
INSERT INTO sp VALUES ('S121', 'P2', 200);
INSERT INTO sp VALUES ('S121', 'P3', 400);
INSERT INTO sp VALUES ('S121', 'P4', 200,);
INSERT INTO sp VALUES ('S121', 'P5', 100);
INSERT INTO sp VALUES ('S121', 'P6', 100);
INSERT INTO sp VALUES ('S122', 'P1', 300);
INSERT INTO sp VALUES ('S122', 'P2', 400);
INSERT INTO sp VALUES ('S123', 'P2', 200);
INSERT INTO sp VALUES ('S124', 'P2', 200);
INSERT INTO sp VALUES ('S124', 'P4', 300);
INSERT INTO sp VALUES ('S124', 'P5', 400);




SELECT (replace(sno, 'S', '')) as digits 
FROM supplier;

select sname from supplier
where sname like '%a%a%';

SELECT concat('SP',concat((replace(sno, 'S', '')), (replace(pno, 'P', '')))) as combinations
FROM supplier,parts;


SELECT strcmp(replace(sno, 'S', ''),reverse(replace(sno, 'S', ''))) as digits 
FROM supplier;


SELECT (replace(sno, 'S', 'SUPPL')) as digits 
FROM supplier;

SELECT CONCAT_WS('-', SUBSTR(phone,1,5), 
                       SUBSTR(phone,6,5)) as format from supplier; 
                 
SELECT concat(RIGHT(sname,1),concat(SUBSTR(phone,5,1),concat(SUBSTR(phone,8,1),floor(rand()*99.00)))) as updated_one
FROM supplier;

SELECT round(weight/1000,2) as KG FROM parts;

SELECT substr(SUBSTR(email,(locate('@',email)+1),char_length(email) - (locate('@',email))) ,1,(locate('.',SUBSTR(email,(locate('@',email)+1),char_length(email) - (locate('@',email))))-1) )as DomainName FROM supplier;

SELECT repeat('*',floor(weight/10)+1) as stars,pno,weight as KG FROM parts;



