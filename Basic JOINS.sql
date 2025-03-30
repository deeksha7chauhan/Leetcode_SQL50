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



