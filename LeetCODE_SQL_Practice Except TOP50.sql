                                                     EMPLOYEE- DEPARTMENT SALARY
------------------------------------------------------------------------------------------------------------------------------
#184. Department Highest Salary
#Write a solution to find employees who have the highest salary in each of the departments.
#SOLUTION 1---Using subquery
select d.name AS Department, e.name AS Employee, e.salary AS Salary from Employee e JOIN Department d ON e.departmentId=d.id where e.salary = (select MAX(salary) from Employee where departmentId = d.id); 

#SOLUTION 2---- DENSE_RANK()
SELECT Department, Employee, Salary FROM (SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary, DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rnk 
FROM Employee e JOIN Department d ON e.departmentId = d.id) ranked WHERE rnk = 1;

------------------------------------------------------------------------------------------------------------------------------

#181. Employees Earning More Than Their Managers
#Write a solution to find the employees who earn more than their managers.
Select e.name AS Employee from Employee e JOIN Employee e2 ON e.managerId = e2.id where e.salary>e2.salary; 
------------------------------------------------------------------------------------------------------------------------------
#1084. Sales Analysis III
#Write a solution to report the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.
SELECT Product.product_id, Product.product_name FROM Product JOIN Sales ON Product.product_id = Sales.product_id GROUP BY Sales.product_id 
HAVING MIN(Sales.sale_date) >= "2019-01-01" AND MAX(Sales.sale_date) <= "2019-03-31";
###################WHERE clause with BETWEEN, you'd be filtering individual rows, not groups, which changes the logic.
*WHERE sale_date BETWEEN '2019-01-01' AND '2019-03-31'* only includes rows within that range, but it doesn’t guarantee that all sales for each product fall within the range

------------------------------------------------------------------------------------------------------------------------------
#1965. Employees With Missing Information
#Write a solution to report the IDs of all the employees with missing information. The information of an employee is missing if:The employee's name is missing, or The employee's salary is missing.
SELECT employee_id FROM Employees WHERE employee_id NOT IN (SELECT employee_id FROM Salaries)
UNION
SELECT employee_id FROM Salaries WHERE employee_id NOT IN (SELECT employee_id FROM Employees)
order by employee_id
  
------------------------------------------------------------------------------------------------------------------------------
#1179. Reformat Department Table
# Reformat the table such that there is a department id column and a revenue column for each month.
select id,
sum(if(month='Jan',revenue,null)) as Jan_Revenue, 
sum(if(month='Feb',revenue,null)) as Feb_Revenue, 
sum(if(month='Mar',revenue,null)) as Mar_Revenue, 
sum(if(month='Apr',revenue,null)) as Apr_Revenue, 
sum(if(month='May',revenue,null)) as May_Revenue, 
sum(if(month='Jun',revenue,null)) as Jun_Revenue, 
sum(if(month='Jul',revenue,null)) as Jul_Revenue, 
sum(if(month='Aug',revenue,null)) as Aug_Revenue, 
sum(if(month='Sep',revenue,null)) as Sep_Revenue, 
sum(if(month='Oct',revenue,null)) as Oct_Revenue, 
sum(if(month='Nov',revenue,null)) as Nov_Revenue, 
sum(if(month='Dec',revenue,null)) as Dec_Revenue 
from Department 
group by id;
  
------------------------------------------------------------------------------------------------------------------------------
#3436. Find Valid Emails
#Write a solution to find all the valid email addresses. A valid email address meets the following criteria:
SELECT * from Users where email REGEXP '^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$' order by user_id;
------------------------------------------------------------------------------------------------------------------------------
#627. Swap Salary
#Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.
UPDATE Salary SET sex = IF(sex = 'm', 'f', 'm');
------------------------------------------------------------------------------------------------------------------------------
#183. Customers Who Never Order
#Write a solution to find all customers who never order anything.
SELECT c.name AS Customers FROM Customers c LEFT JOIN Orders o ON c.id = o.customerId WHERE o.id IS NULL;
OR
SELECT name as Customers from Customers where id not in ( select customerId from Orders)
  
------------------------------------------------------------------------------------------------------------------------------
#182. Duplicate Emails
#Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.
SELECT Email FROM Person GROUP BY Email HAVING COUNT(Email) > 1;

------------------------------------------------------------------------------------------------------------------------------
#607. Sales Person
#Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".
# Write your MySQL query statement below
select s.name from salesperson s except select p.name from salesperson p left join orders o on p.sales_id=o.sales_id left join company c on c.com_id=o.com_id 
where c.name='RED';
  OR
select s.name FROM SalesPerson s where s.name NOT IN (select s.name from SalesPerson s Left JOIN Orders o ON s.sales_id=o.sales_id LEFT JOIN Company c on o.com_id=c.com_id where c.name='RED');

------------------------------------------------------------------------------------------------------------------------------
#175. Combine Two Tables
#Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.
SELECT p.firstName, p.lastName, a.city, a.state FROM Person p LEFT JOIN Address a ON p.personId=a.personID;

------------------------------------------------------------------------------------------------------------------------------
#511. Game Play Analysis I
#Write a solution to find the first login date for each player.
SELECT DISTINCT player_id, MIN(event_date)AS first_login FROM Activity group by player_id;

------------------------------------------------------------------------------------------------------------------------------
#586. Customer Placing the Largest Number of Orders
#Write a solution to find the customer_number for the customer who has placed the largest number of orders.
select customer_number from Orders group by customer_number order by COUNT(customer_number ) DESC LIMIT 1;

------------------------------------------------------------------------------------------------------------------------------
#1050. Actors and Directors Who Cooperated At Least Three Times
#Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.
select actor_id, director_id FROM ActorDirector group by actor_id, director_id having COUNT(actor_id) >=3;
  
------------------------------------------------------------------------------------------------------------------------------
#262. Trips and Users
#Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03" with at least one trip. Round Cancellation Rate to two decimal points.
select t.Request_at Day, ROUND((count(IF(t.status!='completed',TRUE,null))/count(*)),2) as 'Cancellation Rate' from Trips t where  t.Client_Id in (Select Users_Id from Users where Banned='No')  and t.Driver_Id in (Select Users_Id from Users where Banned='No') 
and t.Request_at between '2013-10-01' and '2013-10-03' group by t.Request_at;
