USE northwind;
-- Page 92
-- 1 --

SELECT 
    p.ProductID,
    p.ProductName,
    p.UnitPrice,
    c.CategoryName
FROM
    Products AS p
        INNER JOIN
    Categories AS c
		ON 
		p.CategoryID = c.CategoryID
ORDER BY 
	c.CategoryName,
	p.ProductName;
    
-- 2 --

SELECT 
    P.ProductID,
    P.ProductName,
    p.UnitPrice,
    s.CompanyName 
		'SupplierName'
FROM
    Products AS p
        INNER JOIN
    Suppliers AS s
		ON 
		p.SupplierID = s.SupplierID
WHERE
    p.UnitPrice > 75
ORDER BY 
	p.ProductName;
    
-- 3 --

SELECT 
    p.ProductID,
    p.ProductName,
    p.UnitPrice,
    c.CategoryName,
    s.CompanyName AS 
		SupplierName
FROM
    Products AS p
        INNER JOIN
    Categories AS c 
		ON 
		p.CategoryID = c.CategoryID
        INNER JOIN
    Suppliers 
		ON 
		p.SupplierID = s.SupplierID
ORDER BY p.ProductName;

-- 4 --

SELECT 
    p.ProductName, 
	c.CategoryName
FROM
    Products AS p
        INNER JOIN
    Categories AS c 
		ON 
		p.CategoryID = c.CategoryID
WHERE
	p.UnitPrice = (
		SELECT 
            MAX(UnitPrice)
        FROM
            Products
	);

-- 5 --

SELECT 
    OrderID,
    ShipName,
    ShipAddress,
    ShipperName
FROM
    orders AS o
		INNER JOIN 
	shippers AS s 
		ON 
		o.ShipVia = s.ShipperID
WHERE
    ShipCountry = 'Germany';
    
-- 6 --

SELECT 
	o.OrderID, 
	o.OrderDate,
    o.ShipName,
    o.ShipAddress
FROM 
	orders AS o 
	INNER JOIN `order details` AS od ON o.OrderID = od.OrderId
	INNER JOIN Products AS p ON od.ProductID = p.ProductID 
WHERE 
	p.ProductName = 'Sasquatch Ale';