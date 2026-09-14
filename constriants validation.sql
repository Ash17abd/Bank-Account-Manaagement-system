-- BANK ACCOUNT MANAGEMENT SYSTEM
-- Constraints and Validation Checks

-- 1. Customer: unique IDs, unique phone, required fields and valid gender
CREATE TABLE Customer (
    Customer_ID NUMBER CONSTRAINT pk_customer PRIMARY KEY,
    Name VARCHAR2(50) CONSTRAINT nn_customer_name NOT NULL,
    Gender VARCHAR2(10) CONSTRAINT nn_customer_gender NOT NULL
        CONSTRAINT ck_customer_gender CHECK (Gender IN ('Male','Female','Other')),
    Phone VARCHAR2(15) CONSTRAINT nn_customer_phone NOT NULL
        CONSTRAINT uq_customer_phone UNIQUE,
    Address VARCHAR2(100) DEFAULT 'Not Provided'
);

-- 2. Account: unique account numbers, valid account type/balance, valid customer reference
CREATE TABLE Account (
    Account_No NUMBER CONSTRAINT pk_account PRIMARY KEY,
    Customer_ID NUMBER CONSTRAINT nn_account_customer NOT NULL,
    Account_Type VARCHAR2(20) DEFAULT 'Savings'
        CONSTRAINT ck_account_type CHECK (Account_Type IN ('Savings','Current')),
    Balance NUMBER(12,2) DEFAULT 0
        CONSTRAINT ck_account_balance CHECK (Balance >= 0),
    Open_Date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_account_customer FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);

-- 3. Transactions: unique transaction IDs, positive amount and valid transaction type
CREATE TABLE Bank_Transaction (
    Transaction_ID NUMBER CONSTRAINT pk_transaction PRIMARY KEY,
    Account_No NUMBER CONSTRAINT nn_transaction_account NOT NULL,
    Transaction_Type VARCHAR2(20) CONSTRAINT nn_transaction_type NOT NULL
        CONSTRAINT ck_transaction_type CHECK (Transaction_Type IN ('Deposit','Withdrawal')),
    Amount NUMBER(12,2) CONSTRAINT nn_transaction_amount NOT NULL
        CONSTRAINT ck_transaction_amount CHECK (Amount > 0),
    Transaction_Date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_transaction_account FOREIGN KEY (Account_No)
        REFERENCES Account(Account_No)
);

-- 4. Employee: unique employee IDs and valid salary
CREATE TABLE Employee (
    Employee_ID NUMBER CONSTRAINT pk_employee PRIMARY KEY,
    Name VARCHAR2(50) CONSTRAINT nn_employee_name NOT NULL,
    Designation VARCHAR2(30) DEFAULT 'Clerk',
    Salary NUMBER(10,2) CONSTRAINT nn_employee_salary NOT NULL
        CONSTRAINT ck_employee_salary CHECK (Salary > 0),
    Branch VARCHAR2(50) CONSTRAINT nn_employee_branch NOT NULL
);

-- VALID SAMPLE DATA: every primary key is unique and all FK references exist.
INSERT INTO Customer VALUES (101,'Rahul Sharma','Male','9876543210','Hyderabad');
INSERT INTO Customer VALUES (102,'Priya Reddy','Female','9876543211','Vijayawada');
INSERT INTO Customer VALUES (103,'Kiran Kumar','Male','9876543212','Guntur');
INSERT INTO Customer VALUES (104,'Sneha Rao','Female','9876543213','Vizag');
INSERT INTO Customer VALUES (105,'Arjun Patel','Male','9876543214','Warangal');

INSERT INTO Account VALUES (1001,101,'Savings',10000,DATE '2025-04-10');
INSERT INTO Account VALUES (1002,102,'Current',75000,DATE '2025-04-12');
INSERT INTO Account VALUES (1003,103,'Savings',25000,DATE '2025-05-05');
INSERT INTO Account VALUES (1004,104,'Current',60000,DATE '2025-05-18');
INSERT INTO Account VALUES (1005,105,'Savings',90000,DATE '2025-06-20');

INSERT INTO Bank_Transaction VALUES (1,1001,'Deposit',10000,DATE '2025-06-01');
INSERT INTO Bank_Transaction VALUES (2,1002,'Withdrawal',5000,DATE '2025-06-03');
INSERT INTO Bank_Transaction VALUES (3,1003,'Deposit',15000,DATE '2025-06-05');
INSERT INTO Bank_Transaction VALUES (4,1004,'Withdrawal',8000,DATE '2025-06-07');
INSERT INTO Bank_Transaction VALUES (5,1005,'Deposit',20000,DATE '2025-06-09');

INSERT INTO Employee VALUES (201,'Ramesh','Manager',80000,'Hyderabad');
INSERT INTO Employee VALUES (202,'Anitha','Cashier',35000,'Vijayawada');
INSERT INTO Employee VALUES (203,'Suresh','Clerk',30000,'Guntur');
INSERT INTO Employee VALUES (204,'Lakshmi','Cashier',36000,'Vizag');

COMMIT;

-- VALIDATION CHECKS
-- Check for duplicate IDs (should return no rows)
SELECT Customer_ID, COUNT(*) FROM Customer GROUP BY Customer_ID HAVING COUNT(*) > 1;
SELECT Account_No, COUNT(*) FROM Account GROUP BY Account_No HAVING COUNT(*) > 1;
SELECT Transaction_ID, COUNT(*) FROM Bank_Transaction GROUP BY Transaction_ID HAVING COUNT(*) > 1;
SELECT Employee_ID, COUNT(*) FROM Employee GROUP BY Employee_ID HAVING COUNT(*) > 1;

-- Check invalid values (should return no rows)
SELECT * FROM Customer WHERE Gender NOT IN ('Male','Female','Other');
SELECT * FROM Account WHERE Balance < 0 OR Account_Type NOT IN ('Savings','Current');
SELECT * FROM Bank_Transaction WHERE Amount <= 0 OR Transaction_Type NOT IN ('Deposit','Withdrawal');
SELECT * FROM Employee WHERE Salary <= 0;

-- Check orphan foreign keys (should return no rows)
SELECT a.* FROM Account a LEFT JOIN Customer c ON a.Customer_ID=c.Customer_ID WHERE c.Customer_ID IS NULL;
SELECT t.* FROM Bank_Transaction t LEFT JOIN Account a ON t.Account_No=a.Account_No WHERE a.Account_No IS NULL;
