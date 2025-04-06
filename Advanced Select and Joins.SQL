##################################################################################################################################################################
#1731. The Number of Employees Which Report to Each Employee
#Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
SELECT e2.employee_id, e2.name, COUNT(e.employee_id) AS reports_count, ROUND(AVG(e.age)) AS average_age FROM Employees e 
JOIN Employees e2 ON e.reports_to = e2.employee_id GROUP BY e2.employee_id, e2.name ORDER BY e2.employee_id;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
