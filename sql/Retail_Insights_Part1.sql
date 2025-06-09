USE online_retail;

-- Total sales by country
SELECT Country, SUM(TotalPrice) AS TotalRevenue
FROM transactions
GROUP BY Country
ORDER BY TotalRevenue DESC;

-- Monthly Revenue Trends
SELECT Year, Month, SUM(TotalPrice) AS MonthlyRevenue
FROM transactions
GROUP BY Year, Month
ORDER BY Year, Month;

-- Top 10 best-selling products
SELECT Description, SUM(Quantity) AS TotalSold
FROM transactions
GROUP BY Description
ORDER BY TotalSold DESC LIMIT 10;

-- Return Rate per Country
SELECT country,
	COUNT(*) AS TotalOrders,
    SUM(IsReturn) AS TotalReturns,
    ROUND(SUM(IsReturn) / COUNT(*) * 100, 2) AS ReturnRatePercentage
FROM transactions
GROUP BY Country
ORDER BY ReturnRatePercentage DESC;

-- Most Returned Products
SELECT Description, COUNT(*) AS ReturnCount
FROM transactions
WHERE IsReturn = 1
GROUP BY Description
ORDER BY ReturnCount DESC
LIMIT 10;

