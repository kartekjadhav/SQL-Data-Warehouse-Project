/*
=======================================================
Create Database and Schemas
=======================================================

Script Purpose : This script created new database "DataWarehouse".
if the database already exits then existing database is first dropped and then new database is created. 
Additionally in DataWarehouse database 3 new schemas are created - "Bronze", "Silver", "Gold"

WARNING : This script will drop the entire exiting "DataWarehouse" database if exitst.
Please run this script with caution and make sure you have proper backup before running it.

*/


USE master;

GO

-- Drop annd recreate "DataWarehouse" database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USE WITH ROLLBACK IMMEDIATE; -- Run this to disconnect all users session else we might get 
  DROP DATABASE DataWarehouse;
END;

GO
-- create the "DataWarehouse" database
CREATE DATABASE DataWarehouse;

GO

USE DataWarehouse;

GO 

-- Create Schemas
  
CREATE SCHEMA bronze;

GO 

CREATE SCHEMA silver;

GO 

CREATE SCHEMA gold;
