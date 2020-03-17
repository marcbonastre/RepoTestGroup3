SELECT c.customerName, e.firstName , e.jobTitle 
FROM classicmodels.customers as c
LEFT JOIN classicmodels.employees  as e 
ON e.employeeNumber = c.salesRepEmployeeNumber 
ORDER BY jobTitle 

SELECT c.customerName 
FROM classicmodels.customers as c
WHERE c.salesRepEmployeeNumber IS NULL 

SELECT c.customerName 
FROM classicmodels.customers as c
WHERE c.salesRepEmployeeNumber IS NOT NULL 



SELECT *
FROM classicmodels.customers as c
WHERE c.salesRepEmployeeNumber IS NULL  

select c.customerName, count(o.orderNumber) 
FROM classicmodels.orders AS o 
RIGHT JOIN classicmodels.customers as c
ON o.customerNumber = c.customerNumber 
WHERE c.salesRepEmployeeNumber IS NULL
GROUP BY c.customerName 
