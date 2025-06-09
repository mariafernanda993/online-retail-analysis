CREATE DATABASE online_retail;
USE online_retail;

-- Create table to import data to
CREATE TABLE transactions (
  InvoiceNo VARCHAR(20),
  StockCode VARCHAR(20),
  Description TEXT,
  Quantity INT,
  InvoiceDate DATETIME,
  UnitPrice DECIMAL(10,2),
  CustomerID VARCHAR(20),
  Country VARCHAR(50),
  IsReturn BOOLEAN,
  TotalPrice DECIMAL(10,2),
  Year INT,
  Month INT
);

-- Load data from csv file, mapping to the correct tables, drop title row
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CleanedOnlineRetail.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ',' -- fields separated by ','
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country, IsReturn, TotalPrice, Year, Month);

-- Checks to ensure data was imported correctly
SELECT COUNT(*) FROM transactions; -- making sure rows match 
SHOW WARNINGS; -- display warnings 
SELECT * FROM transactions LIMIT 10; -- checking first 10 rows of data

TRUNCATE TABLE transactions;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CleanedOnlineRetail.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country, IsReturn, TotalPrice, Year, Month);

-- Checks to ensure data was imported correctly
SELECT COUNT(*) FROM transactions; -- making sure rows match 
SHOW WARNINGS; -- display warnings 
SELECT * FROM transactions LIMIT 10; -- checking first 10 rows of data

SELECT IsReturn, COUNT(*) 
FROM transactions 
GROUP BY IsReturn;
