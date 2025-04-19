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
#Write a solution to find for each date the number of different products sold and their names.The sold products names for each date should be sorted lexicographically.Return the result table ordered by sell_date.
# Write your MySQL query statement below
SELECT sell_date, COUNT(DISTINCT product) as num_sold, GROUP_CONCAT(DISTINCT product ORDER BY product ASC) AS products from Activities group by sell_date order by sell_date;



