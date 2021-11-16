/**
Covid-19-LOADDATA.sql
Author: Eduviges (Vicky) Kaeser
Date Created: 11/13/2021
Description: data for Covid-19 (States, Counties, Cases, Customers, and DataRequests)
**/


USE [COVID-19];
GO


--C:\Users\Vicky\Documents\COVID-19\Casses.csv

BULK INSERT States FROM 'C:\Users\Vicky\Documents\COVID-19\States.csv' WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', TABLOCK );



BULK INSERT Counties FROM 'C:\Users\Vicky\Documents\COVID-19\Counties.csv' WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', TABLOCK );

BULK INSERT Cases2 FROM 'C:\Users\Vicky\Documents\COVID-19\Cases.csv' WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', TABLOCK ); 


INSERT INTO Cases (YrMo, AgeGroup, CaseType, StateID, CountyID) SELECT YrMo, AgeGroup, CaseType, StateID, CountyID FROM Cases2;

INSERT INTO Customers VALUES ( 'Joe')
INSERT INTO Customers VALUES ( 'Jane')
INSERT INTO Customers VALUES ( 'Barney')
Go

INSERT INTO DataRequests VALUES (18001, 1)
INSERT INTO DataRequests VALUES (18003, 2)
INSERT INTO DataRequests VALUES (18005, 3)
Go