-- ============================================================
-- SMARTBANK - BANK MANAGEMENT SYSTEM
-- 09_VIEWS.SQL
-- ============================================================

-- 1. Customer Account View
CREATE OR REPLACE VIEW Customer_Account_View AS
SELECT
    c.Customer_ID,
    c.Name AS Customer_Name,
    c.Phone,
    a.Account_ID,
    a.Account_Number,
    a.Account_Type,
    a.Balance,
    a.Status
FROM Customer c
INNER JOIN Account a
    ON c.Customer_ID = a.Customer_ID;


-- 2. Customer Loan View
CREATE OR REPLACE VIEW Customer_Loan_View AS
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


-- 3. Transaction Details View
CREATE OR REPLACE VIEW Transaction_Details_View AS
SELECT
    c.Customer_ID,
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


-- 4. Loan Payment View
CREATE OR REPLACE VIEW Loan_Payment_View AS
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


-- 5. Branch Employee View
CREATE OR REPLACE VIEW Branch_Employee_View AS
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


-- 6. Complete Customer Banking View
CREATE OR REPLACE VIEW Customer_Banking_View AS
SELECT
    c.Customer_ID,
    c.Name AS Customer_Name,
    a.Account_Number,
    a.Account_Type,
    a.Balance,
    b.Branch_Name,
    b.City
FROM Customer c
LEFT JOIN Account a
    ON c.Customer_ID = a.Customer_ID
LEFT JOIN Branch b
    ON a.Branch_ID = b.Branch_ID;


-- ============================================================
-- TEST THE VIEWS
-- ============================================================

SELECT * FROM Customer_Account_View;

SELECT * FROM Customer_Loan_View;

SELECT * FROM Transaction_Details_View;

SELECT * FROM Loan_Payment_View;

SELECT * FROM Branch_Employee_View;

SELECT * FROM Customer_Banking_View;