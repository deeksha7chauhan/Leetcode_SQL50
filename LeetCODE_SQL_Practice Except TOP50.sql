#184. Department Highest Salary
#Write a solution to find employees who have the highest salary in each of the departments.
#SOLUTION 1---Using subquery
select d.name AS Department, e.name AS Employee, e.salary AS Salary from Employee e JOIN Department d ON e.departmentId=d.id where e.salary = (select MAX(salary) from Employee where departmentId = d.id); 

#SOLUTION 2---- DENSE_RANK()
SELECT Department, Employee, Salary FROM (SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary, DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rnk FROM Employee e JOIN Department d ON e.departmentId = d.id) ranked WHERE rnk = 1;

------------------------------------------------------------------------------------------------------------------------------
#175. Combine Two Tables
#Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.
SELECT p.firstName, p.lastName, a.city, a.state FROM Person p LEFT JOIN Address a ON p.personId=a.personID;

------------------------------------------------------------------------------------------------------------------------------
#181. Employees Earning More Than Their Managers
#Write a solution to find the employees who earn more than their managers.
Select e.name AS Employee from Employee e JOIN Employee e2 ON e.managerId = e2.id where e.salary>e2.salary; 
