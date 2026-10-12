-- SQLite: Products(ProductID, ProductName, Category, StockQuantity),
-- Sales(SaleID, ProductID, SaleDate, Quantity, UnitPrice)
SELECT strftime('%Y-%m', SaleDate) AS Month,
       ROUND(SUM(Quantity * UnitPrice), 2) AS Revenue
FROM Sales
GROUP BY strftime('%Y-%m', SaleDate)
ORDER BY Month;

SELECT p.ProductName,
       SUM(s.Quantity) AS UnitsSold,
       ROUND(SUM(s.Quantity * s.UnitPrice), 2) AS Revenue
FROM Sales s JOIN Products p ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Revenue DESC LIMIT 10;

SELECT ProductName, StockQuantity FROM Products
WHERE StockQuantity < 10 ORDER BY StockQuantity;
