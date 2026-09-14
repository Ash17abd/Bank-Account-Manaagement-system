-- BANK ACCOUNT MANAGEMENT SYSTEM
-- DML OPERATIONS

INSERT INTO Customer (Customer_ID, Name, Gender, Phone, Address, Email) VALUES (101,'Rahul Sharma','Male','9876543210','Hyderabad','rahul@example.com');
INSERT INTO Customer (Customer_ID, Name, Gender, Phone, Address, Email) VALUES (102,'Priya Reddy','Female','9876543211','Vijayawada','priya@example.com');
INSERT INTO Customer (Customer_ID, Name, Gender, Phone, Address, Email) VALUES (103,'Kiran Kumar','Male','9876543212','Guntur','kiran@example.com');
INSERT INTO Customer (Customer_ID, Name, Gender, Phone, Address, Email) VALUES (104,'Sneha Rao','Female','9876543213','Vizag','sneha@example.com');
INSERT INTO Customer (Customer_ID, Name, Gender, Phone, Address, Email) VALUES (105,'Arjun Patel','Male','9876543214','Warangal','arjun@example.com');
INSERT INTO Customer (Customer_ID, Name, Gender, Phone, Address, Email) VALUES (106,'Meena Devi','Female','9876543215','Rajahmundry','meena@example.com');
INSERT INTO Customer (Customer_ID, Name, Gender, Phone, Address, Email) VALUES (107,'Vikram Singh','Male','9876543216','Kakinada','vikram@example.com');

INSERT INTO Account (Account_No, Customer_ID, Account_Type, Balance, Open_Date) VALUES (1001,101,'Savings',50000,DATE '2025-03-10');
INSERT INTO Account VALUES (1002,102,'Current',75000,DATE '2025-03-15');
INSERT INTO Account VALUES (1003,103,'Savings',25000,DATE '2025-03-25');
INSERT INTO Account VALUES (1004,104,'Current',60000,DATE '2025-04-18');
INSERT INTO Account VALUES (1005,105,'Savings',90000,DATE '2025-05-20');
INSERT INTO Account VALUES (1006,106,'Savings',45000,DATE '2025-06-12');
INSERT INTO Account VALUES (1007,107,'Current',120000,DATE '2025-07-08');

INSERT INTO Bank_Transaction VALUES (1,1001,'Deposit',10000,DATE '2025-05-01');
INSERT INTO Bank_Transaction VALUES (2,1002,'Withdrawal',5000,DATE '2025-05-10');
INSERT INTO Bank_Transaction VALUES (3,1003,'Deposit',15000,DATE '2025-06-05');
INSERT INTO Bank_Transaction VALUES (4,1004,'Withdrawal',8000,DATE '2025-06-07');
INSERT INTO Bank_Transaction VALUES (5,1005,'Deposit',20000,DATE '2025-06-09');
INSERT INTO Bank_Transaction VALUES (6,1006,'Deposit',12000,DATE '2025-06-15');
INSERT INTO Bank_Transaction VALUES (7,1007,'Withdrawal',10000,DATE '2025-07-10');
INSERT INTO Bank_Transaction VALUES (8,1001,'Withdrawal',3000,DATE '2025-07-12');
INSERT INTO Bank_Transaction VALUES (9,1002,'Deposit',25000,DATE '2025-07-15');
INSERT INTO Bank_Transaction VALUES (10,1005,'Withdrawal',7000,DATE '2025-07-20');

INSERT INTO Employee VALUES (201,'Ramesh','Manager',80000,'Hyderabad');
INSERT INTO Employee VALUES (202,'Anitha','Cashier',35000,'Vijayawada');
INSERT INTO Employee VALUES (203,'Suresh','Clerk',30000,'Guntur');
INSERT INTO Employee VALUES (204,'Lakshmi','Cashier',36000,'Vizag');
INSERT INTO Employee VALUES (205,'Mahesh','Manager',82000,'Warangal');
INSERT INTO Employee VALUES (206,'Divya','Clerk',32000,'Rajahmundry');

UPDATE Account SET Balance = Balance + 5000 WHERE Account_No = 1001;
UPDATE Employee SET Salary = Salary + 2000 WHERE Employee_ID = 203;
DELETE FROM Bank_Transaction WHERE Transaction_ID = 6;
COMMIT;
