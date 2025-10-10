-- Puzzle #52: Phone numbers

-- Step 1 - Create Database and Use It
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;


-- Step 2 - Create Table with Validation Rule
CREATE TABLE CustomerPhones (
    CustomerID INT PRIMARY KEY,
    PhoneNumber VARCHAR(14) NOT NULL,
    CONSTRAINT chk_phone_format
        CHECK (PhoneNumber REGEXP '^\\([0-9]{3}\\)-[0-9]{3}-[0-9]{4}$')
);
