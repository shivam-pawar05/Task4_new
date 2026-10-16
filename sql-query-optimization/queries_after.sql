-- Re-run the same queries AFTER indexes.sql.
USE sql_optimization_demo;

EXPLAIN SELECT employee_id, employee_name, department_id
FROM employees
WHERE department_id = 1;

EXPLAIN SELECT employee_id, employee_name, salary
FROM employees
WHERE salary >= 50000;

EXPLAIN SELECT employee_id, employee_name, hire_date
FROM employees
WHERE hire_date >= '2023-01-01';

-- Compare key, type, rows, and Extra with queries_before.sql.
-- Optimizer may choose a table scan on a small table; this is not necessarily an error.
