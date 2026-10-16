-- Create indexes after recording the baseline plans.
USE sql_optimization_demo;

CREATE INDEX idx_employees_department_id
ON employees (department_id);

CREATE INDEX idx_employees_salary
ON employees (salary);

CREATE INDEX idx_employees_hire_date
ON employees (hire_date);

-- email is not indexed in the demo schema. If you add email lookup as a test:
-- CREATE INDEX idx_employees_email ON employees (email);
-- Do not create duplicate indexes; inspect with SHOW INDEX FROM employees.
