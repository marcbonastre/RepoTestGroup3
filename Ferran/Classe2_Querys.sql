SELECT DATE_FORMAT(o.orderDate, '%Y-%m') AS 'Year_Month',
o.orderNumber
FROM orders AS o
WHERE o.status != 'Cancelled' 
AND DATE_FORMAT(o.orderDate, '%Y-%m') BETWEEN '2003-06' AND '2004-05'
ORDER BY 'Year_Month'
-- 10.127 a 10.302

SELECT DATE_FORMAT(o.orderDate, '%Y-%m') AS 'Year_Month',
o.orderNumber
FROM orders AS o
WHERE o.status != 'Cancelled' 
AND DATE_FORMAT(o.orderDate, '%Y-%m') BETWEEN '2004-06' AND '2005-05'
ORDER BY 'Year_Month'
-- 10.254 a 10.425


-- Ejercico A
-- FY2004
SELECT products.productName,
orderdetails.productCode,
SUM(orderdetails.quantityOrdered) AS "ProducteTotal"
FROM orderdetails 
INNER JOIN products ON orderdetails.productCode = products.productCode
WHERE orderdetails.orderNumber BETWEEN 10127 AND 10302
GROUP BY orderdetails.productCode
ORDER BY ProducteTotal DESC 
LIMIT 0,10

SELECT products.productName,
orderdetails.productCode,
-- SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS "PrecioVentaTotal",
-- SUM(orderdetails.quantityOrdered * products.buyPrice) AS "PrecioCompraTotal",
(SUM(orderdetails.quantityOrdered * orderdetails.priceEach) - 
SUM(orderdetails.quantityOrdered * products.buyPrice)) AS "GananciasTotales"
FROM orderdetails
INNER JOIN products ON orderdetails.productCode = products.productCode 
WHERE orderdetails.orderNumber BETWEEN 10127 AND 10302
GROUP BY orderdetails.productCode
ORDER BY GananciasTotales DESC
LIMIT 0,10

-- FY2005 
SELECT products.productName,
orderdetails.productCode,
SUM(orderdetails.quantityOrdered) AS "ProducteTotal"
FROM orderdetails
INNER JOIN products ON orderdetails.productCode = products.productCode
WHERE orderdetails.orderNumber BETWEEN 10254 AND 10425
GROUP BY orderdetails.productCode
ORDER BY ProducteTotal DESC 
LIMIT 0,10

SELECT products.productName,
orderdetails.productCode,
-- SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS "PrecioVentaTotal",
-- SUM(orderdetails.quantityOrdered * products.buyPrice) AS "PrecioCompraTotal",
(SUM(orderdetails.quantityOrdered * orderdetails.priceEach) - 
SUM(orderdetails.quantityOrdered * products.buyPrice)) AS "GananciasTotales"
FROM orderdetails
INNER JOIN products ON orderdetails.productCode = products.productCode 
WHERE orderdetails.orderNumber BETWEEN 10254 AND 10425
GROUP BY orderdetails.productCode
ORDER BY GananciasTotales DESC
LIMIT 0,10

-- Ejercico B
-- FY2004
SELECT products.productLine,
SUM(orderdetails.quantityOrdered) AS "LiniaTotal"
FROM products
RIGHT OUTER JOIN orderdetails ON orderdetails.productCode = products.productCode
WHERE orderdetails.orderNumber BETWEEN 10127 and 10302
GROUP BY products.productLine 
ORDER BY liniaTotal DESC

SELECT products.productLine,
(SUM(orderdetails.quantityOrdered * orderdetails.priceEach) - 
SUM(orderdetails.quantityOrdered * products.buyPrice)) AS "GananciasLinia"
FROM products
RIGHT OUTER JOIN orderdetails ON orderdetails.productCode = products.productCode
WHERE orderdetails.orderNumber BETWEEN 10127 and 10302
GROUP BY products.productLine 
ORDER BY GananciasLinia DESC

-- FY2005
SELECT products.productLine,
SUM(orderdetails.quantityOrdered) AS "LiniaTotal"
FROM products
RIGHT OUTER JOIN orderdetails ON orderdetails.productCode = products.productCode
WHERE orderdetails.orderNumber BETWEEN 10254 AND 10425
GROUP BY products.productLine 
ORDER BY liniaTotal DESC

SELECT products.productLine,
(SUM(orderdetails.quantityOrdered * orderdetails.priceEach) - 
SUM(orderdetails.quantityOrdered * products.buyPrice)) AS "GananciasLinia"
FROM products
RIGHT OUTER JOIN orderdetails ON orderdetails.productCode = products.productCode
WHERE orderdetails.orderNumber BETWEEN 10254 AND 10425
GROUP BY products.productLine 
ORDER BY GananciasLinia DESC