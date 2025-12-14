--Master is a system database which is used to create new databases
USE master
Go

  --Here we created the new database
create database datawareh ouse;
Go

  --Switched the database from master to datawarehouse
use datawarehouse;
Go

  --Creating schemas for each layer
Create Schema bronze;
Go
Create Schema silver;
Go
Create Schema gold;
