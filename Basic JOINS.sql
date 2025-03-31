https://leetcode.com/studyplan/top-sql-50/
------------------------------------------------------------------------------------------------------------------------------
                                                  #BASIC JOINS#
#1378. Replace Employee ID With The Unique Identifier
#Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
SELECT eu.unique_id, e.name from  Employees e LEFT JOIN  EmployeeUNI eu  ON eu.id=e.id;

------------------------------------------------------------------------------------------------------------------------------
#1068. Product Sales Analysis I
#Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
Select p.product_name, s.year, s.price from Sales s JOIN Product p on s.product_id= p.product_id;


------------------------------------------------------------------------------------------------------------------------------
#1581. Customer Who Visited but Did Not Make Any Transactions
#Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
# Write your MySQL query statement below
#SOLUTION 1 USING JOINS: - 
select v.customer_id, COUNT(v.visit_id) AS count_no_trans from Visits v LEFT JOIN transactions t ON v.visit_id= t.visit_id where t.visit_id IS NULL group by v.customer_id;
#SOLUTION 2 USING subquery: -
select customer_id, COUNT(visit_id) AS count_no_trans FROM Visits where visit_id NOT IN (select visit_id from Transactions) group by customer_id;

------------------------------------------------------------------------------------------------------------------------------
#197. Rising Temperature
#Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).
select w.id from Weather w JOIN Weather w2 ON  DATEDIFF(w.recordDate, w2.recordDate) =1 where w.temperature > w2.temperature;

------------------------------------------------------------------------------------------------------------------------------
#1661. Average Time of Process per Machine
#Write a solution to find the average time each machine takes to complete a process. The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
SELECT a.machine_id, ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time from Activity a JOIN Activity b ON a.machine_id = b.machine_id and a.process_id= b.process_id and a.activity_type='start' and b.activity_type='end' group by a.machine_id;
  
------------------------------------------------------------------------------------------------------------------------------
#577. Employee Bonus
#Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.
select e.name, b.bonus from Employee e left join Bonus b ON e.empId = b.empId where b.bonus<1000 or b.bonus IS NULL;

------------------------------------------------------------------------------------------------------------------------------
#1280. Students and Examinations
#Write a solution to find the number of times each student attended each exam. Return the result table ordered by student_id and subject_name.
select s.student_id, s.student_name, sb.subject_name, COUNT(e.subject_name) AS attended_exams FROM Students s JOIN Subjects sb LEFT JOIN Examinations e ON s.student_id = e.student_id AND sb.subject_name = e.subject_name GROUP BY s.student_id, sb.subject_name ORDER BY s.student_id ASC, sb.subject_name ASC;

------------------------------------------------------------------------------------------------------------------------------
#570. Managers with at Least 5 Direct Reports
#Write a solution to find managers with at least five direct reports.
SELECT a.name FROM Employee a JOIN Employee b ON a.id = b.managerId GROUP BY b.managerId HAVING COUNT(*) >= 5;

------------------------------------------------------------------------------------------------------------------------------
#1934. Confirmation Rate
#Write a solution to find the confirmation rate of each user.
Select s.user_id, ROUND(AVG(if(c.action='confirmed',1,0)),2) AS confirmation_rate from Signups s left join Confirmations c ON s.user_id=c.user_id group by user_id;


