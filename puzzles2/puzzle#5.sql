-- PUZZLE #5: Add the numbers up

-- STEP 1 - TABELA Z DANYMI
DROP TABLE IF EXISTS numbers;
CREATE TABLE numbers (
    n INT PRIMARY KEY
);

INSERT INTO numbers (n) VALUES (1), (2), (3);


-- STEP 2 - TABELA NA WYNIKI
DROP TABLE IF EXISTS results;
CREATE TABLE results (
    expression VARCHAR(100),
    total INT
);
