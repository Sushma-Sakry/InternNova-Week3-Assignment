# Task 1: Introduction to Databases & SELECT Statement

CREATE DATABASE internova_week3;

USE internova_week3;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary FLOAT
);

INSERT INTO employees VALUES
(1, 'Aarav', 'IT', 'Bengaluru', 55000),
(2, 'Pooja', 'HR', 'Mumbai', 45000),
(3, 'Riya', 'IT', 'Bengaluru', 60000),
(4, 'Sneha', 'Finance', 'Mumbai', 50000),
(5, 'Kiran', 'Sales', 'Chennai', 40000),
(6, 'Ananya', 'IT', 'Hyderabad', 65000),
(7, 'Rudra', 'Sales', 'Bengaluru', 42000),
(8, 'Meera', 'HR', 'Chennai', 48000);

SELECT * FROM employees;

SELECT employee_name, department, salary
FROM employees;

SELECT employee_name AS Employee,
    salary AS Salary
FROM employees;

# Task 2: WHERE, ORDER BY & Aggregate Functions

SELECT *
FROM employees
WHERE salary > 50000;

SELECT *
FROM employees
WHERE department = 'IT';

SELECT *
FROM employees
ORDER BY salary ASC;

SELECT *
FROM employees
ORDER BY salary DESC;

SELECT COUNT(*) AS Total_Employees
FROM employees;

SELECT SUM(salary) AS Total_Salary
FROM employees;

SELECT AVG(salary) AS Average_Salary
FROM employees;

SELECT MIN(salary) AS Minimum_Salary
FROM employees;

SELECT MAX(salary) AS Maximum_Salary
FROM employees;

# aggregate functions sum, count, avg, min, max together

SELECT
    COUNT(*) AS Total_Employees,
    SUM(salary) AS Total_Salary,
    AVG(salary) AS Average_Salary,
    MIN(salary) AS Minimum_Salary,
    MAX(salary) AS Maximum_Salary
FROM employees;

#Task 3: GROUP BY & HAVING

SELECT department, COUNT(*) AS Employee_Count, AVG(salary) AS Average_Salary
FROM employees
GROUP BY department;

SELECT department, AVG(salary) AS Average_Salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

# Task 4: SQL Joins

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department VARCHAR(50),
    manager_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'IT', 'Vikram'),
(2, 'HR', 'Neha'),
(3, 'Finance', 'Smitha'),
(4, 'Sales', 'Priya'),
(5, 'Marketing', 'Rohan');

SELECT e.employee_name, e.department, d.manager_name
FROM employees e
INNER JOIN departments d
ON e.department = d.department;

SELECT e.employee_name, e.department, d.manager_name
FROM employees e
LEFT JOIN departments d
ON e.department = d.department;

SELECT e.employee_name, e.department, d.manager_name
FROM employees e
RIGHT JOIN departments d
ON e.department = d.department;

# Task 5: SQL Subqueries
# Employees earning above average salary

SELECT employee_name, department, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

# Employees earning the maximum salary

SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);
