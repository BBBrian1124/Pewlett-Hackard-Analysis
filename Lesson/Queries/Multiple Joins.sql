-- Employee Information: A list of employees containing their 
-- unique employee number, their last name, first name, gender, and salary
-- First select the columns
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
-- Place the results into a new table 
INTO emp_info
-- First join the employee table with the salaries table
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
-- then join the dept_emp table as well
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
-- use conditions to filter those who are eligible for retirement and still employed
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

-- Management: A list of managers for each department, including 
-- the department number, name, and the manager's employee number, last name, first name, 
-- and the starting and ending employment dates
-- First select the columns
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
-- Place results into a new table
INTO manager_info
-- Define table 1 as dept_manager or dm
FROM dept_manager AS dm
	-- INNER JOIN dm with departments and current_emp
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

-- Department Retirees: An updated current_emp list that includes 
-- everything it currently has, but also the employee's departments
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	ce.to_date,
	d.dept_name
INTO dept_info
FROM current_emp as ce
	INNER JOIN dept_emp as de
		ON (ce.emp_no = de.emp_no)
	Inner JOIN departments as d
		ON (de.dept_no = d.dept_no);

-- Create a query that will return only the information relevant to the Sales team. 
-- The requested list includes:
	-- Employee number, first name, last name, department name 
	-- where they are in sales or development
-- First specify the columns to return	
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name
INTO skill_chall_7_3_5
-- Declare table 1 as employee or e	
FROM employees as e
	-- INNER JOIN table 1 with dept_emp or de were emp_no match 
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	-- INNER JOIN with departments where dept_no match	
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no)
-- Using IN to filter where dept_name = to sales or development 
WHERE d.dept_name IN ('Sales','Development');
