CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

ALTER TABLE Employee ADD Email VARCHAR(100);

ALTER TABLE Employee MODIFY Salary DECIMAL(12, 2);

DROP TABLE Employee;

TRUNCATE TABLE Employee; -- Assuming the table exists and you want to clear its data