-- Puzzle #60 — Products Without Duplicates

-- STEP 1: Create database and table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    Product VARCHAR(50),
    ProductCode VARCHAR(10)
);
