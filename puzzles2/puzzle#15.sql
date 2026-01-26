-- Puzzle #15: High-Low Card Game 

-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle15;
CREATE DATABASE puzzle15;
USE puzzle15;


-- STEP 1 - DECK
CREATE TABLE deck (
    card_id INT PRIMARY KEY AUTO_INCREMENT,
    suit VARCHAR(10),
    label VARCHAR(2),
    value INT
);

INSERT INTO deck (suit, label, value)
SELECT s.suit, v.label, v.value
FROM (
    SELECT 'Hearts' AS suit UNION ALL
    SELECT 'Diamonds' UNION ALL
    SELECT 'Clubs' UNION ALL
    SELECT 'Spades'
) s
CROSS JOIN (
    SELECT '2' AS label, 2 AS value UNION ALL
    SELECT '3',3 UNION ALL
    SELECT '4',4 UNION ALL
    SELECT '5',5 UNION ALL
    SELECT '6',6 UNION ALL
    SELECT '7',7 UNION ALL
    SELECT '8',8 UNION ALL
    SELECT '9',9 UNION ALL
    SELECT '10',10 UNION ALL
    SELECT 'J',11 UNION ALL
    SELECT 'Q',12 UNION ALL
    SELECT 'K',13 UNION ALL
    SELECT 'A',14
) v;


-- STEP 2 - SHUFFLE
CREATE TABLE shuffled AS
SELECT *, ROW_NUMBER() OVER (ORDER BY RAND()) AS pos
FROM deck;
