-- SQL CREATE TABLE 
-- Creates a new table with specified columns and their data types
CREATE TABLE table_name (
    column1 datatype, 
    column2 datatype,
    column3 datatype,
    ....
);

-- Example: Create a table named 'Persons'
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

-- SQL INSERT INTO Statement
-- 1. Insert values into specific columns
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

-- 2. Insert values for all columns (order matters!)
INSERT INTO table_name
VALUES (value1, value2, value3, ...);

-- Example (assuming a 'Customers' table exists)
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

-- Insert data only into specified columns
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

-- SQL SELECT Statement
-- Select specific columns
SELECT column1, column2, ...  -- Replace with actual column names
FROM table_name;               -- Replace with the actual table name

-- Select all columns
SELECT * 
FROM table_name;               -- Replace with the actual table name

-- SQL SELECT DISTINCT Statement
-- Select distinct values from a column
SELECT DISTINCT column_name    -- Replace with the actual column name
FROM table_name;               -- Replace with the actual table name

-- Examples (assuming a 'Customers' table)
SELECT Country FROM Customers; 
SELECT DISTINCT Country FROM Customers;

-- Count the number of unique countries
SELECT COUNT(DISTINCT Country) AS UniqueCountryCount
FROM Customers;

-- Alternative way to count unique countries using a subquery
SELECT COUNT(*) AS DistinctCountries
FROM (SELECT DISTINCT Country FROM Customers) AS UniqueCountries; 

-- SQL WHERE Clause
-- Filter rows based on a condition
SELECT column1, column2, ...   -- Replace with actual column names
FROM table_name                -- Replace with the actual table name
WHERE condition;               -- Replace with the actual condition

-- Examples (assuming a 'Customers' table)
SELECT * FROM Customers WHERE Country = 'Mexico';
SELECT * FROM Customers WHERE CustomerID = 1;

-- SQL AND, OR and NOT Operators
-- AND: All conditions must be true
SELECT * 
FROM table_name                 -- Replace with your actual table name
WHERE condition1 AND condition2; -- Replace with your actual conditions

-- OR: At least one condition must be true
SELECT * 
FROM table_name                 -- Replace with your actual table name
WHERE condition1 OR condition2;  -- Replace with your actual conditions

-- NOT: The condition must be false
SELECT * 
FROM table_name                 -- Replace with your actual table name
WHERE NOT condition;            -- Replace with your actual condition

-- Combining AND, OR and NOT
SELECT * 
FROM Customers
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'München');

SELECT * 
FROM Customers
WHERE NOT Country = 'Germany' AND NOT Country = 'USA';

-- SQL UPDATE Statement
-- Modify data in existing rows
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

-- Examples (assuming a 'Customers' table)
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
WHERE CustomerID = 1;

-- Update all records (use with caution!)
-- UPDATE Customers
-- SET ContactName = 'Juan';

-- SQL DELETE Statement
-- Delete rows from a table
DELETE FROM table_name 
WHERE condition;

-- Example
-- DELETE FROM Customers WHERE CustomerName = 'Alfreds Futterkiste';

-- Delete all records (use with extreme caution!)
-- DELETE FROM Customers;