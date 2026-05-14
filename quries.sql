-- CREATING DATABASE
CREATE DATABASE sql_project_01;

-- CREATING TABLES
-- Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE
);

-- Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2)
);

-- Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    amount NUMERIC(10,2)
);

-- Order Details
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT
);

--1.Total customers
SELECT COUNT(*) AS Total_customers FROM customers;

--2.Total revenue
SELECT SUM(amount) AS Total_revenue FROM orders;

--3.High-valued orders
SELECT * FROM orders
WHERE amount>10000;

--4.Top 5 Highest orders
SELECT * FROM orders
ORDER BY amount DESC LIMIT 5;

--5.Customer orders(who placed which order)
SELECT c.name,o.order_id,o.amount FROM customers c
JOIN orders o ON c.customer_id=o.customer_id;

--6.Total spendings per customer
SELECT c.name,SUM(o.amount) as total_spent from customers c
JOIN orders o ON c.customer_id=o.customer_id GROUP BY c.name;

--7.Top 5 customers
SELECT c.name,SUM(o.amount) AS total_amount FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.name
ORDER BY total_amount DESC
LIMIT 5;

--8.Orders per customer
SELECT customer_id,COUNT(*) AS total_orders FROM orders
GROUP BY customer_id;

--9.Customer more than 3 orders
SELECT customer_id,COUNT(*) AS total_orders FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 3;

--10.Revenue by city
SELECT c.city,SUM(o.amount) AS revenue FROM customers c
JOIN  orders o ON c.customer_id= o.customer_id
GROUP BY c.city
ORDER BY revenue DESC;

--11.Monthly revenue
SELECT TO_CHAR(order_date,'YYYY-MM') AS Month,SUM(amount) AS revenue FROM orders
GROUP BY month
ORDER BY month;

--12.Best selling products
SELECT p.product_name,SUM(od.quantity) AS total_sold FROM products p
JOIN order_details od ON od.product_id=p.product_id
GROUP BY product_name
ORDER BY total_sold DESC;

--13.Customers spending above average
SELECT c.name FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.name
HAVING SUM(o.amount)>(SELECT AVG(amount) FROM orders);

--14.Rank customers
SELECT c.name,SUM(o.amount) AS total_amount,
RANK() OVER(ORDER BY SUM(o.amount)DESC) AS rank
FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.name;

--14.Order with product details
SELECT 
	c.name,
	o.order_id,
	p.product_name,
	od.quantity,
	o.amount
FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
JOIN order_details od ON o.order_id=od.order_id
JOIN products p ON od.product_id=p.product_id;