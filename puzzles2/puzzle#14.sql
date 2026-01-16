-- Puzzle #14: Josephus Problem

-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle14;
CREATE DATABASE puzzle14;
USE puzzle14;


-- STEP 1 - PARAMETERS
Parametry problemu (łatwa zmiana bez ruszania logiki).
CREATE TABLE params (
    n INT,
    k INT
);

INSERT INTO params VALUES (7, 3);
