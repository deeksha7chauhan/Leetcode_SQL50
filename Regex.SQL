#1667. Fix Names in a Table
#Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase. Return the result table ordered by user_id.
select user_id, CONCAT(UPPER(SUBSTR(name, 1,1)), LOWER(SUBSTR(name,2))) AS name from Users order by user_id ASC

#1527. Patients With a Condition
#Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.
select patient_id,patient_name,conditions from Patients where conditions like 'DIAB1%'  or  conditions like '% DIAB1%' ;
#### % is a wildcard, meaning "any characters after".
#### conditions LIKE '% DIAB1%'This matches any condition where DIAB1 is not at the beginning, but appears with a space before it.The % before and after allows any text around DIAB1


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#196. Delete Duplicate Emails
#Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id. For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.
delete p1 from Person p1, Person p2where p1.Email = p2.Email and p1.id>p2.Id;
####DELETE FROM: This clause specifies that you want to remove rows from a table.
####p1: This is an alias for the Person table, used to make the query more readable.
####WHERE: This clause filters which rows to delete based on specific conditions.
####p1.Email = p2.Email: This condition matches rows where the Email values in p1 and p2 are identical.
####p1.id > p2.Id: This condition further filters to select rows where p1.id is greater than p2.id. This essentially means you're deleting the rows with higher IDs for each duplicate email address.

#1484. Group Sold Products By The Date
#Write a solution to find for each date the number of different products sold and their names.The sold products names for each date should be sorted lexicographically. Return the result table ordered by sell_date.
select sell_date, COUNT(DISTINCT product) AS num_sold,  GROUP_CONCAT(DISTINCT product order by product separator ',') AS products FROM Activities group by sell_date order by sell_date;

#1327. List the Products Ordered in a Period
#Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount. Return the result table in any order.
SELECT p.product_name, SUM(o.unit) AS unit from Products p JOIN Orders o ON p.product_id=o.product_id WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29' group by o.product_id having unit>=100;
OR
SELECT p.product_name, SUM(o.unit) as unit FROM Products p JOIN Orders o ON p.product_id = o.product_id where Month(order_date) = 2 and year(order_date) = '2020' group by p.product_id having unit >=100;

#1517. Find Users With Valid E-Mails
#Write a solution to find the users who have valid emails.
#A valid e-mail has a prefix name and a domain where: The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'. The prefix name must start with a letter.
#The domain is '@leetcode.com'. Return the result table in any order.
SELECT * FROM Users WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$'

#176. Second Highest Salary
#Write a solution to find the second highest distinct salary from the Employee table. If there is no second-highest salary, return null (return None in Pandas).
select max(Salary) as SecondHighestSalary from Employee where Salary < (select max(Salary) from Employee)
OR
select max(salary) AS SecondHighestSalary from employee where salary not in (select max(salary) from employee)
OR







