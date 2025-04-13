# 📚 BookStore MySQL Database Project

This project simulates a real-world **Bookstore Management System** using MySQL. It covers essential database design principles, table creation, data loading, and access control. Additionally, an Entity-Relationship Diagram (ERD) is provided to visualize the data relationships.

---

## 🛠 Tools and Technologies

- **MySQL** – Database design and implementation  
- **Draw.io** – Schema visualization (ERD)  
- **Git & GitHub** – Version control and project hosting  

---

## 🎯 Project Objective

To design and implement a relational database that efficiently stores and manages information related to bookstore operations, including books, authors, customers, orders, and shipments.

---

## 🧩 Schema Overview

The database contains the following key entities:

- `book`, `author`, `book_author`, `book_language`, `publisher`
- `customer`, `customer_address`, `address`, `address_status`, `country`
- `cust_order`, `order_line`, `order_status`, `order_history`, `shipping_method`

Relationships include:
- Many-to-many: books ↔ authors, customers ↔ addresses
- One-to-many: publishers → books, customers → orders, orders → order_lines

📌 View the ERD:  
[Bookstore ERD](/ERD.png)

---

## 🧱 Database Structure

### Example Tables
Here's a quick glimpse of the database structure:
- `book`: Stores information about books available for sale
- `author`: Contains author details
- `cust_order`: Stores customer orders
- `order_line`: Stores individual items in an order
- `shipping_method`: Lists available shipping options

Full SQL table creation scripts are included in [schema.sql](/BookStore.sql)

---

## 🧪 Sample Data

Sample data is provided in [sample_data.sql](/sample_data.sql) to test and demonstrate query functionality. This includes:

- Authors like George Orwell and Ngũgĩ wa Thiong’o  
- Books such as *1984* and *Petals of Blood*  
- Sample customers and their addresses  
- Example orders and shipping records

---

## 👥 User Roles & Access

A sample MySQL user `TheCozyChapter_user0` is created with appropriate permissions to:
- Perform 'SELECT', 'INSERT', 'UPDATE', 'DELETE' from all tables  
- Assign and manage roles (if supported)

SQL scripts available in: [user_roles.sql](/user_roles.sql)

---

## 🧪 Sample Queries

Examples of SQL queries you can run:

```sql
-- Top 5 books by stock
SELECT title, stock_quantity FROM book ORDER BY stock_quantity DESC LIMIT 5;

-- All orders placed by customer "Alice Kamau"
SELECT o.order_id, o.order_date, os.status_name
FROM cust_order o
JOIN order_status os ON o.status_id = os.status_id
JOIN customer c ON o.customer_id = c.customer_id
WHERE c.first_name = 'Alice' AND c.last_name = 'Kamau';
```

🚀 Getting Started
1. Clone the repository:
   
   git clone https://github.com/l1Nus-M/Avengers-Query-Wars.git

2. Load BookStore.sql into your MySQL environment.

3. Import sample_data.sql for testing.

4. Run queries and test your database!
        

