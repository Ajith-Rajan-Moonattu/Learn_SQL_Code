
-----------------------------------LEARN SQL------------------------------------------------------

--Comparison Operators

--SELECT
--Retrieve all data and columns from customers

SELECT *
FROM customers

--Retrieve ONLY first name and country of all customers
SELECT
first_name,
country
FROM customers

--DISTINCT
--List all countries of all customers without duplicates

SELECT DISTINCT country
FROM customers

--Find all customers whose score is greater than 500

SELECT *
FROM customers
WHERE score > 500
--Find all customers whose score is less than 500

SELECT *
FROM customers
WHERE score < 500
--Find all customers whose score is less than or equal to 500

--ORDER BY
--Retrieve all customers where the result is sorted by score
--(smallest first)

SELECT *
FROM customers
ORDER BY score ASC

--Retrieve all customers where the result is sorted by score
--(highest first)

SELECT *
FROM customers
ORDER BY score DESC

--Retrieve all customers, sorting the result by country
--(alphabetically) and then by score (highest first)

SELECT *
FROM customers
ORDER BY country ASC, score DESC

--Find all customers whose score is less than or equal to
--500

SELECT *
FROM customers
WHERE score <= 500

--Find all customers whose score is higher than or equal to
--500

SELECT *
FROM customers
WHERE score >= 500
Find all non-german customers

-

Logical Operators

--FILTERING DATA
--WHERE
--List only german customers

SELECT *
FROM customers
WHERE customers = ‘Germany‘

_AND_
--Find all customers who come from Germany AND whose
--score is less than 400

SELECT *
FROM customers
WHERE country = ‘Germany‘
AND score <= 400

--Find all customers whose first name contains r

--Find all customers who come from Germany OR whose
--score is less than 400

SELECT *
FROM customers
WHERE first_name LIKE ‘%r%‘

SELECT *
FROM customers
WHERE country = ‘Germany‘
OR score < 400

NOT

--Find all customers whose first name contains r in 2d
--position

SELECT *
FROM customers
WHERE first_name LIKE ‘__r%‘

--Find all customers whose score is NOT less than 400

SELECT *
FROM customers
WHERE NOT score < 400

BETWEEN
--Find all customers whose score falls in the range between
--100 and 500

SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500

--Or we can solve the same task with the following SQL

SELECT *
FROM customers
WHERE score >= 100 AND score <= 500

IN
--Find all customers whose ID is equal to 1, 2 or 5

SELECT *
FROM customers
WHERE customer_id IN (1,2,5)

LIKE
--Find all customers whose first name starts with M

SELECT *
FROM customers
WHERE first_name LIKE ‘M%‘

--Find all customers whose first name ends with n

SELECT *
FROM customers
WHERE first_name LIKE ‘%n‘

ALIASES
Columns

SELECT customer_id AS cid
FROM customers
Tables

SELECT c.customer_id AS cid
FROM customers AS c

--JOINING TABLES
--INNER JOIN
--List customer ID, first name, order ID, quantity. Exclude
--the customers who have not placed any orders

SELECT
c.customer_id,
c.first_name,
o.order_id,
o.quantity
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id


--LEFT JOIN
--List customer ID, first name, order ID, quantity. Include
--the customers who have not placed any orders

SELECT
c.customer_id,
c.first_name,
o.order_id,
o.quantity
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id

--SQL Cheat Sheet
--RIGHT JOIN

UNION

List customer ID, first name, order ID, quantity. Include all
orders, regardless of whether there is a matching
customer

--List first name, last name and country of all persons from
--customers and employees

--FULL JOIN

SELECT
first_name,
last_name,
country
FROM customers
UNION ALL
SELECT
first_name,
last_name,
emp_country
FROM orders

--List customer ID, first name, order ID, quantity. Include all
--customers and all orders.

List first name, last name and country of all persons from
customers and employees without duplicates

--For All databases that support FULL JOIN 

SELECT
first_name,
last_name,
country
FROM customers
UNION
SELECT
first_name,
last_name,
emp_country
FROM orders

SELECT
c.customer_id,
c.first_name,
o.order_id,
o.quantity
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id

SELECT
c.customer_id,
c.first_name,
o.order_id,
o.quantity
FROM customers AS c
FULL JOIN orders AS o
ON c.customer_id = o.customer_id

--Workaround for databases that doenst support FULL JOIN


SELECT
c.customer_id,
c.first_name,
o.order_id,
o.quantity
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
UNION
SELECT
c.customer_id,
c.first_name,
o.order_id,
o.quantity
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id

--String Functions

--Aggregate Functions

--COUNT()
--Find the total number of customers

SELECT COUNT(*) AS total_customers
FROM customers

--SUM()
--Find the total quantity of all orders

SELECT SUM(quantity) AS sum_quantity
FROM orders

AVG()
Find the average score of all customers

CONCAT()
List all customer names, where the name is combination
of first name and last name

SELECT
CONCAT(first_name,‘-‘,lastname) AS
customer_name
FROM customers

LOWER()
List the first name of all customers in lowercase

SELECT AVG(score) AS avg_score
FROM orders

SELECT
LOWER(first_name) AS low_first_name
FROM customers

MAX() MIN()

UPPER()

--Find the highest score of all customers

--List the first name of all customers in lowercase

SELECT MAX(score) AS max_score
FROM customers

SELECT
UPPER(first_name) AS up_first_name
FROM customers

--Find the lowest score of all customers

SELECT LOW(score) AS low_score
FROM customers

--GROUP BY
--Find the total number of customers for each country

SELECT
COUNT(*) AS total_customers,
country
FROM Customers
GROUP BY country

--TRIM()
--List the last name of all customers and remove all the
--white spaces in the names

SELECT
TRIM(last_name) AS trim_last_name
FROM customers

LENGTH()
Find the length of the last name of all customers

HAVING

SELECT
LENGTH(last_name) AS len_last_name
FROM customers

--Find the total number of customers for each country and
--only include countries that have more than 1 customer

SUBSTRING()

SELECT
COUNT(*) AS total_customers,
country
FROM Customers
GROUP BY Country
HAVING COUNT(*) > 1

--Subtract 3 characters from the last name of all customers,
--starting from the 2d position

SELECT
SUBSTRING(last_name,2,3) AS
sub_last_name
FROM customers


--Defining Data

--Modifying Data
INSERT

CREATE

Insert new customer Anna Nixon from UK

--Create new SQL table called Persons with 4 columns:
--ID, person name, birth date, and phone

INSERT INTO customers
(first_name, last_name, country)
VALUES (‘Anna‘,‘Nixon‘,‘UK‘)

UPDATE
--Change the country of customer ID 7 to Germany

UPDATE customers
SET country = ‘Germany‘
WHERE customer_id = 7

CREATE TABLE persons (
id INT PRIMARY_KEY AUTO_INCREMENT,
Person_name VARCHAR(50) NOT NULL,
birth_date DATE,
phone VARCHAR(15) NOT NULL UNIQUE
)

--ALTER

--Change the score of the customer Anna to 100 and change
--her country from UK to USA

Add new column called email to table Persons

UPDATE customers
SET country = ‘USA‘,
country = 100
WHERE customer_id = 6

ALTER TABLE persons
ADD email VARCHAR(15) NOT NULL

DELETE
--Delete both customers Anna and Max from our database

DROP
--Delete the new table Persons from our database

DROP TABLE persons

DELETE FROM customers
WHERE customer_id IN (6,7)

TRUNCATE
Delete all customers from our database

TRUNCATE customers

Subqueries
IN
--Find all orders placed from customers whose score higher
--than 500 using customer_id

SELECT *
FROM orders
WHERE customer_id IN (
SELECT customer_id
FROM customers
WHERE score > 500)

IN
--Find all orders placed from customers whose score higher
--than 500 using customer_id

SELECT *
FROM orders AS o
WHERE EXISTS (
SELECT 1
FROM customers AS c
WHERE c.customer_id = o.customer_id
AND score > 500)





 

