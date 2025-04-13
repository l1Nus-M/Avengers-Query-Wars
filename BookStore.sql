<<<<<<< HEAD
CREATE Database bookstoreDB;
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY, 
    title VARCHAR(255) NOT NULL,           
    price DECIMAL(10, 2),                   
    stock INT                               
);
Insert into book (title, price, stock)
Values
('Spiderman: No way home', 10.69 , 20),
('Thor: Love and thunder', 16.88 , 22),
('Iron man: The genius within', 13.22, 18),
('Hulk: Unleashing the beast', 10.99, 16),
('Captain America: Shield of Honor', 17.20, 23),
('Black Widow: Shadow Spy Tales', 14.50, 21),
('Guardians of the Galaxy: Cosmic Chronicles', 18.99, 12),
('Doctor Strange: Mystical Adventures', 16.99, 10),
('Black Panther: The Wakandan Legacy', 14.99, 14),
('Scarlet Witch: Woven Destinies', 12.99, 8),
('Hawkeye: Sharp Shootin’ Tales', 10.99, 20),
('Ant-Man and the Quantum Realm', 13.99, 9),
('Avengers: Endgame Epilogues', 24.99, 18);

CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    biography TEXT, 
    date_of_birth DATE, 
    nationality VARCHAR(100) 
    );

INSERT INTO author (name, biography, date_of_birth, nationality)
VALUES
('Peter Webber', 'Writer specializing in thrilling superhero stories.', '1980-05-01', 'American'),
('Chris Thunder', 'Famous for blending mythology and action in novels.', '1985-03-12', 'Australian'),
('Tony Sparks', 'Tech enthusiast and bestselling author of sci-fi tales.', '1977-07-23', 'American'),
('Bruce Green', 'Known for his larger-than-life action novels.', '1982-09-14', 'Canadian'),
('Steve Stars', 'Acclaimed author focusing on heroic epics.', '1978-01-18', 'British'),
('Natasha Black', 'Expert in espionage-themed fiction and thrillers.', '1990-11-20', 'Russian'),
('James Rocket', 'Author specializing in cosmic adventures and space operas.', '1978-05-21', 'American'),
('Ariana Spellcaster', 'Known for her mystical fantasy books.', '1984-03-12', 'British'),
('T-Chaka Okoye', 'Writes about themes of legacy and leadership.', '1969-11-10', 'Nigerian'),
('Scarlet Weaver', 'Fiction author crafting intricate tales.', '1990-07-15', 'American'),
('Clint Arrowman', 'Author focusing on precision thrillers.', '1983-02-20', 'Canadian'),
('Paul Quantum', 'Creative writer exploring the quantum realm.', '1975-09-08', 'Australian'),
('Avengers Editorial Team', 'Collaboration of authors chronicling superhero adventures.', NULL, 'International');

-- Creating a table for book_author
CREATE TABLE book_author (
    book_id INT NOT NULL,
    author_id INT NOT NULL, 
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE
    );
-- Inserting data into book_author table
INSERT INTO book_author (book_id, author_id)
VALUES 
(1, 1),
(2, 2),
(3, 3), 
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13);

CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY, 
    language_name VARCHAR(100) NOT NULL 
);
INSERT INTO book_language (language_name)
VALUES
('English'),
('Arabic'),
('English'),
('Spanish'),
('Irish'),
('Russian'),
('English'),
('Mandarin'),
('Igbo'),
('English'),
('Spanish'),
('Arabic'),
('English');

ALTER TABLE book ADD publisher_id INT;

UPDATE book
SET publisher_id = CASE title
    WHEN 'Spiderman: No way home' THEN 1
    WHEN 'Thor: Love and thunder' THEN 2
    WHEN 'Iron man: The genius within' THEN 3
    WHEN 'Hulk: Unleashing the beast' THEN 4
    WHEN 'Captain America: Shield of Honor' THEN 5
    WHEN 'Black Widow: Shadow Spy Tales' THEN 5
    WHEN 'Guardians of the Galaxy: Cosmic Chronicles' THEN 1
    WHEN 'Doctor Strange: Mystical Adventures' THEN 2
    WHEN 'Black Panther: The Wakandan Legacy' THEN 4
    WHEN 'Scarlet Witch: Woven Destinies' THEN 5
    WHEN 'Hawkeye: Sharp Shootin’ Tales' THEN 5
    WHEN 'Ant-Man and the Quantum Realm' THEN 3
    WHEN 'Avengers: Endgame Epilogues' THEN 1
END;

CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each publisher
    name VARCHAR(255) NOT NULL,                  -- Name of the publisher
    address VARCHAR(255),                        -- Publisher's address (optional)
    contact_number VARCHAR(15),                  -- Contact number for the publisher (optional)
    website VARCHAR(255)                         -- Publisher's website (optional)
);

INSERT INTO publisher (name, address, contact_number, website)
VALUES
('Marvel Publishing', '123 Superhero Lane, Manhattan, NY', '123-456-7890', 'www.marvel.com'),
('Avengers Editions', '456 Teamwork Blvd, Los Angeles, CA', '789-123-4560', 'www.avengerseditions.com'),
('Stark Tech Reads', '789 Innovation Street, Palo Alto, CA', '456-789-1230', 'www.starktechreads.com'),
('Banner Books', '321 Gamma Lane, Toronto, Canada', '234-567-8901', 'www.bannerbooks.com'),
('Shield Press', '654 Honor Ave, London, UK', '345-678-9012', 'www.shieldpress.com');

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL, 
    email VARCHAR(150) NOT NULL,
    phone_number VARCHAR(20), 
    date_joined DATE DEFAULT NULL,
    preferred_language INT, 
    FOREIGN KEY (preferred_language) REFERENCES book_language(language_id)
);

INSERT INTO customer (first_name, last_name, email, phone_number, preferred_language)
VALUES
('Amber', 'Rose', 'amber.rose@gmail.com', '123-456-7890', 1),
('Tony', 'Rufallo', 'tonyrufallo.1@gmail.com', '987-654-3210', 1),
('Natasha', 'Williams', 'natashawilliams@gmail.com', '567-890-1234', 1),
('Isaac', 'Beck', 'isaac.beck@gmail.com', '789-123-4560', 2),
('Bruce', 'Wayne', 'brucewayne.5@gmail.com', '456-789-0123', 1),
('Mark', 'Odinson', 'mark.odinson@gmail.com', '012-345-6789', 3);

CREATE TABLE customer_address (
    customer_id INT NOT NULL,
    address_id INT NOT NULL, 
    address_status_id INT, 
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (address_id) REFERENCES address(address_id) ON DELETE CASCADE,
    FOREIGN KEY (address_status_id) REFERENCES address_status(status_id) ON DELETE CASCADE
);
INSERT INTO customer_address (customer_id, address_id, address_status_id)
VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 2);

=======
-- Database Project for The Cozy Chapter Bookstore --
/* Create BookStoreDB */
CREATE DATABASE BookStoreDB;
USE BookStoreDB;


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
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

<<<<<<< HEAD
INSERT INTO address_status (status_name)
VALUES
('Primary'),
('Secondary'),
('Temporary'),
('Permanent'),
('Shipping'),
('Office');

=======
/* 9. Address Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT
);

<<<<<<< HEAD
INSERT INTO address (street, city, postal_code, country_id)
VALUES
('20 Ingram Street', 'Queens', '11377', 1),
('10880 Malibu Point', 'Malibu', '90265', 2),
('1 Wakandan Lane', 'Birnin Zana', '00001', 3),
('456 Spy Alley', 'Moscow', '101000', 4),
('177A Bleecker Street', 'New York', '10012', 2),
('890 Gamma Boulevard', 'Toronto', 'M5G 2C3', 5);

=======
/* 10. Country Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

<<<<<<< HEAD
INSERT INTO country (country_name)
VALUES
('United States'),
('Canada'),
('United Kingdom'),
('Russia'),
('Australia'),
('South Africa'),
('France'),
('Germany'),
('India'),
('Brazil');

=======
/* 11. Customer Order Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_id INT,
    shipping_method_id INT
);

<<<<<<< HEAD
INSERT INTO cust_order (customer_id, order_date, status_id, shipping_method_id)
VALUES
(1, '2025-04-10 14:30:00', 1, 2),  -- Order by Customer 1, pending, using shipping method 2
(2, '2025-04-11 09:15:00', 2, 1),  -- Order by Customer 2, shipped, using shipping method 1
(3, '2025-04-12 16:45:00', 1, 3),  -- Order by Customer 3, pending, using shipping method 3
(4, '2025-04-13 10:00:00', 3, 2),  -- Order by Customer 4, delivered, using shipping method 2
(5, '2025-04-13 11:30:00', 1, 1);  -- Order by Customer 5, pending, using shipping method 1


=======
/* 12. Order Line Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10,2),
    PRIMARY KEY (order_id, book_id)
);

<<<<<<< HEAD
INSERT INTO order_line (order_id, book_id, quantity, price)
VALUES
(1, 1, 2, 10.69), 
(1, 2, 1, 16.88),
(2, 3, 3, 13.22),
(3, 4, 1, 14.99),
(3, 5, 2, 17.20);

=======
/* 13. Shipping Method Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
CREATE TABLE shipping_method (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100),
    cost DECIMAL(10,2)
);

<<<<<<< HEAD
INSERT INTO shipping_method (method_name, cost)
VALUES
('Standard Shipping', 5.99),
('Express Shipping', 12.99),
('Overnight Delivery', 24.99),
('Standard Shipping', 13.22),
('International Shipping', 19.99);

=======
/* 14. Order History Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

<<<<<<< HEAD
INSERT INTO order_history (order_id, status_id, updated_at)
VALUES
(1, 1, '2025-04-10 14:30:00'),
(2, 2, '2025-04-11 16:45:00'),
(3, 3, '2025-04-13 10:00:00');


=======
/* 15. Order Status Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50)
);

<<<<<<< HEAD
INSERT INTO order_status (status_name)
VALUES
('Pending'), ('Shipped'), ('Delivered'), ('Cancelled');

-- Foreign Keys --
-- Book Author Table and Book Table 
=======

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
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
ALTER TABLE book_author
ADD CONSTRAINT fk_book_author_book
FOREIGN KEY (book_id) REFERENCES book(book_id)
ON DELETE RESTRICT ON UPDATE CASCADE;

<<<<<<< HEAD
-- Book Author Table and Author Table 
=======
/* Book Author Table and Author Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
ALTER TABLE book_author
ADD CONSTRAINT fk_book_author_author
FOREIGN KEY (author_id) REFERENCES author(author_id);

<<<<<<< HEAD
-- Customer Address Table and Customer Table 
=======
/* Publisher Table and Country Table */
ALTER TABLE publisher
ADD CONSTRAINT fk_publisher_country
FOREIGN KEY (country_id) REFERENCES country(country_id);

/* Customer Address Table and Customer Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
ALTER TABLE customer_address
ADD CONSTRAINT fk_customer_address_customer
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

<<<<<<< HEAD
-- Customer Address Table and Address Table 
=======
/* Customer Address Table and Address Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
ALTER TABLE customer_address
ADD CONSTRAINT fk_customer_address_address
FOREIGN KEY (address_id) REFERENCES address(address_id);

<<<<<<< HEAD
-- Address Table and Country Table 
=======
/* Customer Address Table and Address Status Table */
ALTER TABLE customer_address
ADD CONSTRAINT fk_customer_address_address_status
FOREIGN KEY (status_id) REFERENCES address_status(status_id);

/* Address Table and Country Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
ALTER TABLE address
ADD CONSTRAINT fk_address_country
FOREIGN KEY (country_id) REFERENCES country(country_id);

<<<<<<< HEAD
-- Customer Order Table and Customer Table 
=======
/* Customer Order Table and Customer Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
ALTER TABLE cust_order
ADD CONSTRAINT fk_customer_order_customer
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

<<<<<<< HEAD
-- Customer Order Table and Order Status Table 
=======
/* Customer Order Table and Order Status Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
ALTER TABLE cust_order
ADD CONSTRAINT fk_customer_order_order_status
FOREIGN KEY (status_id) REFERENCES order_status(status_id);

<<<<<<< HEAD
-- Customer Order Table and Shipping Method Table 
=======
/* Customer Order Table and Shipping Method Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
ALTER TABLE cust_order
ADD CONSTRAINT fk_customer_order_shipping_method
FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(method_id);

<<<<<<< HEAD
-- Order Line Table and Customer Order Table 
=======
/* Order Line Table and Customer Order Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
ALTER TABLE order_line
ADD CONSTRAINT fk_order_line_customer_order
FOREIGN KEY (order_id) REFERENCES cust_order(order_id);

<<<<<<< HEAD
-- Order Line Table and Book Table 
=======
/* Order Line Table and Book Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
ALTER TABLE order_line
ADD CONSTRAINT fk_order_line_book
FOREIGN KEY (book_id) REFERENCES book(book_id);

<<<<<<< HEAD
-- Order History Table and Customer Order Table 
=======
/* Order History Table and Customer Order Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
ALTER TABLE order_history
ADD CONSTRAINT fk_order_history_customer_order
FOREIGN KEY (order_id) REFERENCES cust_order(order_id);

<<<<<<< HEAD
-- Order History Table and Order Status Table 
=======
/* Order History Table and Order Status Table */
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
ALTER TABLE order_history
ADD CONSTRAINT fk_order_history_order_status
FOREIGN KEY (status_id) REFERENCES order_status(status_id);

<<<<<<< HEAD
-- Users and Grant Permissions --
/* Creating Users and Grant Permissions */
CREATE USER 'TheCozyChapter_user0'@'localhost' IDENTIFIED BY "Password4Who?";

GRANT SELECT, INSERT, UPDATE, DELETE ON BookStoreDB.* TO 'TheCozyChapter_user0'@'localhost';
FLUSH PRIVILEGES;

CREATE ROLE 'read_only';
GRANT SELECT ON BookStoreDB.* TO 'read_only';
GRANT 'read_only' TO 'TheCozyChapter_user0'@'localhost';
>>>>>>> 32aa166dc336bc4624ccd0cdd7e987f7317e286f
