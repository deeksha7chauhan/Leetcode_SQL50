#1757. Recyclable and Low Fat Products
#Q. Write a solution to find the ids of products that are both low fat and recyclable. Return Table in any order.
SELECT product_id from Products where low_fats='Y' AND recyclable='Y' order by product_id;

------------------------------------------------------------------------------------------------------------------------------
#584. Find Customer Referee
#Find the names of the customer that are not referred by the customer with id = 2.
SELECT name FROM CUSTOMER Where referee_id != 2 or referee_id IS NULL;

------------------------------------------------------------------------------------------------------------------------------
#595. Big Countries
#A country is big if: it has an area of at least three million (i.e., 3000000 km2), or it has a population of at least twenty-five million (i.e., 25000000). Write a solution to find the name, population, and area of the big countries.
SELECT name, population, area from World where area >= '3000000' OR population >= '25000000' order by name;

------------------------------------------------------------------------------------------------------------------------------
#1148. Article Views I
#Write a solution to find all the authors that viewed at least one of their own articles. Return the result table sorted by id in ascending order.
Select DISTINCT(author_id) AS id from Views where author_id = viewer_id order by author_id;

------------------------------------------------------------------------------------------------------------------------------
#1683. Invalid Tweets
#Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
select tweet_id from tweets where length(content)>15;
