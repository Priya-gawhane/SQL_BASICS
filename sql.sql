-- 1. Create a Database
CREATE DATABASE Company;
USE Company;


-- 2. Create PARENT Table First (Departments)
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE,
    Budget DECIMAL(15,2) DEFAULT 0.00
);

-- 3. Now Create CHILD Table (Employees)
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE,
    Salary DECIMAL(10,2),
    DepartmentID INT,
    CONSTRAINT FK_Department FOREIGN KEY (DepartmentID) 
    REFERENCES Departments(DepartmentID) 
);

-- 3. Insert Data
INSERT INTO Departments (DepartmentName, Budget)
VALUES 
    ('HR', 500000.00),
    ('IT', 750000.00),
    ('Sales', 650000.00);

INSERT INTO Employees (FirstName, LastName, BirthDate, Salary, DepartmentID)
VALUES
    ('John', 'Doe', '1990-05-15', 60000.00, 2),
    ('Jane', 'Smith', '1985-08-22', 75000.00, 1),
    ('Mike', 'Johnson', '1995-02-10', 55000.00, 3);

-- 4. Basic Queries
-- Select all columns
SELECT * FROM Employees;

-- Select specific columns with alias
SELECT 
    FirstName AS "First Name",
    LastName AS "Last Name",
    Salary
FROM Employees;

-- Filter with WHERE
SELECT * FROM Employees
WHERE Salary > 60000;

-- Sort with ORDER BY
SELECT * FROM Employees
ORDER BY LastName DESC;

-- Limit results
SELECT * FROM Employees
LIMIT 2;

-- 5. Update Data
UPDATE Employees
SET Salary = Salary * 1.05
WHERE DepartmentID = 2;

-- 6. Delete Data
DELETE FROM Employees
WHERE EmployeeID = 3;

-- 7. Aggregation
SELECT 
    DepartmentID,
    COUNT(*) AS EmployeeCount,
    AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 50000;

-- 8. Joins
-- INNER JOIN
SELECT 
    e.FirstName,
    e.LastName,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;

-- LEFT JOIN
SELECT 
    d.DepartmentName,
    e.FirstName
FROM Departments d
LEFT JOIN Employees e
    ON d.DepartmentID = e.DepartmentID;

-- 9. Transactions
START TRANSACTION;
UPDATE Accounts SET balance = balance - 100 WHERE account_id = 1;
UPDATE Accounts SET balance = balance + 100 WHERE account_id = 2;
COMMIT;

-- 10. Index Creation
CREATE INDEX idx_lastname
ON Employees (LastName);

-- 11. Cleanup (Careful!)
DROP TABLE Employees;
DROP TABLE Departments;
DROP DATABASE Company;