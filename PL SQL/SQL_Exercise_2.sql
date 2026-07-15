USE BankManagement;
SELECT DATABASE();
CREATE TABLE Error_Log(
    ErrorID INT AUTO_INCREMENT PRIMARY KEY,
    ErrorMessage VARCHAR(255),
    ErrorDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SELECT * FROM Accounts;
DELIMITER //
CREATE PROCEDURE SafeTransferFunds(
    IN FromAccount INT,
    IN ToAccount INT,
    IN TransferAmount DECIMAL(10,2)
)
BEGIN
DECLARE CurrentBalance DECIMAL(10,2);
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
INSERT INTO Error_Log(ErrorMessage)
VALUES('Fund transfer failed. Transaction rolled back');
ROLLBACK;
END;
START TRANSACTION;
SELECT Balance 
INTO CurrentBalance
FROM Accounts
WHERE AccountID = FromAccount;
IF CurrentBalance < TransferAmount THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Insufficient funds';
END IF;
UPDATE Accounts
SET Balance = Balance - TransferAmount,
    LastModified = CURDATE()
WHERE AccountID = FromAccount;
UPDATE Accounts
SET Balance = Balance + TransferAmount,
    LastModified = CURDATE()
WHERE AccountID = ToAccount;
COMMIT;
END //
DELIMITER ;
CALL SafeTransferFunds(1,2,500);
SELECT * FROM Accounts;
CALL SafeTransferFunds(1,2,10000);
SELECT * FROM Error_Log;
SELECT * FROM Employees;
DELIMITER //

CREATE PROCEDURE UpdateSalary(
    IN EmpID INT,
    IN IncreasePercentage DECIMAL(5,2)
)

BEGIN

DECLARE EmployeeCount INT;


DECLARE EXIT HANDLER FOR SQLEXCEPTION

BEGIN

INSERT INTO Error_Log(ErrorMessage)
VALUES('Employee ID does not exist');

END;


SELECT COUNT(*)
INTO EmployeeCount
FROM Employees
WHERE EmployeeID = EmpID;


IF EmployeeCount = 0 THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Employee not found';

END IF;


UPDATE Employees

SET Salary = Salary + 
(Salary * IncreasePercentage / 100)

WHERE EmployeeID = EmpID;


END //

DELIMITER ;
CALL UpdateSalary(1,10);
SELECT * FROM Employees;
CALL UpdateSalary(10,10);
SELECT * FROM Error_Log;
SELECT * FROM Customers;
DELIMITER //

CREATE PROCEDURE AddNewCustomer(
    IN CustID INT,
    IN CustName VARCHAR(100),
    IN BirthDate DATE,
    IN InitialBalance DECIMAL(10,2)
)

BEGIN


DECLARE EXIT HANDLER FOR 1062

BEGIN

INSERT INTO Error_Log(ErrorMessage)
VALUES('Customer ID already exists');

END;


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
CALL AddNewCustomer(
3,
'David Miller',
'1995-10-10',
2000
);
SELECT * FROM Customers;
CALL AddNewCustomer(
1,
'Alex',
'2000-01-01',
3000
);
SELECT * FROM Error_Log;
SHOW PROCEDURE STATUS 
WHERE Db='BankManagement';