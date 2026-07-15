USE BankManagement;
DELIMITER //
CREATE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
    SET NEW.LastModified = CURDATE();
END //
DELIMITER ;
-- Test Trigger
UPDATE Customers
SET Balance = 2000
WHERE CustomerID = 1;
-- Check Updated Date
SELECT * FROM Customers;
USE BankManagement;
CREATE TABLE AuditLog
(
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    TransactionID INT,
    AccountID INT,
    Action VARCHAR(50),
    ActionDate DATE
);
DELIMITER //
CREATE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog
    (
        TransactionID,
        AccountID,
        Action,
        ActionDate
    )
    VALUES
    (
        NEW.TransactionID,
        NEW.AccountID,
        'Transaction Added',
        CURDATE()
    );
END //
DELIMITER ;
INSERT INTO Transactions
VALUES
(5,1,CURDATE(),500,'Deposit');
-- Check Audit Log
SELECT * FROM AuditLog;
USE BankManagement;
DELIMITER //
CREATE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
BEGIN
    DECLARE CurrentBalance DECIMAL(10,2);
    -- Get current account balance
    SELECT Balance
    INTO CurrentBalance
    FROM Accounts
    WHERE AccountID = NEW.AccountID;
    -- Check Deposit Rule
    IF NEW.TransactionType = 'Deposit' THEN
        IF NEW.Amount <= 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Deposit amount must be positive';
        END IF;
    -- Check Withdrawal Rule
    ELSEIF NEW.TransactionType = 'Withdrawal' THEN
        IF NEW.Amount > CurrentBalance THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient balance for withdrawal';
        END IF;
    END IF;
END //
DELIMITER ;
INSERT INTO Transactions
VALUES
(6,1,CURDATE(),500,'Deposit');
SELECT AccountID, Balance
FROM Accounts;
INSERT INTO Transactions
VALUES
(7,1,CURDATE(),5,'Withdrawal');
UPDATE Accounts
SET Balance = 1000
WHERE AccountID = 1;
SELECT AccountID, Balance
FROM Accounts;
INSERT INTO Transactions
VALUES
(8,1,CURDATE(),500,'Withdrawal');
SELECT * FROM Transactions;