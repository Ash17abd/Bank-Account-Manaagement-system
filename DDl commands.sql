-- BANK ACCOUNT MANAGEMENT SYSTEM
-- DDL OPERATIONS

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
    Account_Type VARCHAR2(20) DEFAULT 'Savings' CHECK (Account_Type IN ('Savings','Current')),
    Balance NUMBER(12,2) DEFAULT 0 CHECK (Balance >= 0),
    Open_Date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_account_customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Bank_Transaction (
    Transaction_ID NUMBER PRIMARY KEY,
    Account_No NUMBER NOT NULL,
    Transaction_Type VARCHAR2(20) NOT NULL CHECK (Transaction_Type IN ('Deposit','Withdrawal')),
    Amount NUMBER(12,2) NOT NULL CHECK (Amount > 0),
    Transaction_Date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_transaction_account FOREIGN KEY (Account_No) REFERENCES Account(Account_No)
);

CREATE TABLE Employee (
    Employee_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL,
    Designation VARCHAR2(30) DEFAULT 'Clerk',
    Salary NUMBER(10,2) NOT NULL CHECK (Salary > 0),
    Branch VARCHAR2(50) NOT NULL
);

ALTER TABLE Customer ADD Email VARCHAR2(100) UNIQUE;
-- Other DDL examples:
-- TRUNCATE TABLE Bank_Transaction;
-- DROP TABLE Bank_Transaction;
