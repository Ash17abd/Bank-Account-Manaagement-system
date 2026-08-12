-- ============================================================
-- SMARTBANK - 14_INDEXES.SQL
-- ============================================================


-- ============================================================
-- 1. INDEX ON CUSTOMER PHONE
-- ============================================================

CREATE INDEX idx_customer_phone
ON Customer(Phone);


-- ============================================================
-- 2. INDEX ON ACCOUNT NUMBER
-- ============================================================

CREATE INDEX idx_account_number
ON Account(Account_Number);


-- ============================================================
-- 3. INDEX ON ACCOUNT CUSTOMER ID
-- Useful for finding accounts belonging to a customer
-- ============================================================

CREATE INDEX idx_account_customer
ON Account(Customer_ID);


-- ============================================================
-- 4. INDEX ON TRANSACTION ACCOUNT ID
-- Useful for transaction history
-- ============================================================

CREATE INDEX idx_transaction_account
ON Transaction(Account_ID);


-- ============================================================
-- 5. INDEX ON TRANSACTION DATE
-- Useful for date-based transaction searches
-- ============================================================

CREATE INDEX idx_transaction_date
ON Transaction(Transaction_Date);


-- ============================================================
-- 6. INDEX ON LOAN CUSTOMER ID
-- ============================================================

CREATE INDEX idx_loan_customer
ON Loan(Customer_ID);


-- ============================================================
-- 7. INDEX ON LOAN STATUS
-- Useful for finding active/closed loans
-- ============================================================

CREATE INDEX idx_loan_status
ON Loan(Loan_Status);


-- ============================================================
-- 8. INDEX ON LOAN PAYMENT STATUS
-- Useful for finding pending/paid payments
-- ============================================================

CREATE INDEX idx_payment_status
ON Loan_Payment(Payment_Status);


-- ============================================================
-- 9. INDEX ON BENEFICIARY CUSTOMER ID
-- ============================================================

CREATE INDEX idx_beneficiary_customer
ON Beneficiary(Customer_ID);


-- ============================================================
-- 10. INDEX ON FINANCIAL GOAL CUSTOMER ID
-- ============================================================

CREATE INDEX idx_goal_customer
ON Financial_Goal(Customer_ID);


-- ============================================================
-- VIEW ALL INDEXES
-- ============================================================

SHOW INDEX FROM Customer;

SHOW INDEX FROM Account;

SHOW INDEX FROM Transaction;

SHOW INDEX FROM Loan;

SHOW INDEX FROM Loan_Payment;


-- ============================================================
-- END
-- ============================================================