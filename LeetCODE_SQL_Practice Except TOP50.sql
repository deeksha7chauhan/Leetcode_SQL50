                                                     EMPLOYEE- DEPARTMENT SALARY
------------------------------------------------------------------------------------------------------------------------------
#184. Department Highest Salary
#Write a solution to find employees who have the highest salary in each of the departments.
#SOLUTION 1---Using subquery
select d.name AS Department, e.name AS Employee, e.salary AS Salary from Employee e JOIN Department d ON e.departmentId=d.id where e.salary = (select MAX(salary) from Employee where departmentId = d.id); 

#SOLUTION 2---- DENSE_RANK()
SELECT Department, Employee, Salary FROM (SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary, DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rnk FROM Employee e JOIN Department d ON e.departmentId = d.id) ranked WHERE rnk = 1;

------------------------------------------------------------------------------------------------------------------------------

#181. Employees Earning More Than Their Managers
#Write a solution to find the employees who earn more than their managers.
Select e.name AS Employee from Employee e JOIN Employee e2 ON e.managerId = e2.id where e.salary>e2.salary; 
------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------
3436. Find Valid Emails
Write a solution to find all the valid email addresses. A valid email address meets the following criteria:
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
#262. Trips and Users
#Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03" with at least one trip. Round Cancellation Rate to two decimal points.
select t.Request_at Day, ROUND((count(IF(t.status!='completed',TRUE,null))/count(*)),2) as 'Cancellation Rate' from Trips t where  t.Client_Id in (Select Users_Id from Users where Banned='No')  and t.Driver_Id in (Select Users_Id from Users where Banned='No') 
and t.Request_at between '2013-10-01' and '2013-10-03' group by t.Request_at;
