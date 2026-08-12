-- ============================================================
-- SMARTBANK - BANK MANAGEMENT SYSTEM
-- 10_TRANSACTIONS.SQL
-- MYSQL
-- ============================================================


-- ============================================================
-- 1. CHECK BALANCE BEFORE TRANSFER
-- ============================================================

SELECT
    Account_ID,
    Account_Number,
    Balance
FROM Account
WHERE Account_ID IN (101, 102);


-- ============================================================
-- 2. MONEY TRANSFER
-- Transfer ₹5000 from Account 101 to Account 102
-- ============================================================

START TRANSACTION;

-- Deduct money from sender
UPDATE Account
SET Balance = Balance - 5000
WHERE Account_ID = 101
AND Balance >= 5000;

-- Add money to receiver
UPDATE Account
SET Balance = Balance + 5000
WHERE Account_ID = 102;

COMMIT;


-- ============================================================
-- 3. CHECK BALANCE AFTER TRANSFER
-- ============================================================

SELECT
    Account_ID,
    Account_Number,
    Balance
FROM Account
WHERE Account_ID IN (101, 102);


-- ============================================================
-- 4. ROLLBACK EXAMPLE
-- ============================================================

START TRANSACTION;

UPDATE Account
SET Balance = Balance - 10000
WHERE Account_ID = 101
AND Balance >= 10000;

UPDATE Account
SET Balance = Balance + 10000
WHERE Account_ID = 102;

-- Cancel the transaction if an error occurs
ROLLBACK;


-- ============================================================
-- 5. DEPOSIT TRANSACTION
-- ============================================================

START TRANSACTION;

UPDATE Account
SET Balance = Balance + 10000
WHERE Account_ID = 101;

COMMIT;


-- ============================================================
-- 6. WITHDRAWAL TRANSACTION
-- ============================================================

START TRANSACTION;

UPDATE Account
SET Balance = Balance - 3000
WHERE Account_ID = 101
AND Balance >= 3000;

COMMIT;


-- ============================================================
-- 7. FINAL BALANCE
-- ============================================================

SELECT
    Account_ID,
    Account_Number,
    Balance
FROM Account
WHERE Account_ID = 101;