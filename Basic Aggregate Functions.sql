----------------------------------------------------------------------------------------------------------------------------------------------------
#620. Not Boring Movies
#Write a solution to report the movies with an odd-numbered ID and a description that is not "boring". Return the result table ordered by rating in descending order.
select id, movie, description, rating from Cinema where id%2 != 0 AND description !='boring' order by rating DESC;

----------------------------------------------------------------------------------------------------------------------------------------------------
#1251. Average Selling Price
#Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. If a product does not have any sold units, its average selling price is assumed to be 0.
SELECT p.product_id,IFNULL(ROUND(SUM(u.units*p.price)/SUM(u.units),2),0) as average_price FROM Prices p LEFT JOIN UnitsSold u On p.product_id = u.product_id AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY product_id;

----------------------------------------------------------------------------------------------------------------------------------------------------
#1075. Project Employees I
#Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
select p.project_id,  ROUND(AVG(e.experience_years),2) AS average_years FROM Project p JOIN Employee e ON p.employee_id=e.employee_id group by p.project_id;

----------------------------------------------------------------------------------------------------------------------------------------------------
#1633. Percentage of Users Attended a Contest
#Write a solution to find the percentage of the users registered in each contest rounded to two decimals. Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.
select contest_id, round(count(distinct user_id)*100/(select count(user_id) from Users),2)  as percentage from Register group by contest_id order by percentage desc, contest_id;

----------------------------------------------------------------------------------------------------------------------------------------------------
#1211. Queries Quality and Percentage
#Write a solution to find each query_name, the quality and poor_query_percentage.Both quality and poor_query_percentage should be rounded to 2 decimal places.
SELECT query_name, ROUND(AVG(rating/position),2) AS quality, ROUND((SUM(rating<3)/(COUNT(*)))*100, 2)  AS poor_query_percentage FROM Queries group by query_name;

----------------------------------------------------------------------------------------------------------------------------------------------------
#1193. Monthly Transactions I
#Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.
# Write your MySQL query statement below
select DATE_FORMAT(trans_date, '%Y-%m') as month, country, count(trans_date) as trans_count,  sum(if(state='approved', 1, 0)) as approved_count, sum(amount) as trans_total_amount,  sum(if(state='approved', amount, 0)) as approved_total_amount
from transactions group by month, country;

----------------------------------------------------------------------------------------------------------------------------------------------------
#1174. Immediate Food Delivery II
#Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
  
