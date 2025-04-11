CREATE DATABASE library;
USE library;

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    published_year YEAR,
    is_available BOOLEAN DEFAULT TRUE
);

CREATE TABLE Members (
    member_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone_number VARCHAR(15),
    join_date DATE DEFAULT (CURRENT_DATE)
);