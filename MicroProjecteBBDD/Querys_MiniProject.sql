CREATE TABLE orderdetails (
`orderNumber` int(11) NOT NULL,
`productCode` varchar(15) NOT NULL,
`quantityOrdered` int(11) NOT NULL,
`priceEach` decimal(10,2) NOT NULL,
`orderLineNumber` smallint(6) NOT NULL,
PRIMARY KEY (`orderNumber`,`productCode`),
KEY `productCode` (`productCode`),
FOREIGN KEY (`orderNumber`) REFERENCES `orders` (`orderNumber`),
FOREIGN KEY (`productCode`) REFERENCES `products` (`productCode`)
)

CREATE TABLE orders (
  `orderNumber` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `requiredDate` date NOT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `comments` text,
  `customerNumber` int(11) NOT NULL,
  PRIMARY KEY (`orderNumber`),
  KEY `customerNumber` (`customerNumber`),
  KEY requiredDate (requiredDate)
  FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`)
  FOREIGN KEY (shippedDate) REFERENCES shippingDetail (shippedDate)
) 

CREATE TABLE shippingNumber( 
shippingNumber varchar(15),
status varchar (50),
deliveryLocation varchar (100),
numberEUpallet int(11),
numberUSApallet int(11),
PRIMARY KEY (shippingNumber),
FOREIGN KEY (shippingNumber) REFERENCES shippingDetail (shippingNumber)
)

CREATE TABLE shippingDetail( 
shippingNumber varchar(15) NOT NULL,
shippingLineNumber varchar(15) NOT NULL,
requiredDate date NOT NULL,
shippedDate date DEFAULT NULL,
orderNumber int(11) NOT NULL,
productCode varchar(15) NOT NULL,
quantityShipped int(11) NOT NULL,
KEY (shippingNumber),
KEY (shippedDate),
FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber),
FOREIGN KEY (productCode) REFERENCES products (productCode),
FOREIGN KEY (requiredDate) REFERENCES orders (requiredDate)
)

CREATE TABLE shippingCompany( 
shippingNumber varchar(15),
companyNumber varchar(15),
companyName varchar(50),
typeTransport varchar(50),
maxPallets int(11),
price decimal (11,2),
FOREIGN KEY (shippingNumber) REFERENCES shippingNumber (shippingNumber))

Create Table productionOrder (
productionOrderNumber varchar(25) NOT NULL,
productCode varchar(15) NOT NULL,
orderNumber int(11),
turnWork varchar(15),
estimatedproductionTime date,
status varchar(25),
quantityToProduce int(11), NOT NULL
PRIMARY KEY (productionOrderNumber),
FOREIGN KEY (orderNumber) REFERENCES orderdetails(orderNumber),
FOREIGN KEY (productCode) REFERENCES  products (productCode))

CREATE TABLE lineStage( 
stage varchar(15) NOT NULL, 
productionLine varchar(15) NOT NULL,
employeeID int(11) NOT NULL,
productionOrderNumber varchar(25) DEFAULT NULL,
statusStage varchar(25) NOT NULL,
PRIMARY KEY (productionLine,stage),
FOREIGN KEY (productionOrderNumber) REFERENCES productionOrder (productionOrderNumber),
FOREIGN KEY (employeeID) REFERENCES employees(employeeID))

CREATE TABLE productionLine (
productionLine varchar(15) NOT NULL, 
managerEmployee int(11) NOT NULL,
workLoad varchar(25) NOT NULL,
FOREIGN KEY (managerEmployee) REFERENCES employees(employeeID)
FOREIGN KEY (productionLine) REFERENCES lineStage (productionLine))

Create Table employees(
employeeID int(11) NOT NULL,
lastName varchar(50) NOT NULL,
firstName varchar(50) NOT NULL,
email varchar(100) NOT NULL,
dateStart date NOT NULL,
workDepartment varchar(50) NOT NULL,
jobTitle varchar(50) NOT NULL,
salary int(15) NOT NULL,
turnWork varchar(50),
PRIMARY KEY (employeeID)
KEY (workDepartment))

CREATE TABLE customers (
customerNumber int(11),
customerName varchar(50),
contactLastName varchar(50),
contactFirstName varchar(50),
phone varchar(50),
adressLine1 varchar(50),
adressLine2 varchar (50),
city varchar(50),
state varchar(50),
postalCode varchar(50),
creditLimit decimal(10,2),
salesEmployeeID int(11),
workDepartment varchar(50), 
PRIMARY KEY (customerNumber),
FOREIGN KEY (salesEmployeeID) REFERENCES employees (employeeID),
FOREIGN KEY (workDepartment) REFERENCES employees (workDepartment))

CREATE TABLE payments (
  `customerNumber` int(11) NOT NULL,
  `checkNumber` varchar(50) NOT NULL,
  `paymentDate` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`customerNumber`,`checkNumber`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`)
)

CREATE TABLE products(
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productRange` varchar(50),
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL,
  `productionTime` date,
  `productSize` int(11) NOT NULL,
  `quantityStockEUpallet` int(11),
  `quantityStockUSApallet` int(11),
  PRIMARY KEY (`productCode`),
  KEY `productRange` (`productRange`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productRange`) REFERENCES `productranges` (`productRange`)
)

CREATE TABLE `productranges` (
  `productRange` varchar(50) NOT NULL,
  `textDescription` varchar(4000) DEFAULT NULL,
  `htmlDescription` mediumtext,
  `image` mediumblob,
  PRIMARY KEY (`productRange`)
) 

CREATE TABLE picking (
pickingNumber  varchar(15) NOT NULL,
productCode  varchar(15) NOT NULL,
createDate date,
lastModificationDate date,
PRIMARY KEY(pickingNumber),
FOREIGN KEY (productCode) REFERENCES products (productCode))


CREATE TABLE pickingDetail (
pickingNumber varchar(15) NOT NULL,
pickingLineNumber smallint(6) NOT NULL,
productCode varChar(15) NOT NULL,
quantityNeed int(5)NOT NULL,
PRIMARY KEY (pickingNumber),
FOREIGN KEY (pickingNumber) REFERENCES picking (pickingNumber),
FOREIGN KEY (productCode) REFERENCES  products (productCode))

CREATE TABLE warHouse (
wareHouseLocation varchar(50) NOT NULL,
heighSpace int(11) NOT NULL,
widthSpace int(11) NOT NULL,
depthSpace int(11) NOT NULL,
capacityEUpallet int(11) NOT NULL,
capacityUSApallet int(11) NOT NULL,
PRIMARY KEY (wareHouseLocation))

CREATE TABLE stock (
productCode varchar(15),
quantityInStock int (11),
minQuantityInStock int(11), 
incomingProducts int(11),
wareHouseLocation varchar(50),
FOREIGN KEY (productCode) REFERENCES products (productCode),
FOREIGN KEY (wareHouseLocation) REFERENCES warHouse (wareHouseLocation))


