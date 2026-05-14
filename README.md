# 📊 SQL Sales Analysis Project

## 🚀 Project Overview
This project is a real-time style Sales Analysis project built using PostgreSQL. The goal of this project is to analyze customer orders, product sales, and business revenue using SQL queries.

The project demonstrates important SQL concepts used in real companies and data analytics roles.

---

# 🛠 Tools & Technologies
- PostgreSQL
- SQL
- pgAdmin
- GitHub

---

# 📁 Dataset Tables

## 1. customers
Stores customer details.

| Column | Description |
|---|---|
| customer_id | Unique customer ID |
| name | Customer name |
| city | Customer city |

---

## 2. orders
Stores order information.

| Column | Description |
|---|---|
| order_id | Unique order ID |
| customer_id | Customer who placed the order |
| amount | Total order amount |
| order_date | Date of order |

---

## 3. products
Stores product information.

| Column | Description |
|---|---|
| product_id | Unique product ID |
| product_name | Product name |
| category | Product category |
| price | Product price |

---

## 4. order_details
Stores product-level order details.

| Column | Description |
|---|---|
| order_id | Order reference |
| product_id | Product reference |
| quantity | Quantity ordered |

---

# 📚 SQL Concepts Used

✔ Filtering Rows  
✔ Aggregate Functions  
✔ GROUP BY & HAVING  
✔ INNER JOIN  
✔ LEFT JOIN  
✔ RIGHT JOIN  
✔ UNION & UNION ALL  
✔ SELF JOIN  
✔ Subqueries  
✔ Views  
✔ Indexes  
✔ Window Functions  
✔ PostgreSQL Functions & Triggers  

---

# 🔥 Business Questions Solved

- Who placed which order?
- What are the top-selling products?
- Which city generates the highest revenue?
- Who are the top customers by spending?
- What is the monthly sales trend?
- Which customers placed more than 3 orders?

---

# 💡 Sample Queries

## Customer Orders
```sql
SELECT c.name, o.order_id, o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;
```

---

## Revenue by City
```sql
SELECT c.city, SUM(o.amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY revenue DESC;
```

---

## Top 5 Customers
```sql
SELECT c.name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;
```

---

# 📈 Key Insights

- Some customers contribute significantly higher revenue.
- Electronics products generated strong sales.
- Monthly revenue trends help identify business growth.
- Customer purchase behavior can be analyzed using SQL.

---

# 🎯 Learning Outcomes

Through this project, I improved my understanding of:

- Writing SQL queries
- Working with relational databases
- Performing sales analysis
- Using joins and aggregations
- Building project-ready SQL workflows

---

# 🔗 Future Improvements

- Connect project with Power BI dashboard
- Add advanced window functions
- Perform customer segmentation analysis
- Build interactive visual reports

---

# 🙌 Author

Created as a learning project to improve SQL and Data Analytics skills.
