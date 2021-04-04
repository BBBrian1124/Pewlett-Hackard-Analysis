--MENTORSHIP TITLES: Create a query to count the # of mentorship eligible employees by title 
SELECT COUNT(me.title),
	me.title
INTO mentorship_titles
FROM mentorship_eligibility as me
GROUP BY me.title

--TITLE DISCREPANCY: Create a query to view the count of employees retiring vs. eligible for mentorship for each title and the variance
SELECT
	rt.title,
	rt.title_count as retiring_count,
	mt.title_count as mentorship_count,
	rt.title_count - mt.title_count as discrepancy
INTO title_discrepancy
FROM mentorship_titles as mt	
FULL OUTER JOIN retiring_titles as rt
ON rt.title = mt.title