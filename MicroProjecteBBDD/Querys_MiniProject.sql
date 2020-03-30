DROP TABLE tblMarc;

Create Table employees(
employeeID int NOT NULL,
lastName varchar(50),
firstName varchar(50),
email varchar(100),
dateStart date,
totalTime datetime,
workDepartment varchar(50),
jobTitle varchar(50),
salary int,
PRIMARY KEY (employeeID));

CREATE TABLE orderDetail (
orderNumber int(11),
productCode varchar(15),
quantityOrdered int(11),
priceEach decimal(10,2),
orderLineNumber smallint(6),
PRIMARY KEY (orderNumber));

Create Table inProcess (
fabricationNumber varchar(25) NOT NULL,
productCode varchar(15),
orderNumber int(11),
productLine int(11),
statusLine varchar(50),
turnWork varchar(15),
employeeID int NOT NULL,
PRIMARY KEY (fabricationNumber),
FOREIGN KEY (orderNumber) REFERENCES orderDetail(orderNumber),
FOREIGN KEY (employeeID) REFERENCES employees(employeeID));
