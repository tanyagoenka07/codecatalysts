CREATE DATABASE IF NOT EXISTS green_credit_db;
USE green_credit_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    user_type ENUM('gc_applier', 'gc_buyer') NOT NULL,
    address TEXT NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    wallet DECIMAL(10, 2) DEFAULT 0
);

CREATE TABLE gc_appliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    plantation_size INT,
    trees_planted INT,
    gc_cost DECIMAL(10, 2),
    gc_left INT,
    wallet DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE gc_buyers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    construction_size INT,
    trees_cut_down INT,
    gc_required INT,
    wallet DECIMAL(10, 2) DEFAULT 1000,  -- Assuming buyers start with a balance for simplicity
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE gc_transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    buyer_id INT,
    seller_id INT,
    gc_quantity INT,
    total_cost DECIMAL(10, 2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (buyer_id) REFERENCES users(id),
    FOREIGN KEY (seller_id) REFERENCES users(id)
);
