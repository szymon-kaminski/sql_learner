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


-- Step 2 - Wstawienie danych testowych
INSERT INTO HomeListings (ListingID, HomeID, Status) VALUES
(1, 'Home A', 'New Listing'),
(2, 'Home A', 'Pending'),
(3, 'Home A', 'Relisted'),
(4, 'Home B', 'New Listing'),
(5, 'Home B', 'Under Contract'),
(6, 'Home B', 'Relisted'),
(7, 'Home C', 'New Listing'),
(8, 'Home C', 'Under Contract'),
(9, 'Home C', 'Closed');

-- Preview data
SELECT * FROM HomeListings;
