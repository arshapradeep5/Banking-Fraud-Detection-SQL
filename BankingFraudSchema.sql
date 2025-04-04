CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Location VARCHAR(100)
);


CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    OpenDate DATE,
    Balance DECIMAL(18, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    Timestamp DATETIME,
    Amount DECIMAL(18, 2),
    TransactionType VARCHAR(10), -- Debit or Credit
    Channel VARCHAR(20), -- ATM, Online, Branch, POS
    Location VARCHAR(100),
    Status VARCHAR(20), -- Success, Failed, Pending
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE FraudReports (
    ReportID INT PRIMARY KEY,
    TransactionID INT,
    FraudType VARCHAR(100),
    ReportedDate DATE,
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID)
);
