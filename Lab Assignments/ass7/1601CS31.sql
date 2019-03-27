 drop database DB;
-- Create database
create database DB;
 
-- Use database
use DB;


CREATE TABLE STUDENT(ID INT,firstname varchar(20) ,
lastname varchar(20) , department varchar(20) );

insert into STUDENT values (111,'krishna','jadhav','cse'),(112,'baliji','sasank','cse'),(113,'gandhi','avinash','ee'),(114,'veda','potnuru','cse'),(115,'sahruday','muktha','cse'),(116,'aditya','patra','cse'),(117,'deepak','gupta','cse');


DELIMITER //

CREATE FUNCTION full_name ( first varchar(20),last varchar(20) )
RETURNS varchar(50)

BEGIN

   DECLARE full varchar(50);

   SET full = CONCAT(last, ', ', first);

   RETURN full;

END; //

DELIMITER ;


select full_name(firstname,lastname),ID from STUDENT where department ='cse';



DELIMITER //

CREATE FUNCTION root_calculation(a INT, b INT, c INT)
RETURNS VARCHAR(50)

BEGIN
     
     DECLARE full VARCHAR(50);
     DECLARE D INT;
     
     SET D = b*b-(4*a*c);
     IF D>0 THEN
     		
          SET full = CONCAT( (-b - SQRT(D))/(2*a), "_", (-b + SQRT(D))/(2*a));
     ELSEIF D = 0 THEN
          set full = -b/(2*a);     
     ELSEIF a = 0 THEN 
     set full = -c/b;  
     
     elseif a=0 and b=0 then
     set full = concat("null","_","null");
          
     ELSE         
          SET full = 'ROOTS ARE IMAGINARY';
          
     END IF;     
     RETURN full;
END; //

DELIMITER ;

SELECT root_calculation(1, 2, 2);


SELECT root_calculation(1, -71, 6);


SELECT root_calculation(1, 2, 1);

SELECT root_calculation(0, 0, 1);

  


