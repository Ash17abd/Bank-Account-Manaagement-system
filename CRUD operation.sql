-- BANK ACCOUNT MANAGEMENT SYSTEM
-- CRUD Operations, Joins, Aggregate Functions, Views and Other SQL Queries

-- 1. CREATE (CRUD - Create)
INSERT INTO Customer (Customer_ID, Name, Gender, Phone, Address)
VALUES (108, 'Ravi Kumar', 'Male', '9876543217', 'Nellore');

INSERT INTO Account (Account_No, Customer_ID, Account_Type, Balance)
VALUES (1008, 108, 'Savings', 50000);

-- 2. READ (CRUD - Read)
SELECT * FROM Customer;
SELECT * FROM Account;

SELECT c.Customer_ID, c.Name, a.Account_No, a.Account_Type, a.Balance
FROM Customer c
JOIN Account a ON c.Customer_ID = a.Customer_ID;

-- 3. UPDATE (CRUD - Update)
UPDATE Account
SET Balance = Balance + 5000
WHERE Account_No = 1008;

-- 4. DELETE (CRUD - Delete)
DELETE FROM Bank_Transaction
WHERE Transaction_ID = 10;

COMMIT;

-- 5. INNER JOIN
SELECT c.Name, c.Phone, a.Account_No, a.Account_Type, a.Balance
FROM Customer c
INNER JOIN Account a ON c.Customer_ID = a.Customer_ID;

-- 6. LEFT JOIN
SELECT c.Customer_ID, c.Name, a.Account_No, a.Balance
FROM Customer c
LEFT JOIN Account a ON c.Customer_ID = a.Customer_ID;

-- 7. JOIN THREE TABLES
SELECT c.Name, a.Account_No, t.Transaction_ID,
       t.Transaction_Type, t.Amount, t.Transaction_Date
FROM Customer c
JOIN Account a ON c.Customer_ID = a.Customer_ID
JOIN Bank_Transaction t ON a.Account_No = t.Account_No
ORDER BY c.Name, t.Transaction_Date;

-- 8. AGGREGATE FUNCTIONS
SELECT COUNT(*) AS Total_Customers FROM Customer;
SELECT COUNT(*) AS Total_Accounts FROM Account;
SELECT SUM(Balance) AS Total_Bank_Balance FROM Account;
SELECT AVG(Balance) AS Average_Balance FROM Account;
SELECT MAX(Balance) AS Highest_Balance FROM Account;
SELECT MIN(Balance) AS Lowest_Balance FROM Account;

-- 9. GROUP BY + SUM
SELECT Account_Type, COUNT(*) AS Number_Of_Accounts,
       SUM(Balance) AS Total_Balance
FROM Account
GROUP BY Account_Type;

-- 10. GROUP BY TRANSACTION TYPE
SELECT Transaction_Type, COUNT(*) AS Transaction_Count,
       SUM(Amount) AS Total_Amount
FROM Bank_Transaction
GROUP BY Transaction_Type;

-- 11. HAVING
SELECT Account_Type, AVG(Balance) AS Average_Balance
FROM Account
GROUP BY Account_Type
HAVING AVG(Balance) > 50000;

-- 12. SUBQUERY
SELECT Account_No, Customer_ID, Balance
FROM Account
WHERE Balance > (SELECT AVG(Balance) FROM Account);

-- 13. BETWEEN / ORDER BY
SELECT Account_No, Account_Type, Balance
FROM Account
WHERE Balance BETWEEN 20000 AND 100000
ORDER BY Balance DESC;

-- 14. VIEW: Customer Account Details
CREATE OR REPLACE VIEW Customer_Account_View AS
SELECT c.Customer_ID, c.Name, c.Phone,
       a.Account_No, a.Account_Type, a.Balance, a.Open_Date
FROM Customer c
JOIN Account a ON c.Customer_ID = a.Customer_ID;

SELECT * FROM Customer_Account_View;

-- 15. VIEW: Transaction Details
CREATE OR REPLACE VIEW Transaction_Details_View AS
SELECT c.Name, a.Account_No, a.Account_Type,
       t.Transaction_ID, t.Transaction_Type,
       t.Amount, t.Transaction_Date
FROM Customer c
JOIN Account a ON c.Customer_ID = a.Customer_ID
JOIN Bank_Transaction t ON a.Account_No = t.Account_No;

SELECT * FROM Transaction_Details_View;

-- 16. VIEW: High Balance Accounts
CREATE OR REPLACE VIEW High_Balance_Accounts AS
SELECT Account_No, Customer_ID, Account_Type, Balance
FROM Account
WHERE Balance > 50000;

SELECT * FROM High_Balance_Accounts;

-- 17. DISTINCT
SELECT DISTINCT Branch FROM Employee;

-- 18. LIKE
SELECT Customer_ID, Name, Phone
FROM Customer
WHERE Name LIKE 'A%';

-- 19. IN
SELECT Account_No, Account_Type, Balance
FROM Account
WHERE Account_Type IN ('Savings', 'Current');

-- 20. CASE EXPRESSION
SELECT Account_No, Balance,
       CASE
           WHEN Balance >= 100000 THEN 'High Balance'
           WHEN Balance >= 50000 THEN 'Medium Balance'
           ELSE 'Low Balance'
       END AS Balance_Category
FROM Account;
