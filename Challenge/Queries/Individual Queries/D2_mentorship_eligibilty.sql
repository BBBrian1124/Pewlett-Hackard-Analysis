-- 4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number 
	-- for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (emp_no)
-- 1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
-- 2. Retrieve the from_date and to_date columns from the Department Employee table.
	de.from_date,
	de.to_date,
-- 3. Retrieve the title column from the Titles table.
	ti.title
-- 5. Create a new table using the INTO clause.
INTO mentorship_eligibility 
-- 6. Join the Employees and the Department Employee tables on the primary key.
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
-- 7. Join the Employees and the Titles tables on the primary key.
	INNER JOIN title as ti
		ON (e.emp_no = ti.emp_no)
-- 8. Filter the data on the to_date column to get current employees whose 
--		birth dates are between January 1, 1965 and December 31, 1965.
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
-- 9. Order the table by the employee number
ORDER BY e.emp_no
-- 10. Export the Mentorship Eligibility table as mentorship_eligibilty.csv 
-- 		and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 11. Before you export your table, confirm that it looks like this image:
