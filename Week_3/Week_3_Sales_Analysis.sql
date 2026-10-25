-- Week 3: E-commerce Sales Analysis

-- 1. Overall order and sales summary
SELECT COUNT(*) AS TotalOrders,
       SUM(TotalPrice) AS TotalSales,
       AVG(TotalPrice) AS AverageOrderValue
FROM dbo.orders;

-- 2. Sales by product
SELECT Product,
       COUNT(*) AS NumberOfOrders,
       SUM(TotalPrice) AS TotalSales
FROM dbo.orders
GROUP BY Product
ORDER BY TotalSales DESC;

-- 3. Orders by status
SELECT OrderStatus,
       COUNT(*) AS NumberOfOrders
FROM dbo.orders
GROUP BY OrderStatus
ORDER BY NumberOfOrders DESC;

-- 4. Average order value by payment method
SELECT PaymentMethod,
       COUNT(*) AS NumberOfOrders,
       AVG(TotalPrice) AS AverageOrderValue
FROM dbo.orders
GROUP BY PaymentMethod
ORDER BY AverageOrderValue DESC;

-- 5. Ten highest-value orders above 3000
SELECT TOP 10 OrderID, [Date], Product, TotalPrice
FROM dbo.orders
WHERE TotalPrice > 3000
ORDER BY TotalPrice DESC;

-- 6. Monthly sales
SELECT YEAR([Date]) AS SalesYear,
       MONTH([Date]) AS SalesMonth,
       SUM(TotalPrice) AS MonthlySales
FROM dbo.orders
GROUP BY YEAR([Date]), MONTH([Date])
ORDER BY SalesYear, SalesMonth;

-- 7. Sales by referral source
SELECT ReferralSource,
       COUNT(*) AS NumberOfOrders,
       SUM(TotalPrice) AS TotalSales
FROM dbo.orders
GROUP BY ReferralSource
ORDER BY TotalSales DESC;