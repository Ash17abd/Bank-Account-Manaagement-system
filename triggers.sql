-- ============================================================
-- SMARTBANK - BANK MANAGEMENT SYSTEM
-- 11_TRIGGERS.SQL
-- MYSQL
-- ============================================================


-- ============================================================
-- 1. DEPOSIT TRIGGER
-- Automatically increases account balance
-- ============================================================

DELIMITER //

CREATE TRIGGER After_Deposit
AFTER INSERT ON Transaction
FOR EACH ROW
BEGIN

    IF NEW.Transaction_Type = 'DEPOSIT' THEN

        UPDATE Account
        SET Balance = Balance + NEW.Amount
        WHERE Account_ID = NEW.Account_ID;

    END IF;

END //

DELIMITER ;


-- ============================================================
-- 2. WITHDRAWAL TRIGGER
-- Automatically decreases account balance
-- ============================================================

DELIMITER //

CREATE TRIGGER After_Withdrawal
AFTER INSERT ON Transaction
FOR EACH ROW
BEGIN

    IF NEW.Transaction_Type = 'WITHDRAWAL' THEN

        UPDATE Account
        SET Balance = Balance - NEW.Amount
        WHERE Account_ID = NEW.Account_ID;

    END IF;

END //

DELIMITER ;


-- ============================================================
-- 3. TEST DEPOSIT TRIGGER
-- ============================================================

INSERT INTO Transaction
(
    Transaction_ID,
    Account_ID,
    Transaction_Type,
    Amount,
    Transaction_Date,
    Description
)
VALUES
(
    1001,
    101,
    'DEPOSIT',
    10000,
    CURRENT_DATE,
    'Cash Deposit'
);


-- ============================================================
-- 4. CHECK BALANCE AFTER DEPOSIT
-- ============================================================

SELECT
    Account_ID,
    Account_Number,
    Balance
FROM Account
WHERE Account_ID = 101;


-- ============================================================
-- 5. TEST WITHDRAWAL TRIGGER
-- ============================================================

INSERT INTO Transaction
(
    Transaction_ID,
    Account_ID,
    Transaction_Type,
    Amount,
    Transaction_Date,
    Description
)
VALUES
(
    1002,
    101,
    'WITHDRAWAL',
    2000,
    CURRENT_DATE,
    'Cash Withdrawal'
);


-- ============================================================
-- 6. CHECK BALANCE AFTER WITHDRAWAL
-- ============================================================

SELECT
    Account_ID,
    Account_Number,
    Balance
FROM Account
WHERE Account_ID = 101;


-- ============================================================
-- 7. VIEW CREATED TRIGGERS
-- ============================================================

SHOW TRIGGERS;