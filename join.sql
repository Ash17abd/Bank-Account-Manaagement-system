-- ============================================================
-- SMARTBANK - BANK MANAGEMENT SYSTEM
-- 06_JOINS.SQL
-- ============================================================

-- 1. INNER JOIN
-- Display customers and their account details

SELECT
    c.Customer_ID,
    c.Name AS Customer_Name,
    a.Account_ID,
    a.Account_Number,
    a.Account_Type,
    a.Balance,
    a.Status
FROM Customer c
INNER JOIN Account a
    ON c.Customer_ID = a.Customer_ID;


-- 2. CUSTOMER + TRANSACTION
-- Display all transactions along with customer details

SELECT
    c.Customer_ID,
    c.Name AS Customer_Name,
    a.Account_Number,
    t.Transaction_ID,
    t.Transaction_Type,
    t.Amount,
    t.Transaction_Date
FROM Customer c
INNER JOIN Account a
    ON c.Customer_ID = a.Customer_ID
INNER JOIN Transaction t
    ON a.Account_ID = t.Account_ID;


-- 3. CUSTOMER + LOAN
-- Display customers who have loans

SELECT
    c.Customer_ID,
    c.Name AS Customer_Name,
    l.Loan_ID,
    l.Loan_Type,
    l.Loan_Amount,
    l.Interest_Rate,
    l.Loan_Status
FROM Customer c
INNER JOIN Loan l
    ON c.Customer_ID = l.Customer_ID;


-- 4. LOAN + LOAN PAYMENT
-- Display loan payment details with loan information

SELECT
    l.Loan_ID,
    l.Loan_Type,
    l.Loan_Amount,
    lp.Payment_ID,
    lp.Amount AS Payment_Amount,
    lp.Due_Date,
    lp.Payment_Date,
    lp.Payment_Status
FROM Loan l
INNER JOIN Loan_Payment lp
    ON l.Loan_ID = lp.Loan_ID;


-- 5. BRANCH + ACCOUNT
-- Display accounts managed by each branch

SELECT
    b.Branch_ID,
    b.Branch_Name,
    b.City,
    a.Account_ID,
    a.Account_Number,
    a.Account_Type,
    a.Balance
FROM Branch b
INNER JOIN Account a
    ON b.Branch_ID = a.Branch_ID;


-- 6. BRANCH + EMPLOYEE
-- Display employees working in each branch

SELECT
    b.Branch_ID,
    b.Branch_Name,
    b.City,
    e.Employee_ID,
    e.Employee_Name,
    e.Designation,
    e.Salary
FROM Branch b
INNER JOIN Employee e
    ON b.Branch_ID = e.Branch_ID;


-- 7. CUSTOMER + BENEFICIARY
-- Display customers and their beneficiaries

SELECT
    c.Customer_ID,
    c.Name AS Customer_Name,
    b.Beneficiary_ID,
    b.Beneficiary_Name,
    b.Beneficiary_Account,
    b.Bank_Name,
    b.IFSC_Code
FROM Customer c
INNER JOIN Beneficiary b
    ON c.Customer_ID = b.Customer_ID;


-- 8. CUSTOMER + FINANCIAL GOAL
-- Display customers and their financial goals

SELECT
    c.Customer_ID,
    c.Name AS Customer_Name,
    f.Goal_ID,
    f.Goal_Name,
    f.Target_Amount,
    f.Saved_Amount,
    f.Target_Date,
    f.Status
FROM Customer c
INNER JOIN Financial_Goal f
    ON c.Customer_ID = f.Customer_ID;


-- 9. CUSTOMER + ACCOUNT + BRANCH
-- Display complete account information

SELECT
    c.Name AS Customer_Name,
    a.Account_Number,
    a.Account_Type,
    a.Balance,
    b.Branch_Name,
    b.City,
    b.IFSC_Code
FROM Customer c
INNER JOIN Account a
    ON c.Customer_ID = a.Customer_ID
INNER JOIN Branch b
    ON a.Branch_ID = b.Branch_ID;


-- 10. CUSTOMER + ACCOUNT + TRANSACTION
-- Display complete transaction history

SELECT
    c.Name AS Customer_Name,
    a.Account_Number,
    t.Transaction_ID,
    t.Transaction_Type,
    t.Amount,
    t.Transaction_Date,
    t.Description
FROM Customer c
INNER JOIN Account a
    ON c.Customer_ID = a.Customer_ID
INNER JOIN Transaction t
    ON a.Account_ID = t.Account_ID;


-- 11. CUSTOMER + LOAN + LOAN PAYMENT
-- Display complete loan repayment information

SELECT
    c.Name AS Customer_Name,
    l.Loan_ID,
    l.Loan_Type,
    l.Loan_Amount,
    lp.Payment_ID,
    lp.Amount AS Payment_Amount,
    lp.Due_Date,
    lp.Payment_Date,
    lp.Payment_Status
FROM Customer c
INNER JOIN Loan l
    ON c.Customer_ID = l.Customer_ID
INNER JOIN Loan_Payment lp
    ON l.Loan_ID = lp.Loan_ID;


-- 12. LEFT JOIN
-- Display all customers, including customers
-- who do not have a loan

SELECT
    c.Customer_ID,
    c.Name AS Customer_Name,
    l.Loan_ID,
    l.Loan_Type,
    l.Loan_Amount
FROM Customer c
LEFT JOIN Loan l
    ON c.Customer_ID = l.Customer_ID;


-- 13. LEFT JOIN
-- Display all branches, including branches
-- that currently have no employees

SELECT
    b.Branch_ID,
    b.Branch_Name,
    b.City,
    e.Employee_ID,
    e.Employee_Name,
    e.Designation
FROM Branch b
LEFT JOIN Employee e
    ON b.Branch_ID = e.Branch_ID;


-- 14. LEFT JOIN
-- Display all accounts, including accounts
-- that have no transactions

SELECT
    a.Account_ID,
    a.Account_Number,
    a.Account_Type,
    a.Balance,
    t.Transaction_ID,
    t.Transaction_Type,
    t.Amount
FROM Account a
LEFT JOIN Transaction t
    ON a.Account_ID = t.Account_ID;


-- 15. MULTIPLE JOIN
-- Complete customer banking profile

SELECT
    c.Customer_ID,
    c.Name AS Customer_Name,
    a.Account_Number,
    a.Account_Type,
    a.Balance,
    b.Branch_Name,
    b.City,
    l.Loan_Type,
    l.Loan_Amount
FROM Customer c
LEFT JOIN Account a
    ON c.Customer_ID = a.Customer_ID
LEFT JOIN Branch b
    ON a.Branch_ID = b.Branch_ID
LEFT JOIN Loan l
    ON c.Customer_ID = l.Customer_ID;


-- 16. TRANSACTION + CUSTOMER + BRANCH
-- Find where customer transactions are associated

SELECT
    c.Name AS Customer_Name,
    a.Account_Number,
    b.Branch_Name,
    t.Transaction_Type,
    t.Amount,
    t.Transaction_Date
FROM Customer c
INNER JOIN Account a
    ON c.Customer_ID = a.Customer_ID
INNER JOIN Branch b
    ON a.Branch_ID = b.Branch_ID
INNER JOIN Transaction t
    ON a.Account_ID = t.Account_ID;


-- 17. LOAN + CUSTOMER + BRANCH
-- Display customer's loan and branch information

SELECT
    c.Name AS Customer_Name,
    l.Loan_ID,
    l.Loan_Type,
    l.Loan_Amount,
    b.Branch_Name,
    b.City
FROM Customer c
INNER JOIN Loan l
    ON c.Customer_ID = l.Customer_ID
LEFT JOIN Account a
    ON c.Customer_ID = a.Customer_ID
LEFT JOIN Branch b
    ON a.Branch_ID = b.Branch_ID;


-- 18. JOIN WITH CONDITION
-- Display customers having active loans

SELECT
    c.Name AS Customer_Name,
    l.Loan_ID,
    l.Loan_Type,
    l.Loan_Amount,
    l.Loan_Status
FROM Customer c
INNER JOIN Loan l
    ON c.Customer_ID = l.Customer_ID
WHERE l.Loan_Status = 'ACTIVE';


-- 19. JOIN WITH CONDITION
-- Display accounts with balance greater than 50000

SELECT
    c.Name AS Customer_Name,
    a.Account_Number,
    a.Account_Type,
    a.Balance
FROM Customer c
INNER JOIN Account a
    ON c.Customer_ID = a.Customer_ID
WHERE a.Balance > 50000;


-- 20. JOIN WITH ORDER BY
-- Display customers and their loans
-- from highest to lowest loan amount

SELECT
    c.Name AS Customer_Name,
    l.Loan_Type,
    l.Loan_Amount
FROM Customer c
INNER JOIN Loan l
    ON c.Customer_ID = l.Customer_ID
ORDER BY l.Loan_Amount DESC;


-- ============================================================
-- END OF 06_JOINS.SQL
-- ============================================================