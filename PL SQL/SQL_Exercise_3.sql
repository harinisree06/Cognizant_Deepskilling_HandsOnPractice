USE BankManagement;
DELIMITER //
CREATE PROCEDURE ProcessMonthlyInterest()
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01),
        LastModified = CURDATE()
    WHERE AccountType = 'Savings';
END //
DELIMITER ;
-- Execute Procedure
CALL ProcessMonthlyInterest();
-- Verify Updated Balance
SELECT * FROM Accounts;

USE BankManagement;
DELIMITER //
CREATE PROCEDURE UpdateEmployeeBonus(
    IN DeptName VARCHAR(50),
    IN BonusPercentage DECIMAL(5,2)
)
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * BonusPercentage / 100)
    WHERE Department = DeptName;
END //
DELIMITER ;
-- Execute Procedure
-- Adding 10% bonus to IT department employees
CALL UpdateEmployeeBonus('IT',10);
-- Verify Updated Salary
SELECT * FROM Employees;
USE BankManagement;

DELIMITER //

CREATE PROCEDURE TransferFunds(
    IN FromAccount INT,
    IN ToAccount INT,
    IN TransferAmount DECIMAL(10,2)
)

BEGIN
    DECLARE SourceBalance DECIMAL(10,2);
    -- Get source account balance
    SELECT Balance
    INTO SourceBalance
    FROM Accounts
    WHERE AccountID = FromAccount;
    -- Check balance
    IF SourceBalance >= TransferAmount THEN
        -- Deduct money from sender account
        UPDATE Accounts
        SET Balance = Balance - TransferAmount,
            LastModified = CURDATE()
        WHERE AccountID = FromAccount;
        -- Add money to receiver account
        UPDATE Accounts
        SET Balance = Balance + TransferAmount,
            LastModified = CURDATE()
        WHERE AccountID = ToAccount;
        -- Add transaction details
        INSERT INTO Transactions
        VALUES
        (3, FromAccount, CURDATE(), TransferAmount, 'Transfer Debit'),
        (4, ToAccount, CURDATE(), TransferAmount, 'Transfer Credit');
        SELECT 'Transfer Successful' AS Message;
    ELSE
        SELECT 'Insufficient Balance' AS Message;
    END IF;
END //
DELIMITER ;
-- Execute Procedure
CALL TransferFunds(1,2,500);
-- Verify Account Balance
SELECT * FROM Accounts;
-- Verify Transactions
SELECT * FROM Transactions;