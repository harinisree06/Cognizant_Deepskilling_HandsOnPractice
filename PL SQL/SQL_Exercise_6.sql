USE BankManagement;
DELIMITER //
CREATE PROCEDURE GenerateMonthlyStatements()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE CustID INT;
    DECLARE CustName VARCHAR(100);
    DECLARE CustomerCursor CURSOR FOR
    SELECT CustomerID, Name
    FROM Customers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN CustomerCursor;
    CustomerLoop: LOOP
        FETCH CustomerCursor INTO CustID, CustName;
        IF done = 1 THEN
            LEAVE CustomerLoop;
        END IF;
        SELECT 
            CustName AS Customer_Name,
            T.TransactionID,
            T.Amount,
            T.TransactionType,
            T.TransactionDate
        FROM Transactions T
        JOIN Accounts A
        ON T.AccountID = A.AccountID
        WHERE A.CustomerID = CustID
        AND MONTH(T.TransactionDate)=MONTH(CURDATE())
        AND YEAR(T.TransactionDate)=YEAR(CURDATE());
    END LOOP;
    CLOSE CustomerCursor;
END //
DELIMITER ;
CALL GenerateMonthlyStatements();
USE BankManagement;
DELIMITER //
CREATE PROCEDURE ApplyAnnualFee()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE AccID INT;
    DECLARE AccountCursor CURSOR FOR
    SELECT AccountID
    FROM Accounts;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN AccountCursor;
    AccountLoop: LOOP
        FETCH AccountCursor INTO AccID;
        IF done = 1 THEN
            LEAVE AccountLoop;
        END IF;
        UPDATE Accounts
        SET Balance = Balance - 500,
            LastModified = CURDATE()
        WHERE AccountID = AccID;
    END LOOP;
    CLOSE AccountCursor;
END //
DELIMITER ;
CALL ApplyAnnualFee();
SELECT * FROM Accounts;
USE BankManagement;
DELIMITER //
CREATE PROCEDURE UpdateLoanInterestRates()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE Loan_ID INT;
    DECLARE CurrentRate DECIMAL(5,2);
    DECLARE LoanCursor CURSOR FOR
    SELECT LoanID, InterestRate
    FROM Loans;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN LoanCursor;
    LoanLoop: LOOP
        FETCH LoanCursor INTO Loan_ID, CurrentRate;
        IF done = 1 THEN
            LEAVE LoanLoop;
        END IF;
        UPDATE Loans
        SET InterestRate = CurrentRate + 1
        WHERE LoanID = Loan_ID;
    END LOOP;
    CLOSE LoanCursor;
END //
DELIMITER ;
CALL UpdateLoanInterestRates();
SELECT * FROM Loans;