/* Primer ejercicio */
SELECT COUNT(orders.customerNumber ) AS NumeroDeOrdenes, customerNumber
FROM orders 
GROUP BY customerNumber 
ORDER BY NumeroDeOrdenes DESC 
/*Segon ejercicio*/
