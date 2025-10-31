-- Puzzle #65: Home Listings

-- Step 1 - Utworzenie bazy i tabeli
DROP DATABASE IF EXISTS puzzle65;
CREATE DATABASE puzzle65;
USE puzzle65;

CREATE TABLE HomeListings (
    ListingID INT,
    HomeID VARCHAR(10),
    Status VARCHAR(20)
);
