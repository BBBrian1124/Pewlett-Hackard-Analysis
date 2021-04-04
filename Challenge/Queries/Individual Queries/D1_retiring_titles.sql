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