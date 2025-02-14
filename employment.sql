-- 1. Create the Database
CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;

-- 2. Create Tables

-- Departments Table
CREATE TABLE Departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Employees Table
CREATE TABLE Employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL CHECK (age > 18),
    gender VARCHAR(10) DEFAULT 'Unknown',
    salary INT NOT NULL CHECK (salary > 30000),
    department_id INT,
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);

-- Projects Table
CREATE TABLE Projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    budget INT NOT NULL CHECK (budget > 10000)
);

-- Employee_Projects Table
CREATE TABLE Employee_Projects (
    employee_id INT,
    project_id INT,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(id),
    FOREIGN KEY (project_id) REFERENCES Projects(id)
);

-- Attendance Table
CREATE TABLE Attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'On Leave'),
    FOREIGN KEY (employee_id) REFERENCES Employees(id)
);

-- 3. Insert Sample Data

-- Insert into Departments
INSERT INTO Departments (name)
VALUES ('IT'), ('HR'), ('Finance');

-- Insert into Employees
INSERT INTO Employees (name, age, gender, salary, department_id, email)
VALUES
    ('John Doe', 30, 'Male', 50000, 1, 'john.doe@example.com'),
    ('Jane Smith', 28, 'Female', 45000, 2, 'jane.smith@example.com'),
    ('Mike Johnson', 35, 'Male', 60000, 3, 'mike.johnson@example.com');

-- Insert into Projects
INSERT INTO Projects (name, budget)
VALUES
    ('Project Alpha', 150000),
    ('Project Beta', 50000),
    ('Project Gamma', 20000);

-- Insert into Employee_Projects
INSERT INTO Employee_Projects (employee_id, project_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

-- Insert into Attendance
INSERT INTO Attendance (employee_id, date, status)
VALUES
    (1, '2025-01-01', 'Present'),
    (2, '2025-01-01', 'Absent'),
    (3, '2025-01-01', 'On Leave');

-- 4. Queries

-- Retrieve all employees
SELECT * FROM Employees;

-- Retrieve all employees in the 'IT' department
SELECT * 
FROM Employees 
WHERE department_id = (SELECT id FROM Departments WHERE name = 'IT');

-- List all projects with a budget greater than 50000
SELECT * 
FROM Projects 
WHERE budget > 50000;


-- Find employees with a salary greater than 50000
SELECT * 
FROM Employees 
WHERE salary > 50000;

-- Get attendance records for a specific employee (e.g., employee with id 1)
SELECT * 
FROM Attendance 
WHERE employee_id = 1;



-- 5. Update Records

-- Increase the salary of employees in the 'HR' department by 10%
UPDATE Employees
SET salary = salary * 1.10
WHERE department_id = (SELECT id FROM Departments WHERE name = 'HR');

-- Change the department of an employee (e.g., changing employee with id 1 to 'Finance' department)
UPDATE Employees
SET department_id = (SELECT id FROM Departments WHERE name = 'Finance')
WHERE id = 1;

-- 6. Delete Records

-- Remove an employee who has resigned (e.g., employee with id 2)
DELETE FROM Employees
WHERE id = 2;

-- Delete a project that is completed (e.g., project with id 3)
DELETE FROM Projects
WHERE id = 3;

-- 7. Constraints and Modifications

-- Add a unique constraint to the `email` column in Employees table
ALTER TABLE Employees
ADD CONSTRAINT unique_email UNIQUE (email);

-- Ensure `age` is always greater than 18 (Already handled in table creation)

-- Add a default value 'Unknown' to `gender` if not specified (Already handled in table creation)
