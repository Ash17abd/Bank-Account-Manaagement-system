-- ============================================================
-- SMARTBANK - 12_PROCEDURES.SQL
-- ============================================================

DELIMITER //

-- 1. Get Customer Accounts
CREATE PROCEDURE GetCustomerAccounts(IN p_customer_id INT)
BEGIN
    SELECT
        Account_ID,
        Account_Number,
        Account_Type,
        Balance,
        Status
    FROM Account
    WHERE Customer_ID = p_customer_id;
END //

DELIMITER ;


-- Execute
CALL GetCustomerAccounts(1);


-- ============================================================
-- 2. Get Customer Loans
-- ============================================================

DELIMITER //

CREATE PROCEDURE GetCustomerLoans(IN p_customer_id INT)
BEGIN
    SELECT
        Loan_ID,
        Loan_Type,
        Loan_Amount,
        Interest_Rate,
        Loan_Status
    FROM Loan
    WHERE Customer_ID = p_customer_id;
END //

DELIMITER ;


CALL GetCustomerLoans(1);


-- ============================================================
-- 3. Get Customer Transactions
-- ============================================================

DELIMITER //

CREATE PROCEDURE GetCustomerTransactions(IN p_customer_id INT)
BEGIN
    SELECT
        c.Name AS Customer_Name,
        a.Account_Number,
        t.Transaction_ID,
        t.Transaction_Type,
        t.Amount,
        t.Transaction_Date,
        t.Description
    FROM Customer c
    JOIN Account a
        ON c.Customer_ID = a.Customer_ID
    JOIN Transaction t
        ON a.Account_ID = t.Account_ID
    WHERE c.Customer_ID = p_customer_id;
END //

DELIMITER ;


CALL GetCustomerTransactions(1);


-- ============================================================
-- 4. Get Loan Details
-- ============================================================

DELIMITER //

CREATE PROCEDURE GetLoanDetails(IN p_loan_id INT)
BEGIN
    SELECT
        l.Loan_ID,
        c.Name AS Customer_Name,
        l.Loan_Type,
        l.Loan_Amount,
        l.Interest_Rate,
        l.Loan_Status
    FROM Loan l
    JOIN Customer c
        ON l.Customer_ID = c.Customer_ID
    WHERE l.Loan_ID = p_loan_id;
END //

DELIMITER ;


CALL GetLoanDetails(101);


-- ============================================================
-- 5. Deposit Money
-- ============================================================

DELIMITER //

CREATE PROCEDURE DepositMoney(
    IN p_account_id INT,
    IN p_amount DECIMAL(12,2)
)
BEGIN

    IF p_amount > 0 THEN

        INSERT INTO Transaction
        (
            Account_ID,
            Transaction_Type,
            Amount,
            Transaction_Date,
            Description
        )
        VALUES
        (
            p_account_id,
            'DEPOSIT',
            p_amount,
            CURRENT_DATE,
            'Deposit through procedure'
        );

    END IF;

END //

DELIMITER ;


-- Example
-- CALL DepositMoney(101, 5000);


-- ============================================================
-- 6. Withdraw Money
-- ============================================================

DELIMITER //

CREATE PROCEDURE WithdrawMoney(
    IN p_account_id INT,
    IN p_amount DECIMAL(12,2)
)
BEGIN

    DECLARE current_balance DECIMAL(12,2);

    SELECT Balance
    INTO current_balance
    FROM Account
    WHERE Account_ID = p_account_id;

    IF p_amount > 0 AND current_balance >= p_amount THEN

        INSERT INTO Transaction
        (
            Account_ID,
            Transaction_Type,
            Amount,
            Transaction_Date,
            Description
        )
        VALUES
        (
            p_account_id,
            'WITHDRAWAL',
            p_amount,
            CURRENT_DATE,
            'Withdrawal through procedure'
        );

    END IF;

END //

DELIMITER ;


-- Example
-- CALL WithdrawMoney(101, 2000);


-- ============================================================
-- END
-- ============================================================