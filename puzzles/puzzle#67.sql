-- Puzzle 67: Matching birthdays

-- Step 1: Utwórz bazę i tabelę
CREATE DATABASE IF NOT EXISTS puzzle67;
USE puzzle67;

CREATE TABLE IF NOT EXISTS Students (
    Student VARCHAR(50),
    Birthday DATE
);
