-- -- Drop database
drop database DB;

-- Create database
create database DB;

-- Use database
use DB;

CREATE TABLE Product (
productId int NOT NULL,
productName varchar(50),
categoryName varchar(50),
packageDesc varchar(50),
price float(9,2),
PRIMARY KEY (ProductId));

CREATE TABLE Customer (
customerId int NOT NULL PRIMARY KEY,
password VARCHAR(20) NOT NULL,
cname VARCHAR(50) NOT NULL,
street VARCHAR(50),
city VARCHAR(20),
state VARCHAR(2),
zipcode VARCHAR(10),
phone VARCHAR(10),
email VARCHAR(30) NOT NULL);


CREATE TABLE Orders (
orderId int  PRIMARY KEY,
customerId int,
totalAmount float(9,2),
CONSTRAINT FK_Orders_Customer FOREIGN KEY (customerId) REFERENCES Customer(customerId));


CREATE TABLE OrderedProduct (
orderId int NOT NULL,
productId int NOT NULL,
quantity int,
price float(9,2),
PRIMARY KEY (OrderId,
ProductId),
CONSTRAINT   FK_OrderedProduct_Order   FOREIGN   KEY(OrderId)  REFERENCES 
Orders(OrderId),
CONSTRAINT FK_OrderedProduct_Product FOREIGN KEY (ProductId) REFERENCES Product
(productId));



CREATE TRIGGER after_OrderedProduct_update 
    AFTER UPDATE ON OrderedProduct
    FOR EACH ROW 
    update Orders set totalAmount = new.quantity*new.price 
    where orderId = new.OrderId;
    
    
    
/*delimiter $$
CREATE TRIGGER after_Customer_delete 
    BEFORE DELETE ON Customer
    FOR EACH ROW 
BEGIN
    
    DELETE FROM OrderedProduct where  orderId in (select Orders.orderId from Orders  where Orders.customerId = OLD.customerId);
    
    
    DELETE FROM Orders where customerId= OLD.customerId;
    
END
$$

delimiter ;*/


create trigger before_Customer_delete  BEFORE delete on Customer FOR EACH ROW
delete from Orders where customerId = old.customerId;
create trigger before_orders_delete BEFORE delete on Orders FOR EACH ROW
delete from OrderedProduct where orderId = old.orderId;




insert into Product values (1,'pa','ca','pde1','90.00');
insert into Product values (2,'pb','cb','pde2','20.00');
insert into Product values (3,'pc','cc','pde3','30.00');
insert into Product values (4,'pd','cd','pde4','40.00');

-- Insert into customer
insert into Customer values (1,'pa1','cn1','st1','ct1','s1','10020','726467373','abc@gmail.com');
insert into Customer values (2,'pa2','cn2','st2','ct2','s2','10050','726467673','abc@gmail.com');
insert into Customer values (3,'pa3','cn3','st3','ct3','s3','10020','726467373','abc@gmail.com');
insert into Customer values (4,'pa4','cn4','st4','ct4','s4','10220','726467673','abc@gmail.com');

-- Insert into orders
insert into Orders values ('1',1,'90.00');
insert into Orders values ('2',2,'40.00');
insert into Orders values ('3',3,'20.00');
insert into Orders values ('4',4,'50.00');

-- Insert into orderedProduct
insert into OrderedProduct values (1,1,'23','30.00');
insert into OrderedProduct values (2,2,'25','70.00');
insert into OrderedProduct values (3,3,'43','20.00');
insert into OrderedProduct values (4,4,'63','60.00');

-- Select
select * from Product;
select * from Customer;
select * from Orders;
select * from OrderedProduct;

-- Update
update OrderedProduct set price = '50.40' where orderId = 2;

-- Delete
delete from Customer where customerId = 4;

-- Select
select * from Product;
select * from Customer;
select * from Orders;
select * from OrderedProduct;


