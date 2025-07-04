-- Step 1: Drop the table if exists (safe start)
DROP TABLE IF EXISTS employee;

-- Step 2: Create employee table
CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,              -- Auto-increment ID
    first_name VARCHAR(100) NOT NULL,           -- First name
    last_name VARCHAR(100) NOT NULL,            -- Last name
    email VARCHAR(255) UNIQUE NOT NULL,         -- Unique email
    hire_date DATE NOT NULL DEFAULT CURRENT_DATE, -- Hire date
    department VARCHAR(100),                    -- Department
    salary DECIMAL(10,2) CHECK (salary > 0),   -- Salary with constraint
    is_active BOOLEAN DEFAULT TRUE              -- Status
);

-- Step 3: Insert single employee
INSERT INTO employee (first_name, last_name, email, department, salary)
VALUES ('John', 'Doe', 'john.doe@company.com', 'Engineering', 70000.00);

-- Step 4: Insert multiple employees
INSERT INTO employee (first_name, last_name, email, department, salary) VALUES
  ('Alice', 'Smith', 'alice.smith@company.com', 'HR', 50000.00),
  ('Bob', 'Johnson', 'bob.johnson@company.com', 'Marketing', 60000.00),
  ('Emma', 'Brown', 'emma.brown@company.com', 'Finance', 65000.00),
  ('David', 'Lee', 'david.lee@company.com', 'Engineering', 75000.00),
  ('Sarah', 'Wilson', 'sarah.wilson@company.com', 'Sales', 55000.00),
  ('Olivia', 'Martinez', 'olivia.martinez@company.com', 'HR', 48000.00),
  ('James', 'Clark', 'james.clark@company.com', 'Engineering', 80000.00);

-- Step 5: Select all employees
SELECT * FROM employee;

-- Step 6: Select specific columns
SELECT first_name, last_name, email FROM employee;

-- Step 7: Order employees by salary descending
SELECT first_name, last_name, salary
FROM employee
ORDER BY salary DESC;

-- Step 8: Filter employees by department
SELECT * FROM employee
WHERE department = 'Engineering' AND is_active = TRUE;

-- Step 9: Filter using LIKE (case-insensitive)
SELECT * FROM employee
WHERE first_name ILIKE '%a%';

-- Step 10: Update an employee's salary
UPDATE employee
SET salary = 82000.00
WHERE employee_id = 1;

-- Step 11: Add new column (phone number)
ALTER TABLE employee ADD COLUMN phone_number VARCHAR(20);

-- Step 12: Update new column data
UPDATE employee
SET phone_number = '9998887777'
WHERE employee_id = 1;

-- Step 13: Drop the new column
ALTER TABLE employee DROP COLUMN phone_number;

-- Step 14: Rename a column
ALTER TABLE employee RENAME COLUMN department TO dept;

-- Step 15: Rename the table
ALTER TABLE employee RENAME TO staff;

-- Step 16: Rename back
ALTER TABLE staff RENAME TO employee;

-- Step 17: Delete an employee
DELETE FROM employee
WHERE employee_id = 3;

-- Step 18: Drop the table at end (optional cleanup)
-- DROP TABLE IF EXISTS employee;
