-- BANK ACCOUNT MANAGEMENT SYSTEM
-- DQL OPERATIONS

SELECT * FROM Customer;
SELECT * FROM Account;
SELECT * FROM Bank_Transaction;
SELECT * FROM Employee;

-- Customer and account details
SELECT c.Customer_ID, c.Name, a.Account_No, a.Account_Type, a.Balance
FROM Customer c JOIN Account a ON c.Customer_ID = a.Customer_ID;

-- Accounts with balance greater than 50,000
SELECT Account_No, Customer_ID, Balance
FROM Account
WHERE Balance > 50000;

-- Savings accounts
SELECT * FROM Account
WHERE Account_Type = 'Savings';

-- Deposit transactions
SELECT * FROM Bank_Transaction
WHERE Transaction_Type = 'Deposit';

-- Aggregate queries
SELECT SUM(Balance) AS Total_Balance FROM Account;
SELECT AVG(Balance) AS Average_Balance FROM Account;
SELECT MAX(Balance) AS Maximum_Balance FROM Account;
SELECT COUNT(*) AS Total_Accounts FROM Account;

-- Employees earning more than 40,000
SELECT Employee_ID, Name, Designation, Salary
FROM Employee
WHERE Salary > 40000;
