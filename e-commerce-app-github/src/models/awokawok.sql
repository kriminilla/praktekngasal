-- DROP SEMUA DATABASE TERKAIT DULU (URUTAN DARI DEPENDEN KE INDUK)
DROP DATABASE IF EXISTS transactions_db;
DROP DATABASE IF EXISTS products_db;
DROP DATABASE IF EXISTS customers_db;
DROP DATABASE IF EXISTS users_db;

-- =============== USERS DB ====================
CREATE DATABASE users_db;
USE users_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
   id INT AUTO_INCREMENT PRIMARY KEY,
   username VARCHAR(255) NOT NULL UNIQUE,
   password VARCHAR(255) NOT NULL,
   role ENUM('admin', 'customer') DEFAULT 'customer',
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============== CUSTOMERS DB ====================
CREATE DATABASE customers_db;
USE customers_db;

DROP TABLE IF EXISTS customers;	

CREATE TABLE customers (
   id INT AUTO_INCREMENT PRIMARY KEY,
   user_id  INT ,
   name VARCHAR(255) NOT NULL,
   email VARCHAR(255) NOT NULL UNIQUE,
   phone integer(15),
   address text
);

-- =============== PRODUCTS DB ====================
CREATE DATABASE products_db;
USE products_db;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL, 
   description TEXT,
   price DECIMAL(10, 2) NOT NULL,
   stock INT NOT NULL DEFAULT 0,
   image_url VARCHAR(255)
);

-- =============== TRANSACTIONS DB ====================
CREATE DATABASE transactions_db;
USE transactions_db;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
id INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE
);
DROP TABLE IF EXISTS products;

CREATE TABLE products (
id INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
   description TEXT,
   price DECIMAL(10, 2) NOT NULL,
   stock INT NOT NULL DEFAULT 0,
   image_url VARCHAR(255)
);
DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
total_amount DECIMAL(10, 2) NOT NULL,
status ENUM('pending', 'completed', 'cancelled') DEFAULT
'pending',
transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE
CASCADE );
DROP TABLE IF EXISTS transaction_items;

CREATE TABLE transaction_items (
id INT AUTO_INCREMENT PRIMARY KEY,
transaction_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
price_per_item DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (transaction_id) REFERENCES transactions(id) ON DELETE CASCADE,
FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE
CASCADE );