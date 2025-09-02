-- Puzzle #15



-- Step 1 — Create table and insert data

USE sql_learner;

DROP TABLE IF EXISTS SqlSyntax;
CREATE TABLE SqlSyntax (
    Sequence INT,
    Syntax VARCHAR(100)
);

INSERT INTO SqlSyntax (Sequence, Syntax)
VALUES
(1, 'SELECT'),
(2, 'Product,'),
(3, 'UnitPrice,'),
(4, 'EffectiveDate'),
(5, 'FROM'),
(6, 'Products'),
(7, 'WHERE'),
(8, 'UnitPrice'),
(9, '> 100');


-- Step 2 — View raw data

SELECT * FROM SqlSyntax ORDER BY Sequence;