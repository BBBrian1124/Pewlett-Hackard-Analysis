SELECT 
-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
	e.emp_no,
	e.first_name,
	e.last_name,
-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
	et.title,
	et.from_date,
	et.to_date
-- 3. Create a new table using the INTO clause.
INTO retirement_titles
-- 4. Join both tables on the primary key.
FROM employees as e
INNER JOIN title as et
ON (e.emp_no = et.emp_no)
-- 5. Filter the data on the birth_date column to retrieve the employees
--	who were born between 1952 and 1955. 
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- 	Then, order by the employee number
ORDER BY e.emp_no