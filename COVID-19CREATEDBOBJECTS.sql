/** 
Covid-19-CREATEDBOBJECTS.sql
Author: Eduviges (Vicky) Kaeser
Date Created: 11/13/2021
Description: Data Definition Language(DDL) 
 
TABLES:

	States (StateID, StateName)
	Counties (CountyID, CountyName)
	Cases (YrMo, StateID, CountyID, AgeGroup, CaseType)
	Customers (CustomerID, CustomerName)
	DataRequests (CountyID, CustomerID)

INDEXES:

	Ix_Counties (CountyName)
	Ix_Cases (AgeGroup)

STORED PROCEDURES:

	CasesbyState  @State
	CreateCustomer @NewCustomer
	UpdateCustomerName @CustomerName,  @CustomerID
	DeleteCustomer @CustomerID

**/


USE [COVID-19];
GO


/**************************************************
	
	Tables

**************************************************/

Drop table if exists Cases;
Go


Drop table if exists Cases2;
Go


Drop table if exists DataRequests;
Go


Drop table if exists States;
Go


Drop table if exists Counties;
Go


Drop table if exists Customers;
Go


CREATE TABLE States (StateID INT PRIMARY KEY,
                                            StateName VARCHAR(255))
GO


CREATE TABLE Counties (CountyID INT PRIMARY KEY,
                                            CountyName VARCHAR(255))
GO


CREATE TABLE Cases (CaseID INT IDENTITY PRIMARY KEY,
                                            YrMo VARCHAR(255),
											StateID INT,
											CountyID INT,
											AgeGroup VARCHAR(255),
											CaseType VARCHAR(255),
											FOREIGN KEY (StateID) REFERENCES States(StateID),
											FOREIGN KEY (CountyID) REFERENCES Counties(CountyID))
GO


CREATE TABLE Cases2 (
                                            YrMo VARCHAR(255),
											StateID INT,
											CountyID INT,
											AgeGroup VARCHAR(255),
											CaseType VARCHAR(255))
GO


CREATE TABLE Customers (CustomerID INT IDENTITY PRIMARY KEY,
                                            CustomerName VARCHAR(255))
GO


CREATE TABLE DataRequests ( CountyID INT,
                                            CustomerID INT,
											FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
											FOREIGN KEY (CountyID) REFERENCES Counties(CountyID))
GO


 /********************************************************

	Indexes

**********************************************************/


CREATE NONCLUSTERED INDEX Ix_CountyName
	ON Counties (CountyName);
GO


CREATE NONCLUSTERED INDEX Ix_AgeGroup
	ON Cases (AgeGroup);
GO


/********************************************************

	STORED PROCEDURE
	
********************************************************/


DROP PROCEDURE IF EXISTS CasesbyState;
GO


DROP PROCEDURE IF EXISTS CreateCustomer;
GO


DROP PROCEDURE IF EXISTS UpdateCustomerName;
GO


DROP PROCEDURE IF EXISTS DeleteCustomer;
GO


/** 
    Stored Procedure: CasesbyState 
    Usage: Returns a result set of NumberCases in the database filtered by State
    Parameters:
        @State - filters results to only include cases from a specific state
        
    Returns:
        ResultSet: AgeGroup, StateName, NumberCases
    Error Checks:
        None
**/
CREATE PROCEDURE CasesbyState
				 @State VARCHAR (4) AS
BEGIN

	SELECT s.StateName, c.AgeGroup,  Count(c.CaseID) AS NumberCases
	FROM Cases c
	INNER JOIN States s
	ON c.StateID = s.StateID
	WHERE AgeGroup IS NOT NULL AND s.StateName = @State
	GROUP BY s.StateName, c.AgeGroup
	ORDER BY c.AgeGroup DESC;

END 
GO


/** 
    Stored Procedure: CreateCustomer 
    Usage: Add a Customer to the database 
    Parameters:
        @NewCustomer - NewCustomerName
        
    Returns:
        ResultSet: None
    Error Checks:
        None
**/
CREATE PROCEDURE CreateCustomer
				 @NewCustomer VARCHAR (255) AS
BEGIN

	INSERT INTO Customers 
		(CustomerName)
	VALUES (@NewCustomer);

END
GO


/** 
    Stored Procedure: UpdateCustomerName 
    Usage: Update a CustomerName to the database 
    Parameters:
        @CustomerID - CustomerIDUpdate
		@CustomerName - NewName
        
    Returns:
        ResultSet: None
    Error Checks:
        None
**/
CREATE PROCEDURE UpdateCustomerName
				 @CustomerName VARCHAR (255),
				 @CustomerID INT AS
BEGIN

	UPDATE  Customers 
	SET CustomerName = @CustomerName
	WHERE CustomerID = @CustomerID;
END
GO


/** 
    Stored Procedure: DeleteCustomer
    Usage: Delete a Customer from the database 
    Parameters:
        @CustomerID - DeleteCustomer
        
    Returns:
        ResultSet: None
    Error Checks:
        None
**/

CREATE PROCEDURE DeleteCustomer
				 @CustomerID INT AS
BEGIN

	DELETE  FROM Customers 
	WHERE CustomerID = @CustomerID;
END
GO