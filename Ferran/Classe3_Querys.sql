-- Ejercicios Josep correctos

-- Ejercicio A/B 1
SELECT 
	'PY2004' Period,
	-- 'PY2005 Period,
	p.productCode,
	p.productName,
	SUM(od.quantityOrdered * od.priceEach) AS "ProductoTotal"
FROM orderdetails AS od 
LEFT JOIN products AS p ON od.productCode = p.productCode
LEFT JOIN orders AS o ON od.orderNumber = o.orderNumber
WHERE 
	o.status != 'Cancelled'
	AND (o.orderDate >= '2003-06-01' AND o.orderDate < '2004-05-01')
	-- AND (o.orderDate >= '2004-06-01' AND o.orderDate < '2005-05-01')
GROUP BY 
	Period,
	od.productCode,
	p.productName 
ORDER BY Period, ProductoTotal DESC , p.productName 
LIMIT 0,10


-- Ejercicio A/B 2
SELECT 
	'PY2004' Period,
	-- 'PY2005 Period,
	p.productCode,
	p.productName,
	(SUM(od.quantityOrdered * od.priceEach) - 
	SUM(od.quantityOrdered * p.buyPrice)) /
	SUM(od.priceEach * od.quantityOrdered) AS "GananciasTotales"
FROM orderdetails AS od 
LEFT JOIN products AS p ON  p.productCode = od.productCode
LEFT JOIN orders AS o ON o.orderNumber = od.orderNumber
WHERE 
	o.status != "Cancelled" 
	AND (o.orderDate >= "2003-06-01" AND o.orderDate < "2004-05-01")
	-- AND (o.orderDate >= '2004-06-01' AND o.orderDate < '2005-05-01')
GROUP BY 
	Period,
	p.productCode,
	p.productName 
ORDER BY 
	Period, GananciasTotales DESC , p.productName 
LIMIT 0,10

-- Ejercicio 3
SELECT
	t.productCode,
	t.productName,
	SUM(CASE WHEN t.Quarter = '2003-3' THEN t.Qty END) AS PY200303,
	SUM(CASE WHEN t.Quarter = '2003-4' THEN t.Qty END) AS PY200304,
	SUM(CASE WHEN t.Quarter = '2004-1' THEN t.Qty END) AS PY200401,
	SUM(CASE WHEN t.Quarter = '2004-2' THEN t.Qty END) AS PY200402,
	SUM(CASE WHEN t.Quarter = '2004-3' THEN t.Qty END) AS PY200403,
	SUM(CASE WHEN t.Quarter = '2004-4' THEN t.Qty END) AS PY200404,
	SUM(CASE WHEN t.Quarter = '2005-1' THEN t.Qty END) AS PY200501,
	SUM(CASE WHEN t.Quarter = '2005-2' THEN t.Qty END) AS PY200501
FROM (
	SELECT 
		CONCAT(YEAR(o.orderDate),'=',QUARTER(o.orderDate) AS Quarter,
		p.productCode,
		p.productName,
		SUM(od.quantityOrdered) AS "Qty"
	FROM orderdetails AS od 
	LEFT JOIN products AS p ON od.productCode = p.productCode
	LEFT JOIN orders AS o ON od.orderNumber = o.orderNumber
	WHERE 
		o.status != 'Cancelled'
	GROUP BY 
		Quarter,
		od.productCode,
		p.productName 
	ORDER BY 
		Quarter DESC, p.productName 
	) AS t
