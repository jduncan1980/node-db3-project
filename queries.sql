-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.productname,
       c.categoryname
  FROM product AS p
       JOIN
       category AS c ON p.categoryid = c.id;


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id,
       s.companyname
  FROM [order] AS o
       JOIN
       shipper AS s ON s.id = o.shipvia
 WHERE o.orderdate < "2012-08-09"

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.productname,
       od.quantity
  FROM product AS p
       JOIN
       orderdetail AS od ON od.productid = p.id
 WHERE od.orderid = "10251"
 ORDER BY p.productname;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id AS OrderID,
       c.companyname AS CustomerCompanyName,
       e.lastname AS EmployeeSirname
  FROM [order] AS o
       JOIN
       customer AS c ON c.id = o.customerid
       JOIN
       employee AS e ON e.id = o.employeeid;

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

SELECT CategoryName, 
       COUNT(ProductName)
  FROM [Categories]
       JOIN 
       Products ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

SELECT Orders.OrderID, 
       SUM(OrderDetails.Quantity) as TotalItems 
  FROM [Orders] 
       JOIN 
       OrderDetails ON Orders.OrderID = OrderDetails.OrderID 
GROUP BY Orders.OrderID