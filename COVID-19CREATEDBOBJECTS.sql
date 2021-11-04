/** 
TABLES
States(StateID, StateName)
Counties(CountyID, CountyName)
Cases(States, Counties, YrMo)

INDEXES

STOREDPROCEDURES
**/

Drop table if exists States;
Go

Drop table if exists Counties;
Go

CREATE TABLE States (StateID INT PRIMARY KEY,
                                            StateName VARCHAR(255))
GO



CREATE TABLE Counties (CountyID INT PRIMARY KEY,
                                            CountyName VARCHAR(255))
GO
