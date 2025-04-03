--------------------------------------------------------------------------------------------------------------------------------------------------
#2356. Number of Unique Subjects Taught by Each Teacher
#Write a solution to calculate the number of unique subjects each teacher teaches in the university. Return the result table in any order
select teacher_id, COUNT(DISTINCT subject_id) AS cnt  FROM Teacher group by teacher_id;

--------------------------------------------------------------------------------------------------------------------------------------------------
#1141. User Activity for the Past 30 Days I
#Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.
select activity_date AS day, COUNT(DISTINCT user_id) AS active_users  from Activity where activity_date BETWEEN '2019-06-28' AND '2019-07-27' group by activity_date;

--------------------------------------------------------------------------------------------------------------------------------------------------
#596. Classes More Than 5 Students
#Write a solution to find all the classes that have at least five students.
SELECT class FROM (SELECT class, COUNT(DISTINCT student) AS student_count FROM Courses GROUP BY class) AS class_counts WHERE student_count >= 5;
OR 
Select class FROM Courses Having COUNT(distinct student)>=5;

--------------------------------------------------------------------------------------------------------------------------------------------------
#1729. Find Followers Count
#Write a solution that will, for each user, return the number of followers.
select user_id, COUNT(DISTINCT follower_id) AS followers_count FROM Followers group by user_id order by user_id

--------------------------------------------------------------------------------------------------------------------------------------------------
#619. Biggest Single Number
#A single number is a number that appeared only once in the MyNumbers table. Find the largest single number. If there is no single number, report null.
SELECT MAX(num) As num from (select num from MyNumbers group by num HAVING COUNT(num)=1) AS no;
OR
SELECT IFNULL((SELECT MAX(num) FROM (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(*) = 1) t), NULL) AS num;

--------------------------------------------------------------------------------------------------------------------------------------------------
#1070. Product Sales Analysis III
#Write a solution to select the product id, year, quantity, and price for the first year of every product sold.
# Write your MySQL query statement below
select product_id, year as first_year, quantity, price from Sales where ((product_id, year) IN (select product_id, MIN(year) from Sales group by product_id));

--------------------------------------------------------------------------------------------------------------------------------------------------
#1045. Customers Who Bought All Products
#Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
select customer_id FROM Customer group by customer_id HAVING COUNT(DISTINCT product_key) =  (SELECT COUNT(product_key) FROM Product)

--------------------------------------------------------------------------------------------------------------------------------------------------
