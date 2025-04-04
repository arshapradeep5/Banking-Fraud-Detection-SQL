--High-Value Transactions (Above ?10,000)

SELECT 
    T.TransactionID, 
    C.Name AS CustomerName, 
    T.Amount, 
    T.Timestamp, 
    T.TransactionType, 
    T.Channel, 
    T.Location
FROM Transactions T
JOIN Accounts A ON T.AccountID = A.AccountID
JOIN Customers C ON A.CustomerID = C.CustomerID
WHERE T.Amount > 10000;

--Transactions Between 12 AM and 4 AM (Odd Hours)
SELECT 
    T.TransactionID,
    C.Name AS CustomerName,
    T.Timestamp,
    DATEPART(HOUR, T.Timestamp) AS TransactionHour,
    T.Amount,
    T.Channel,
    T.Location
FROM Transactions T
JOIN Accounts A ON T.AccountID = A.AccountID
JOIN Customers C ON A.CustomerID = C.CustomerID
WHERE DATEPART(HOUR, T.Timestamp) BETWEEN 0 AND 4;

--Multiple Transactions Within 1 Minute

SELECT 
    T1.TransactionID AS Txn1,
    T2.TransactionID AS Txn2,
    T1.AccountID,
    T1.Timestamp AS Time1,
    T2.Timestamp AS Time2,
    DATEDIFF(SECOND, T1.Timestamp, T2.Timestamp) AS SecondsDiff
FROM Transactions T1
JOIN Transactions T2 
    ON T1.AccountID = T2.AccountID 
    AND T1.TransactionID < T2.TransactionID
    AND ABS(DATEDIFF(SECOND, T1.Timestamp, T2.Timestamp)) <= 60
ORDER BY T1.AccountID, Time1;


--Different location
SELECT 
    T.TransactionID,
    C.Name AS CustomerName,
    C.Location AS RegisteredLocation,
    T.Location AS TransactionLocation,
    T.Timestamp,
    T.Amount,
    T.Channel
FROM Transactions T
JOIN Accounts A ON T.AccountID = A.AccountID
JOIN Customers C ON A.CustomerID = C.CustomerID
WHERE T.Location <> C.Location;



--Previously Flagged
SELECT 
    FR.ReportID,
    FR.TransactionID,
    C.Name AS CustomerName,
    T.Amount,
    T.Timestamp,
    FR.FraudType,
    FR.ReportedDate
FROM FraudReports FR
JOIN Transactions T ON FR.TransactionID = T.TransactionID
JOIN Accounts A ON T.AccountID = A.AccountID
JOIN Customers C ON A.CustomerID = C.CustomerID;
