USE BankManagement;
DELIMITER //
CREATE PROCEDURE Customer_AddCustomer(
    IN CustID INT,
    IN CustName VARCHAR(100),
    IN BirthDate DATE,
    IN InitialBalance DECIMAL(10,2)
)
BEGIN
INSERT INTO Customers
VALUES(
    CustID,
    CustName,
    BirthDate,
    InitialBalance,
    CURDATE()
);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE Customer_UpdateDetails(
    IN CustID INT,
    IN NewName VARCHAR(100),
    IN NewDOB DATE
)
BEGIN
UPDATE Customers
SET Name = NewName,
    DOB = NewDOB,
    LastModified = CURDATE()
WHERE CustomerID = CustID;
END //
DELIMITER ;
DELIMITER //
CREATE FUNCTION Customer_GetBalance(
    CustID INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE TotalBalance DECIMAL(10,2);
SELECT Balance
INTO TotalBalance
FROM Customers
WHERE CustomerID = CustID;
RETURN TotalBalance;
END //
DELIMITER ;
CALL Customer_AddCustomer(4,'Mark Wilson','1998-02-10',3000);
CALL Customer_UpdateDetails(4,'Mark Williams','1998-03-10');
SELECT Customer_GetBalance(4);
DELIMITER //
CREATE PROCEDURE Employee_Hire(
    IN EmpID INT,
    IN EmpName VARCHAR(100),
    IN EmpPosition VARCHAR(50),
    IN EmpSalary DECIMAL(10,2),
    IN Dept VARCHAR(50)
)
BEGIN
INSERT INTO Employees
VALUES(
EmpID,
EmpName,
EmpPosition,
EmpSalary,
Dept,
CURDATE()
);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE Employee_Update(
    IN EmpID INT,
    IN NewPosition VARCHAR(50),
    IN NewSalary DECIMAL(10,2)
)
BEGIN
UPDATE Employees
SET Position = NewPosition,
    Salary = NewSalary
WHERE EmployeeID = EmpID;
END //
DELIMITER ;
DELIMITER //
CREATE FUNCTION Employee_AnnualSalary(
    EmpID INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE AnnualSalary DECIMAL(10,2);
SELECT Salary * 12
INTO AnnualSalary
FROM Employees
WHERE EmployeeID = EmpID;
RETURN AnnualSalary;
END //
DELIMITER ;
CALL Employee_Hire(
3,
'David',
'Tester',
50000,
'IT'
);
CALL Employee_Update(
3,
'Senior Tester',
60000
);
SELECT Employee_AnnualSalary(3);
DELIMITER //
CREATE PROCEDURE Account_Open(
    IN AccID INT,
    IN CustID INT,
    IN AccType VARCHAR(20),
    IN InitialBalance DECIMAL(10,2)
)
BEGIN
INSERT INTO Accounts
VALUES(
AccID,
CustID,
AccType,
InitialBalance,
CURDATE()
);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE Account_Close(
    IN AccID INT
)
BEGIN
DELETE FROM Accounts
WHERE AccountID = AccID;
END //
DELIMITER ;
DELIMITER //
CREATE FUNCTION Account_TotalBalance(
    CustID INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE Total DECIMAL(10,2);
SELECT SUM(Balance)
INTO Total
FROM Accounts
WHERE CustomerID = CustID;
RETURN Total;
END //
DELIMITER ;
CALL Account_Open(
3,
4,
'Savings',
5000
);
SELECT Account_TotalBalance(4);
CALL Account_Close(3);
SHOW PROCEDURE STATUS 
WHERE Db='BankManagement';
SHOW FUNCTION STATUS
WHERE Db='BankManagement';