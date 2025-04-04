CREATE PROCEDURE FlagSuspiciousTransactions
AS
BEGIN
    -- High Value Transactions
    INSERT INTO FraudReports (ReportID, TransactionID, FraudType, ReportedDate)
    SELECT 
        (SELECT ISNULL(MAX(ReportID), 0) + ROW_NUMBER() OVER (ORDER BY T.TransactionID) 
         FROM FraudReports) AS ReportID,
        T.TransactionID,
        'High Value',
        CAST(GETDATE() AS DATE)
    FROM Transactions T
    LEFT JOIN FraudReports FR ON T.TransactionID = FR.TransactionID
    WHERE T.Amount > 10000 AND FR.TransactionID IS NULL;

    -- Odd Hour Transactions
    INSERT INTO FraudReports (ReportID, TransactionID, FraudType, ReportedDate)
    SELECT 
        (SELECT ISNULL(MAX(ReportID), 0) + ROW_NUMBER() OVER (ORDER BY T.TransactionID) 
         FROM FraudReports) AS ReportID,
        T.TransactionID,
        'Odd Hour',
        CAST(GETDATE() AS DATE)
    FROM Transactions T
    LEFT JOIN FraudReports FR ON T.TransactionID = FR.TransactionID
    WHERE DATEPART(HOUR, T.Timestamp) BETWEEN 0 AND 4 AND FR.TransactionID IS NULL;

    -- Location Mismatch
    INSERT INTO FraudReports (ReportID, TransactionID, FraudType, ReportedDate)
    SELECT 
        (SELECT ISNULL(MAX(ReportID), 0) + ROW_NUMBER() OVER (ORDER BY T.TransactionID) 
         FROM FraudReports) AS ReportID,
        T.TransactionID,
        'Location Mismatch',
        CAST(GETDATE() AS DATE)
    FROM Transactions T
    JOIN Accounts A ON T.AccountID = A.AccountID
    JOIN Customers C ON A.CustomerID = C.CustomerID
    LEFT JOIN FraudReports FR ON T.TransactionID = FR.TransactionID
    WHERE T.Location <> C.Location AND FR.TransactionID IS NULL;
END;
