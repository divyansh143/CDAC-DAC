show databases;
use sales;
show tables;
use mysql;
DROP DATABASE sales;
Create Database sales;

-- SQL EXERCISE 2

-- Q1
SELECT * FROM SALESPEOPLE ORDER BY CITY desc;
-- Q2
SELECT * FROM SALESPEOPLE WHERE COMM BETWEEN 0.10 AND 0.20;
-- Q3
SELECT * FROM SALESPEOPLE WHERE SNAME LIKE 'S%';
-- Q4
SELECT * FROM SALESPEOPLE WHERE CITY LIKE 'L%';
-- Q5
SELECT * FROM CUSTOMERS WHERE CNAME LIKE '_O%';

-- SQL EXERCISE 4

-- Q1
SELECT * FROM SALESPEOPLE WHERE COMM BETWEEN 0.10 AND 0.20;
-- Q2

-- Q3

-- Q4

-- Q5

-- Q6