##################################################################################################################################################################
#1731. The Number of Employees Which Report to Each Employee
#Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
SELECT e2.employee_id, e2.name, COUNT(e.employee_id) AS reports_count, ROUND(AVG(e.age)) AS average_age FROM Employees e 
JOIN Employees e2 ON e.reports_to = e2.employee_id GROUP BY e2.employee_id, e2.name ORDER BY e2.employee_id;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#1789. Primary Department for Each Employee
#Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.
SELECT employee_id,department_id FROM Employee WHERE primary_flag='Y' OR employee_id IN (SELECT employee_id FROM Employee
Group by employee_id HAVING COUNT(employee_id)=1)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#610. Triangle Judgement
#Report for every three line segments whether they can form a triangle.
SELECT *, IF(x+y>z and y+z>x and z+x>y, "Yes", "No") as triangle FROM Triangle

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#180. Consecutive Numbers
#Find all numbers that appear at least three times consecutively.
SELECT DISTINCT num AS ConsecutiveNums FROM (SELECT num, LEAD(num, 1) OVER (ORDER BY id) AS next_num_1, 
LEAD(num, 2) OVER (ORDER BY id) AS next_num_2 FROM Logs) AS temp WHERE num = next_num_1 AND num =next_num_2;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#1164. Product Price at a Given Date
#Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.
select product_id, new_price AS price FROM Products where (product_id, change_date) IN (select product_id, MAX(change_date) FROM Products where change_date <= '2019-08-16' group by product_id) 
UNION
select product_id, 10 AS price FROM Products where (product_id) NOT IN (select product_id FROM Products where change_date <= '2019-08-16');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#1204. Last Person to Fit in the Bus
#Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that the first person does not exceed the weight limit.
SELECT person_name from (SELECT person_name,turn, sum(weight) over (order by turn) AS cum FROM queue) p1
where cum<=1000 order by turn DESC limit 1;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#1907. Count Salary Categories
#Write a solution to calculate the number of bank accounts for each salary category. The salary categories are: "Low Salary": All the salaries strictly less than $20000.
#"Average Salary": All the salaries in the inclusive range [$20000, $50000]. "High Salary": All the salaries strictly greater than $50000.
SELECT 'Low Salary' AS category, SUM(if(income<20000,1,0)) AS accounts_countFROM Accounts
UNION
SELECT 'Average Salary' AS category,  SUM(if(income BETWEEN 20000 AND 50000,1,0)) AS accounts_count FROM Accounts
UNION
SELECT 'High Salary' AS category, SUM(if(income>50000,1,0)) AS accounts_count FROM Accounts;
