-- SQL Query Optimization Project
-- Demo schema for MySQL 8+ / MariaDB.
-- Run this only if SkillPilots did not provide its own schema.
-- If you already have an employees table, inspect it first to avoid conflicts.

CREATE DATABASE IF NOT EXISTS sql_optimization_demo;
USE sql_optimization_demo;

CREATE TABLE IF NOT EXISTS departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    department_id INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL DEFAULT 30000.00,
    hire_date DATE NOT NULL,
    CONSTRAINT fk_employees_department
      FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments (department_name)
SELECT 'Engineering' WHERE NOT EXISTS (
  SELECT 1 FROM departments WHERE department_name = 'Engineering'
);
INSERT INTO departments (department_name)
SELECT 'Sales' WHERE NOT EXISTS (
  SELECT 1 FROM departments WHERE department_name = 'Sales'
);
INSERT INTO departments (department_name)
SELECT 'Human Resources' WHERE NOT EXISTS (
  SELECT 1 FROM departments WHERE department_name = 'Human Resources'
);
INSERT INTO departments (department_name)
SELECT 'Finance' WHERE NOT EXISTS (
  SELECT 1 FROM departments WHERE department_name = 'Finance'
);

-- Small sample data makes the project runnable. For a meaningful benchmark,
-- increase the dataset and repeat tests; small tables may still use table scans.
INSERT INTO employees (employee_name, email, department_id, salary, hire_date)
SELECT 'Aarav Sharma', 'aarav.sharma@example.com', 1, 65000, '2022-01-15'
WHERE NOT EXISTS (SELECT 1 FROM employees WHERE email='aarav.sharma@example.com');
INSERT INTO employees (employee_name, email, department_id, salary, hire_date)
SELECT 'Isha Patil', 'isha.patil@example.com', 2, 42000, '2023-03-20'
WHERE NOT EXISTS (SELECT 1 FROM employees WHERE email='isha.patil@example.com');
INSERT INTO employees (employee_name, email, department_id, salary, hire_date)
SELECT 'Rohan Deshmukh', 'rohan.deshmukh@example.com', 1, 72000, '2021-07-10'
WHERE NOT EXISTS (SELECT 1 FROM employees WHERE email='rohan.deshmukh@example.com');
INSERT INTO employees (employee_name, email, department_id, salary, hire_date)
SELECT 'Ananya Kulkarni', 'ananya.kulkarni@example.com', 3, 39000, '2024-02-05'
WHERE NOT EXISTS (SELECT 1 FROM employees WHERE email='ananya.kulkarni@example.com');
INSERT INTO employees (employee_name, email, department_id, salary, hire_date)
SELECT 'Vivaan Joshi', 'vivaan.joshi@example.com', 4, 58000, '2020-11-12'
WHERE NOT EXISTS (SELECT 1 FROM employees WHERE email='vivaan.joshi@example.com');
INSERT INTO employees (employee_name, email, department_id, salary, hire_date)
SELECT 'Saanvi Pawar', 'saanvi.pawar@example.com', 2, 45000, '2023-08-01'
WHERE NOT EXISTS (SELECT 1 FROM employees WHERE email='saanvi.pawar@example.com');

SELECT COUNT(*) AS employee_count FROM employees;
