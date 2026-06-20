CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;

CREATE TABLE account (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_no VARCHAR(20),
    name VARCHAR(50),
    lastname VARCHAR(50)
);

INSERT INTO account (account_no, name, lastname) VALUES
('1001', 'Amit', 'Sharma'),
('1002', 'Rahul', 'Patil'),
('1003', 'Priya', 'Deshmukh');

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50)
);

INSERT INTO users (username, password) VALUES
('admin', 'admin123'),
('john', 'john123'),
('alice', 'alice123');
