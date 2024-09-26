-- Create the 'Customers' table
CREATE TABLE Customers (
    CustomerID int PRIMARY KEY,
    CustomerName varchar(255) NOT NULL,
    ContactName varchar(255),
    Country varchar(255)
);

-- Create the 'Orders' table
CREATE TABLE Orders (
    OrderID int PRIMARY KEY,
    CustomerID int,
    OrderDate date,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into 'Customers'
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Country)
VALUES (1, 'Alfreds Futterkiste', 'Maria Anders', 'Germany'),
       (2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Mexico'),
       (3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mexico');

-- Insert sample data into 'Orders'
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES (10308, 2, '1996-09-18'),
       (10309, 1, '1996-09-19'),
       (10310, NULL, '1996-09-20'); 

-- 1. LIKE operation: Find customers whose names start with 'A'
SELECT * 
FROM Customers
WHERE CustomerName LIKE 'A%';

-- 2. INNER JOIN: Get customer names and their order dates
SELECT Customers.CustomerName, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;