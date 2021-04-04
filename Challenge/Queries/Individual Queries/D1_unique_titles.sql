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