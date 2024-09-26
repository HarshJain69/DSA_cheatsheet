-- SQL CREATE TABLE for Customers (make sure it matches the INSERT statements)
CREATE TABLE Customers (
    CustomerID int,         -- Assuming this is the primary key
    CustomerName varchar(255),
    ContactName varchar(255),
    Address varchar(255),
    City varchar(255),
    PostalCode varchar(255),
    Country varchar(255)
);

-- SQL INSERT INTO Statement (specifying column names)
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

-- SQL INSERT INTO Statement (omitting column names - values must match column order)
-- Make sure the order of values matches the column order in the CREATE TABLE statement
INSERT INTO Customers 
VALUES (2, 'Another Customer', 'Stavanger', 'Norway');  -- Assuming CustomerID is auto-incrementing

-- SQL SELECT Statement (selecting specific columns)
SELECT CustomerName, City 
FROM Customers;

-- SQL SELECT Statement (selecting all columns)
SELECT * 
FROM Customers;

-- SQL SELECT DISTINCT Statement (selecting distinct values from a single column)
SELECT DISTINCT Country 
FROM Customers;

-- SQL SELECT DISTINCT Statement (counting distinct values)
SELECT COUNT(DISTINCT Country) 
FROM Customers;

-- SQL SELECT DISTINCT Statement (alternative way to count distinct values)
SELECT Count(*) AS DistinctCountries
FROM (SELECT DISTINCT Country FROM Customers) AS CountryCounts; -- Added alias for the subquery

-- SQL WHERE Clause (using =)
SELECT * 
FROM Customers
WHERE CustomerID = 1;

-- SQL AND Operator
-- Adjust the WHERE clause based on the actual data in your Customers table
SELECT *
FROM Customers
WHERE Country='Norway' AND City='Stavanger'; 

-- SQL OR Operator
-- Adjust the WHERE clause based on the actual data in your Customers table
SELECT *
FROM Customers
WHERE City='Stavanger' OR City='Oslo'; 

-- SQL NOT Operator
-- Adjust the WHERE clause based on the actual data in your Customers table
SELECT *
FROM Customers
WHERE NOT Country='Norway';

-- SQL UPDATE Statement
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;

-- SQL DELETE Statement (deleting a specific record)
DELETE FROM Customers
WHERE CustomerID = 1;

-- SQL DELETE Statement (deleting all records - use with caution!)
-- DELETE FROM Customers;  -- Commented out for safety