-- D1_RETIREMENT_TITLES 
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
-- 6. Export the Retirement Titles table from the previous step as retirement_titles.csv 
-- and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 7. Before you export your table, confirm that it looks like this image:

-- D1_UNIQUE_TITLES
-- 8. Copy the query from the Employee_Challenge_starter_code.sql 
-- and add it to your Employee_Database_challenge.sql file

-- 10. Use the DISTINCT ON statement to retrieve the first occurrence of the employee number
-- 		for each set of rows defined by the ON () clause
SELECT DISTINCT ON (emp_no)
-- 9. Retrieve the employee number, first and last name, and title columns 
-- 		from the Retirement Titles table
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
-- 11. Create a Unique Titles table using the INTO clause.
INTO unique_titles
FROM retirement_titles as rt
-- 12. Sort the Unique Titles table in ascending order by the employee number 
-- and descending order by the last date (i.e. to_date) of the most recent title
ORDER BY rt.emp_no ASC, to_date DESC
-- 13. Export the Unique Titles table as unique_titles.csv 
-- 	and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 14. Before you export your table, confirm that it looks like this image

-- D1_RETIRING_TITLES
-- 15. Write another query in the Employee_Database_challenge.sql file to retrieve
-- 		the number of employees by their most recent job title who are about to retire.
-- 16. First, retrieve the number of titles from the Unique Titles table
SELECT COUNT(ut.title) as title_count, 
	ut.title
-- 17. Then, create a Retiring Titles table to hold the required information
INTO retiring_titles
FROM unique_titles as ut 
-- 18. Group the table by title, then sort the count column in descending order
GROUP BY ut.title
ORDER BY title_count DESC
-- 19. Export the Retiring Titles table as retiring_titles.csv 
-- and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 20. Before you export your table, confirm that it looks like this image

-- D2_MENTORSHIP_ELIGIBILITY
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

--AQ_ADDITIONAL_QUERIES
--MENTORSHIP_TITLES: Create a query to count the # of mentorship eligible employees by title 
SELECT COUNT(me.title),
	me.title
INTO mentorship_titles
FROM mentorship_eligibility as me
GROUP BY me.title

--TITLE_DISCREPANCY: Create a query to view the count of employees retiring vs. eligible for mentorship for each title and the variance
SELECT
	rt.title,
	rt.title_count as retiring_count,
	mt.title_count as mentorship_count,
	rt.title_count - mt.title_count as discrepancy
INTO title_discrepancy
FROM mentorship_titles as mt	
FULL OUTER JOIN retiring_titles as rt
ON rt.title = mt.title