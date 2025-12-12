-- PUZZLE #8: Four Vehicles Problem 
-- Generate all assignments of 10 people (A1..A5 adults, C1..C5 children)
-- into vehicles: motorcycle(1), sidecar(2), golf_cart(3), car(4)
-- Conditions:
--  * seating order inside each vehicle does NOT matter (combinations)
--  * each vehicle must contain at least one adult
-- Expected total rows: 7,200

-- STEP 0 — BAZA
DROP DATABASE IF EXISTS puzzle8;
CREATE DATABASE puzzle8;
USE puzzle8;
