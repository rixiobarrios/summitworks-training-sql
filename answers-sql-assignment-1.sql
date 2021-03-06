-- Use NORTHWIND database to perform following queries:
-- 1. Get USA and UK Customer's List and their Contact Information. (Table: Customers)
SELECT CompanyName, ContactName, ContactTitle, Phone FROM Customers WHERE Country='UK' or Country='USA' ORDER BY Country; 
-- 2. Get Customer List who are from USA or from SP Region of Brazil. (Table: Customers)
SELECT * FROM Customers WHERE Country='Brazil' AND Region='SP' OR Country='USA' 
-- 3. Get all the CustomerID and OrderID for order placed in third quarter of 1997. (Table: Orders)
SELECT CustomerID,OrderID,OrderDate FROM Orders WHERE OrderDate BETWEEN '1997-07-01' AND '1997-09-30'; 
-- 4. Get the Customer who's Company Name starts with either A, B, C, D, E, F, or G and ends with N or E. (Table: Customers)
SELECT * FROM Customers WHERE CompanyName LIKE '[ABCDEF]%' AND CompanyName LIKE '%[NE]'; 
-- 5. Get the list of Customers where Company Name's 2nd letter is Consonant. (Table: Customers)
SELECT * FROM Customer WHERE CompanyName LIKE '_[BCDFGHKLMNPQRSTVWXZ]%'; 
-- 7. We acquire new Shipper and it does not ship to PO Box. Generate the list of Customers which has PO Box address. (Table: Customers)
SELECT CompanyName, ADDRESS FROM Customers WHERE ADDRESS like '%P.O. Box%'; 
-- 8. Get the Customer Count by (Table: Customers)
-- i.Country
SELECT Country,COUNT(Country) AS 'Customer Count' FROM Customers GROUP BY Country ORDER BY Country;
-- ii.Country, Region
SELECT Country,Region,COUNT(Country) AS 'Customer Count' FROM Customers GROUP BY Country,Region ORDER BY Country;
-- iii.Country, Region, City
SELECT Country,Region,City,COUNT(Country) AS 'Customer Count' FROM Customers GROUP BY Country,Region,City ORDER BY Country; 
-- 9. The Company wants to increase its relationship with higher raking officers of Customer. Get the Count of Contact's person by their title. (Table: Customers)
SELECT ContactTitle,COUNT(ContactTitle) AS Title FROM Customers GROUP BY ContactTitle ORDER BY ContactTitle; 
-- 10. Get the list of Customers and Number of Orders placed by each customer till date. (Table:
-- Orders)
SELECT CustomerID, COUNT(*) OrdersCount FROM Orders WHERE OrderDate <= CURRENT_TIMESTAMP GROUP BY CustomerID ORDER BY CustomerID;
-- 11. Get the top 10 Customers who has placed most order till date. (Table: Orders)
SELECT TOP 10 CustomerID, COUNT(*) OrdersCount FROM Orders WHERE OrderDate <= CURRENT_TIMESTAMP GROUP BY CustomerID ORDER BY OrdersCount DESC; 
-- 12. Get Customers list who has placed 5 or more Orders. (Table:Orders)
SELECT CustomerID, COUNT(*) OrdersCount FROM Orders GROUP BY CustomerID HAVING COUNT(*) >= 5 ORDER BY OrdersCount;