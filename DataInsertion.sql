INSERT INTO Customers VALUES
(1, 'Arjun Mehta', 32, 'Male', 'Mumbai'),
(2, 'Sara Iqbal', 28, 'Female', 'Dubai'),
(3, 'Ravi Sharma', 45, 'Male', 'Delhi'),
(4, 'Aisha Khan', 35, 'Female', 'Bangalore'),
(5, 'John Mathew', 40, 'Male', 'Dubai');


INSERT INTO Accounts VALUES
(101, 1, 'Savings', '2018-05-10', 15000.00),
(102, 2, 'Current', '2020-01-20', 55000.00),
(103, 3, 'Savings', '2017-11-11', 23000.00),
(104, 4, 'Current', '2021-07-01', 7800.00),
(105, 5, 'Savings', '2022-03-05', 10200.00);


INSERT INTO Transactions VALUES
(1001, 101, '2024-12-01 10:15:00', 2000.00, 'Debit', 'ATM', 'Mumbai', 'Success'),
(1002, 101, '2024-12-02 02:30:00', 15000.00, 'Debit', 'Online', 'Delhi', 'Success'), -- Odd hour, diff city
(1003, 102, '2024-12-03 14:45:00', 500.00, 'Debit', 'POS', 'Dubai', 'Success'),
(1004, 103, '2024-12-03 15:00:00', 10000.00, 'Debit', 'Online', 'Delhi', 'Success'),
(1005, 104, '2024-12-04 03:10:00', 3000.00, 'Debit', 'Online', 'Chennai', 'Success'), -- Odd hour
(1006, 105, '2024-12-04 11:00:00', 600.00, 'Credit', 'Branch', 'Dubai', 'Success'),
(1007, 105, '2024-12-04 11:01:00', 800.00, 'Debit', 'Online', 'Dubai', 'Success'), -- Multiple in 1 min
(1008, 105, '2024-12-04 11:02:00', 700.00, 'Debit', 'Online', 'Dubai', 'Success');


INSERT INTO FraudReports VALUES
(1, 1002, 'Odd Hour & Location Mismatch', '2024-12-02'),
(2, 1005, 'Unusual Hour', '2024-12-04');
