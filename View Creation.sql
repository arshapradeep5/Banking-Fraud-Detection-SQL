--High Value Transactions

CREATE VIEW HighValueTransactions AS
SELECT 
    T.TransactionID, 
    C.Name AS CustomerName, 
    T.Amount, 
    T.Timestamp, 
    T.Channel, 
    T.Location
FROM Transactions T
JOIN Accounts A ON T.AccountID = A.AccountID
JOIN Customers C ON A.CustomerID = C.CustomerID
WHERE T.Amount > 10000;

--odd hour Transactions

CREATE VIEW OddHourTransactions AS
SELECT 
    T.TransactionID,
    C.Name AS CustomerName,
    T.Timestamp,
    T.Amount,
    T.Channel,
    T.Location
FROM Transactions T
JOIN Accounts A ON T.AccountID = A.AccountID
JOIN Customers C ON A.CustomerID = C.CustomerID
WHERE DATEPART(HOUR, T.Timestamp) BETWEEN 0 AND 4;

--Location Mismatch 
CREATE VIEW LocationMismatchTransactions AS
SELECT 
    T.TransactionID,
    C.Name AS CustomerName,
    C.Location AS RegisteredLocation,
    T.Location AS TransactionLocation,
    T.Timestamp,
    T.Amount
FROM Transactions T
JOIN Accounts A ON T.AccountID = A.AccountID
JOIN Customers C ON A.CustomerID = C.CustomerID
WHERE T.Location <> C.Location;
