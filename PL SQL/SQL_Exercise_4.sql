USE BankManagement;
SHOW FUNCTION STATUS 
WHERE Db = 'BankManagement';
DELIMITER //

CREATE FUNCTION CalculateAge(CustomerDOB DATE)
RETURNS INT
DETERMINISTIC

BEGIN

    DECLARE Age INT;

    SET Age = TIMESTAMPDIFF(YEAR, CustomerDOB, CURDATE());

    RETURN Age;

END //

DELIMITER ;
SELECT CalculateAge('1985-05-15') AS CustomerAge;
SELECT 
CustomerID,
Name,
CalculateAge(DOB) AS Age
FROM Customers;
USE BankManagement;
DELIMITER //

CREATE FUNCTION CalculateMonthlyInstallment(
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    LoanDurationYears INT
)

RETURNS DECIMAL(10,2)
DETERMINISTIC

BEGIN

    DECLARE MonthlyRate DECIMAL(10,5);
    DECLARE Months INT;
    DECLARE EMI DECIMAL(10,2);


    -- Convert annual interest rate to monthly rate

    SET MonthlyRate = InterestRate / (12 * 100);


    -- Convert years into months

    SET Months = LoanDurationYears * 12;


    -- EMI Formula

    SET EMI = (LoanAmount * MonthlyRate * POWER(1 + MonthlyRate, Months))
              /
              (POWER(1 + MonthlyRate, Months) - 1);


    RETURN EMI;


END //

DELIMITER ;
SELECT CalculateMonthlyInstallment(5000,5,5) AS MonthlyInstallment;
USE BankManagement;
DELIMITER //

CREATE FUNCTION HasSufficientBalance(
    AccID INT,
    Amount DECIMAL(10,2)
)

RETURNS BOOLEAN
DETERMINISTIC

BEGIN

    DECLARE CurrentBalance DECIMAL(10,2);


    -- Get account balance

    SELECT Balance
    INTO CurrentBalance
    FROM Accounts
    WHERE AccountID = AccID;


    -- Check balance

    IF CurrentBalance >= Amount THEN

        RETURN TRUE;

    ELSE

        RETURN FALSE;

    END IF;


END //

DELIMITER ;
SELECT HasSufficientBalance(1,500) AS BalanceCheck;
SELECT HasSufficientBalance(1,2000) AS BalanceCheck;