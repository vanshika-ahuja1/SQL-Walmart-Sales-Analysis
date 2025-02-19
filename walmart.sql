-- creating database
CREATE DATABASE IF NOT EXISTS sales;

-- using database
USE sales;

-- tables in database sales
show tables;

-- top 5 rows in table
select * from sales limit 5;

desc sales;

-- total sales for each product line.
SELECT `Product line`, SUM(Total) AS total_sales FROM sales GROUP BY `Product line`;

--  total sales for each city
SELECT City, SUM(Total) AS total_sales FROM sales GROUP BY City;

-- average rating for each product line
SELECT `Product line`, AVG(Rating) AS avg_rating FROM sales GROUP BY `Product line`;

--  total sales for 'Member' vs. 'Normal' customers
SELECT `Customer type`, SUM(Total) AS total_sales FROM sales
GROUP BY `Customer type`;

-- 5 highest sales from the dataset
SELECT `Invoice ID`, Total
FROM sales
ORDER BY Total DESC
LIMIT 5;

-- total tax collected for each branch
SELECT Branch, SUM(`Tax 5%`) AS total_tax
FROM sales
GROUP BY Branch;

-- total sales performance based on gender
SELECT Gender, SUM(Total) AS total_sales
FROM sales
GROUP BY Gender;

-- average Cost of Goods Sold (COGS) by payment method.
SELECT Payment, AVG(cogs) AS avg_cogs
FROM sales
GROUP BY Payment;

-- total gross income by each date
SELECT Date, SUM(`gross income`) AS total_gross_income
FROM sales
GROUP BY Date;

-- top 3 product lines with the highest average gross margin percentage
SELECT `Product line`, AVG(`gross margin percentage`) AS avg_margin_per
FROM sales
GROUP BY `Product line`
ORDER BY avg_margin_per DESC
LIMIT 3;

-- total sales for each payment method (Cash, Credit card, Ewallet)
SELECT Payment, SUM(Total) AS total_sales
FROM sales
GROUP BY Payment;

-- 5 cities with the highest total sales
SELECT City, SUM(Total) AS total_sales
FROM sales
GROUP BY City
ORDER BY total_sales DESC
LIMIT 5;

-- total sales and quantity sold for each product line
SELECT `Product line`, SUM(Total) AS total_sales, SUM(Quantity) AS total_quantity
FROM sales
GROUP BY `Product line`;

-- sales in each city between 'Member' and 'Normal' customers
SELECT City, `Customer type`, SUM(Total) AS total_sales
FROM sales
GROUP BY City, `Customer type`;

-- invoice with the lowest sale total
SELECT `Invoice ID`, Total
FROM sales
ORDER BY Total ASC
LIMIT 1;

-- total sales in each branch for the 'Health and beauty' product line
SELECT Branch, SUM(Total) AS total_sales
FROM sales
WHERE `Product line` = 'Health and beauty'
GROUP BY Branch;

-- total sales for January 2019
SELECT SUM(Total) AS total_sales
FROM sales
WHERE Date BETWEEN '01/01/19' AND '31/01/19';

-- product line with the highest quantity sold
SELECT `Product line`, SUM(Quantity) AS total_quantity
FROM sales
GROUP BY `Product line`
ORDER BY total_quantity DESC
LIMIT 1;

-- sales by gender for each product line
SELECT Gender, `Product line`, SUM(Total) AS total_sales
FROM sales
GROUP BY Gender, `Product line`;

-- total sales for male and female members
SELECT Gender, SUM(Total) AS total_sales
FROM sales
WHERE `Customer type` = 'Member'
GROUP BY Gender;

-- top 3 products with the highest average rating
SELECT `Product line`, AVG(Rating) AS avg_rating
FROM sales
GROUP BY `Product line`
ORDER BY avg_rating DESC
LIMIT 3;

-- total sales by hour of the day
SELECT EXTRACT(HOUR FROM Time) AS hour, SUM(Total) AS total_sales
FROM sales
GROUP BY hour
ORDER BY hour;

-- find the Invoice ID, Total, and Date of the invoices where the Total is greater than the average Total of all invoices
SELECT `Invoice ID`, `Total`, `Date`
FROM `sales`
WHERE `Total` > (SELECT AVG(`Total`) FROM `sales`);

-- day of the week  from the Date
SELECT `Invoice ID`, DAYNAME(`Date`) AS day_of_week
FROM `sales`;

-- total sales grouped by month and year
SELECT YEAR(`Date`) AS year, MONTH(`Date`) AS month, SUM(`Total`) AS total_sales
FROM `sales`
GROUP BY YEAR(`Date`), MONTH(`Date`);

-- Total Sales by Year
SELECT YEAR(`Date`) AS year, SUM(`Total`) AS total_sales
FROM `sales`
GROUP BY YEAR(`Date`);

-- Month with Maximum Sales
SELECT YEAR(`Date`) AS year, MONTH(`Date`) AS month, SUM(`Total`) AS total_sales
FROM `sales`
GROUP BY YEAR(`Date`), MONTH(`Date`)
ORDER BY total_sales DESC
LIMIT 1;

-- concatenate the Branch and City columns into a new column Branch_City
SELECT CONCAT(`Branch`, ' - ', `City`) AS Branch_City
FROM `sales`;

-- count how many invoices exist for each Payment type
SELECT `Payment`, COUNT(*) AS payment_count
FROM `sales`
GROUP BY `Payment`;

-- maximum Total value from the sales
SELECT MAX(`Total`) AS max_total
FROM `sales`;

-- average Quantity sold in the sales
SELECT AVG(`Quantity`) AS average_quantity
FROM `sales`;

-- count of Customer type (Member, Normal) for each Branch
SELECT `Branch`, `Customer type`, COUNT(*) AS customer_count
FROM `sales`
GROUP BY `Branch`, `Customer type`;

-- average Unit price for each Product line
SELECT `Product line`, AVG(`Unit price`) AS avg_unit_price
FROM `sales`
GROUP BY `Product line`;

-- Top Branch by Sales
SELECT `Branch`, SUM(`Total`) AS total_sales
FROM `sales`
GROUP BY `Branch`
ORDER BY total_sales DESC
LIMIT 1;



















