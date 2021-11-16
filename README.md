# COVID-19

## Introduction

This repository is COVID-19 and contains Covid-19 data from March 2020 to September 2021. 
The purpose of this code is for customers to request COVID-19 data.

## Project Description

**Covid-19**

Covid-19 is a database based on Covid-19 laboratory-confirmed cases. 
Data requests suggestions could be, by age groups, by state, by county, by year-month, or several combinations. 
The Stored Procedures within this project assists with maintance by creating, updating, and deleting members.

## Features

- Maintain lists of customers
- Track the Covid-19 confirmed cases based on selected state(s)


## User Instructions

| Feature | Command |
| ----------- | ----------- |
| Add Customer | CreateCustomer @NewCustomer = "CustomerName" |
| Remove Customer | DeleteCustomer @CustomerID = "CustomerID" |
| Edit Customer | UpdateCustomerName @CustomerName = "CustomerName", @CustomerID = "CustomerID" |
| List Cases by selecting a State |@State = "s.StateName" |


## Technical Instructions

- Requires MS SQL Server
- Execute the COVID-19CREATEDBOBJECTS.sql script to create the database objects
- Execute the COVID-19LOADDATA.sql script to load the data
- The COVID-19COMMANDS.sql script has example commands you can select (by highlighting then hit Execute) and the Execute stored procedures commands.

## Project Requirements

**Group 1: Reading Data from a Database**

- Write a SELECT query that uses a WHERE clause.
- Write a  SELECT query that filters NULL rows using IS NOT NULL.
- Write a  SELECT query that utilizes a JOIN.

**Group 2: Updating/Deleting Data from a Database**

- Write a DML statement that UPDATEs a set of rows with a WHERE clause. The values used in the WHERE clause should be a variable.
- Write a DML statement that DELETEs a set of rows with a WHERE clause. The values used in the WHERE clause should be a variable.

**Group 3: Optimizing a Database**

- Design a NONCLUSTERED INDEX with ONE KEY COLUMN that improves the performance of one of the above queries.






