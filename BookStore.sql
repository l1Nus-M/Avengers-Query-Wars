-- Database Project for The Cozy Chapter Bookstore --
/* Create BookStoreDB */
CREATE DATABASE CozyChapterDB;
USE CozyChapterDB;


-- Table Schema -- 
/* 1. Book Table */
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20),
    publisher_id INT,
    language_id INT,
    price DECIMAL(10,2),
    publication_year YEAR,
    stock_quantity INT DEFAULT 0
    );

/* 2. Book Author Table */
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id)
);

/* 3. Author Table */
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

/* 4. Book Language Table */
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(100) NOT NULL
);

/* 5. Publisher Table */
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    publisherName VARCHAR(50),
    country_id INT
);

/* 6. Customer Table */
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    phone_number VARCHAR(20)
);

/* 7. Customer Address Table */
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id)
);

/* 8. Address Status Table */
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

/* 9. Address Table */
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT
);

/* 10. Country Table */
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

/* 11. Customer Order Table */
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_id INT,
    shipping_method_id INT
);

/* 12. Order Line Table */
CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10,2),
    PRIMARY KEY (order_id, book_id)
);

/* 13. Shipping Method Table */
CREATE TABLE shipping_method (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100),
    cost DECIMAL(10,2)
);

/* 14. Order History Table */
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

/* 15. Order Status Table */
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50)
);


-- Foreign Keys --
/* Book table and Publisher Table */
ALTER TABLE book
ADD CONSTRAINT fk_book_publisher
FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
ON DELETE RESTRICT ON UPDATE CASCADE;

/* Book Table and Book Language Table */
ALTER TABLE book
ADD CONSTRAINT fk_book_book_language
FOREIGN KEY (language_id) REFERENCES book_language(language_id);

/* Book Author Table and Book Table */
ALTER TABLE book_author
ADD CONSTRAINT fk_book_author_book
FOREIGN KEY (book_id) REFERENCES book(book_id)
ON DELETE RESTRICT ON UPDATE CASCADE;

/* Book Author Table and Author Table */
ALTER TABLE book_author
ADD CONSTRAINT fk_book_author_author
FOREIGN KEY (author_id) REFERENCES author(author_id);

/* Publisher Table and Country Table */
ALTER TABLE publisher
ADD CONSTRAINT fk_publisher_country
FOREIGN KEY (country_id) REFERENCES country(country_id);

/* Customer Address Table and Customer Table */
ALTER TABLE customer_address
ADD CONSTRAINT fk_customer_address_customer
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

/* Customer Address Table and Address Table */
ALTER TABLE customer_address
ADD CONSTRAINT fk_customer_address_address
FOREIGN KEY (address_id) REFERENCES address(address_id);

/* Customer Address Table and Address Status Table */
ALTER TABLE customer_address
ADD CONSTRAINT fk_customer_address_address_status
FOREIGN KEY (status_id) REFERENCES address_status(status_id);

/* Address Table and Country Table */
ALTER TABLE address
ADD CONSTRAINT fk_address_country
FOREIGN KEY (country_id) REFERENCES country(country_id);

/* Customer Order Table and Customer Table */
ALTER TABLE cust_order
ADD CONSTRAINT fk_customer_order_customer
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

/* Customer Order Table and Order Status Table */
ALTER TABLE cust_order
ADD CONSTRAINT fk_customer_order_order_status
FOREIGN KEY (status_id) REFERENCES order_status(status_id);

/* Customer Order Table and Shipping Method Table */
ALTER TABLE cust_order
ADD CONSTRAINT fk_customer_order_shipping_method
FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(method_id);

/* Order Line Table and Customer Order Table */
ALTER TABLE order_line
ADD CONSTRAINT fk_order_line_customer_order
FOREIGN KEY (order_id) REFERENCES cust_order(order_id);

/* Order Line Table and Book Table */
ALTER TABLE order_line
ADD CONSTRAINT fk_order_line_book
FOREIGN KEY (book_id) REFERENCES book(book_id);

/* Order History Table and Customer Order Table */
ALTER TABLE order_history
ADD CONSTRAINT fk_order_history_customer_order
FOREIGN KEY (order_id) REFERENCES cust_order(order_id);

/* Order History Table and Order Status Table */
ALTER TABLE order_history
ADD CONSTRAINT fk_order_history_order_status
FOREIGN KEY (status_id) REFERENCES order_status(status_id);


-- Users and Grant Permissions --
/* Creating Users and Grant Permissions */
CREATE USER 'TheCozyChapter_user0'@'localhost' IDENTIFIED BY "Password4Who?";

GRANT SELECT, INSERT, UPDATE, DELETE ON BookStoreDB.* TO 'TheCozyChapter_user0'@'localhost';
FLUSH PRIVILEGES;

CREATE ROLE 'read_only';
GRANT SELECT ON CozyChapterDB.* TO 'read_only';
GRANT 'read_only' TO 'TheCozyChapter_user0'@'localhost';
