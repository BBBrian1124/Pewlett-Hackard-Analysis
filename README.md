# Pewlett-Hackard-Analysis
UofT Data Analytics Boot Camp Module 7 - SQL
---
# Overview of the analysis: 
![ERD Diagram] https://github.com/BBBrian1124/Pewlett-Hackard-Analysis/blob/main/Challenge/EmployeeDB.png
*  We have been provided various CSV files that contains employee data and we will use SQL and pgAdmin to import those files, create tables and perform queries to obtain the information needed. These files contain employee information such as their employee no./IDs, names, job title, department, along with their start and end dates. We have been assigned the task to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. 
* Retiring Employees: defined as employees who are born between 1952 and 1955. 
* Mentorship Eligible Employees: defined as employees born in the year 1965 and are currently employed, and thus eligible for the mentorship program.
---
# Results: 
## Retiring Employees:
[Retirement Titles Query] https://github.com/BBBrian1124/Pewlett-Hackard-Analysis/blob/main/Challenge/Queries/Individual%20Queries/D1_retirement_titles.sql
* In order to obtain a count of retiring employees, we first merge the employee table with the title table to obtain name, title, and start and end dates. We can then filter by their birth dates to see whom is retiring. 

[Unique Titles Query] https://github.com/BBBrian1124/Pewlett-Hackard-Analysis/blob/main/Challenge/Queries/Individual%20Queries/D1_unique_titles.sql
* Because the employees may have had multiple titles, we want to find their most recent job title by looking for the first found title, when sorted by the most recent to_date.

[Retiring Titles Query] https://github.com/BBBrian1124/Pewlett-Hackard-Analysis/blob/main/Challenge/Queries/Individual%20Queries/D1_retiring_titles.sql
* We can then create a count of retiring employees grouped by title.

[Retiring Titles Data] https://github.com/BBBrian1124/Pewlett-Hackard-Analysis/blob/main/Challenge/Data/D1_retiring_titles.csv
* We can see from the output of the queries above how many employees in each position will be retiring.

## Mentorship Eligible Employees:
[Mentorship Eligible Query] https://github.com/BBBrian1124/Pewlett-Hackard-Analysis/blob/main/Challenge/Queries/Individual%20Queries/D2_mentorship_eligibilty.sql
* In order to find the eligible employees, we will select the columns we want from employee, department employee and titles table, then join them. We will filter it by their birth date and end date as per the eligibility criteria which will return a list of employees who are eligible for this mentorship program.

[Mentorship Eligible Data] https://github.com/BBBrian1124/Pewlett-Hackard-Analysis/blob/main/Challenge/Data/D2_mentorship_eligibilty.csv
---
# Summary
[Discrepancy Query] https://github.com/BBBrian1124/Pewlett-Hackard-Analysis/blob/main/Challenge/Queries/Individual%20Queries/AQ_Additional%20Queries.sql
* We can create more SQL queries to count and group the number of employees eligible for the mentorship program by title. We can then join this table/information with the 'retiring titles data' to see the number of employees retiring and the number of employee eligible for mentorship by title.
[Summary Data] https://github.com/BBBrian1124/Pewlett-Hackard-Analysis/blob/main/Challenge/Data/AQ_title_discrepancy.csv
## How many roles will need to be filled as the "silver tsunami" begins to make an impact?
* A look at the "Summary Data' from the above queries show how many employees will be retiring per title. 
## Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
* By merging in the mentorship eligible employees table, we can see that we have significantly more 'retiring employees' than 'mentorship eligible employees'. While there are enough 'retiring employees' to mentor other employees, we don't seem to have enough resources internally to fulfill the roles of those 'retiring employees' and may need to look externally. 
---
# Appendix:
[Challenge Repository] https://github.com/BBBrian1124/Pewlett-Hackard-Analysis/tree/main/Challenge
[SQL Queries] https://github.com/BBBrian1124/Pewlett-Hackard-Analysis/tree/main/Challenge/Queries
[Exported Data Files] https://github.com/BBBrian1124/Pewlett-Hackard-Analysis/tree/main/Challenge/Data

