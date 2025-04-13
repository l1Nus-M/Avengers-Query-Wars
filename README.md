# Avengers: Query Wars

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

---

## 🧱 Database Structure

### Example Tables
- `book`: Stores information about books available for sale
- `author`: Contains author details
- `cust_order`: Stores customer orders
- `order_line`: Stores individual items in an order
- `shipping_method`: Lists available shipping options

Full SQL table creation scripts are included in [schema.sql](./sql/schema.sql)

---

## 🧪 Sample Data

Sample data is provided in [sample_data.sql](./sql/sample_data.sql) to test and demonstrate query functionality. This includes:

- Authors like George Orwell and Ngũgĩ wa Thiong’o  
- Books such as *1984* and *Petals of Blood*  
- Sample customers and their addresses  
- Example orders and shipping records

---

## 👥 User Roles & Access

A sample MySQL user `TheCozyChapter_user0` is created with appropriate permissions to:
- SELECT, INSERT, UPDATE, DELETE from all tables  
- Assign and manage roles (if supported)

SQL scripts available in: [user_roles.sql](./sql/user_roles.sql)

---

