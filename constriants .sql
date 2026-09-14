-- BANK ACCOUNT MANAGEMENT SYSTEM
-- Oracle SQL / SQL*Plus

CREATE TABLE Customer (
    Customer_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL,
    Gender VARCHAR2(10) NOT NULL CHECK (Gender IN ('Male','Female','Other')),
    Phone VARCHAR2(15) NOT NULL UNIQUE,
    Address VARCHAR2(100) DEFAULT 'Not Provided'
);

CREATE TABLE Account (
    Account_No NUMBER PRIMARY KEY,
    Customer_ID NUMBER NOT NULL,
    Account_Type VARCHAR2(20) DEFAULT 'Savings'
        CHECK (Account_Type IN ('Savings','Current')),
    Balance NUMBER(12,2) DEFAULT 0 CHECK (Balance >= 0),
    Open_Date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_account_customer FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);

CREATE TABLE Bank_Transaction (
    Transaction_ID NUMBER PRIMARY KEY,
    Account_No NUMBER NOT NULL,
    Transaction_Type VARCHAR2(20) NOT NULL
        CHECK (Transaction_Type IN ('Deposit','Withdrawal')),
    Amount NUMBER(12,2) NOT NULL CHECK (Amount > 0),
    Transaction_Date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_transaction_account FOREIGN KEY (Account_No)
        REFERENCES Account(Account_No)
);

CREATE TABLE Employee (
    Employee_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL,
    Designation VARCHAR2(30) DEFAULT 'Clerk',
    Salary NUMBER(10,2) NOT NULL CHECK (Salary > 0),
    Branch VARCHAR2(50) NOT NULL
);

-- SAMPLE DATA
INSERT INTO Customer VALUES (101,'Rahul Sharma','Male','9876543210','Hyderabad');
INSERT INTO Customer VALUES (102,'Priya Reddy','Female','9876543211','Vijayawada');
INSERT INTO Customer VALUES (103,'Kiran Kumar','Male','9876543212','Guntur');

INSERT INTO Account (Account_No,Customer_ID)
VALUES (1001,101);
INSERT INTO Account (Account_No,Customer_ID,Account_Type,Balance)
VALUES (1002,102,'Current',75000);
INSERT INTO Account (Account_No,Customer_ID,Account_Type,Balance)
VALUES (1003,103,'Savings',25000);

INSERT INTO Bank_Transaction (Transaction_ID,Account_No,Transaction_Type,Amount)
VALUES (1,1001,'Deposit',10000);
INSERT INTO Bank_Transaction (Transaction_ID,Account_No,Transaction_Type,Amount)
VALUES (2,1002,'Withdrawal',5000);

INSERT INTO Employee (Employee_ID,Name,Salary,Branch)
VALUES (201,'Ramesh',80000,'Hyderabad');
INSERT INTO Employee (Employee_ID,Name,Designation,Salary,Branch)
VALUES (202,'Anitha','Cashier',35000,'Vijayawada');

COMMIT;

-- DISPLAY TABLES
SELECT * FROM Customer;
SELECT * FROM Account;
SELECT * FROM Bank_Transaction;
SELECT * FROM Employee;
