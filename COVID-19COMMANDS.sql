/**
Other Example Commands to select from:

SELECT * FROM States
Go

SELECT * FROM Counties
Go

SELECT * FROM Cases
Go

SELECT * FROM Cases2
Go

SELECT * FROM Customers
Go

SELECT * FROM DataRequests
Go
**/


USE [COVID-19];
GO


/** Results: NumberCases by AgeGroup determined by State (use the format indicated here for your state selection)**/
EXECUTE CasesbyState @State = 'KY'
GO


/** 
Message informs the completion and rows affected, now highlight this command and execute to see the results(Bernadett1 CustomerID 4) SELECT * FROM Customers GO
OR selected from the 'Other Example Commands to select from:' (see them at the top of this tab) **/
EXECUTE CreateCustomer @NewCustomer = 'Bernadett1'
GO


/** 
Message informs the completion and rows affected, now highlight this command and execute to see the results(Bernadett1 CustomerID 4 updated to Jasmin) SELECT * FROM Customers GO
OR selected from the 'Other Example Commands to select from:' (see them at the top of this tab) **/
EXECUTE UpdateCustomerName @CustomerID = 4,
						   @CustomerName = 'Jasmin'
GO


/** 
Message informs the completion and rows affected, now highlight this command and execute to see the results(CustomerID 4 was deleted) SELECT * FROM Customers GO
OR selected from the 'Other Example Commands to select from:' (see them at the top of this tab) **/
EXECUTE DeleteCustomer @CustomerID = 4;
GO 


/**
More Example Commands to select from:

SELECT  s.StateName, c.AgeGroup, Count(1) AS NumberCases
	FROM Cases c
	INNER JOIN States s
	ON c.StateID = s.StateID
	WHERE AgeGroup IS NOT NULL AND s.StateName in ('IN', 'KY', 'OH', 'TN')
	GROUP BY s.StateName, c.AgeGroup
	ORDER BY s.StateName, c.AgeGroup DESC; 
GO

SELECT COUNT(1) FROM Cases WHERE StateId = 18 
GO

SELECT COUNT(1) FROM Cases2 WHERE StateId = 18 
GO

SELECT COUNT(1) FROM Cases
GO

SELECT COUNT(1) FROM Cases2
GO

SELECT DISTINCT(StateID) FROM Cases2
GO
**/