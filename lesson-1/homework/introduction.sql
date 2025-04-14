-- Easy-Level Tasks

CREATE DATABASE Homework_1
USE  Homework_1

-- Define the following terms: data, database, relational database, and table.

--Data:      --- Pieces of information, like names, numbers, or dates.
--Database:  --- A place where data is stored and organized so you can find and use it easily.
--Relational Database:  ---  A type of database that stores data in tables, and these tables can be connected to each other.
--Table:     ---  A set of data arranged in rows and columns, like a spreadsheet. Each row is a record, and each column is a type of information.
--------------------------------------------------------------------------------------------------------------------------
-- List five key features of SQL Server.

--1.Stores Data  ----  It saves lots of data safely so you can use it anytime.
--2.Fast Searching ----  You can quickly find the information you need.
--3.Data Security  ----  It keeps your data safe with passwords and user permissions.
--4.Backups        ----  It can make copies of your data, so you don’t lose it.
--5.Handles Big Data  -- It can manage large amounts of data for big businesses or apps.

-------------------------------------------------------------------------------------------------------------------------
-- What are the different authentication modes available when connecting to SQL Server? (Give at least 2)

--1. Windows Authentication
             --Uses your Windows login (like the one you use to sign in to your computer).
             --It's more secure because it uses your existing Windows account.
-- 2.SQL Server Authentication
            --Uses a separate username and password created in SQL Server.
            --Good when users don’t have Windows accounts.

--================================================================================================================================
-- Medium-Level Tasks
-- Create a new database in SSMS named SchoolDB.

CREATE DATABASE SchoolDB
USE SchoolDB

-- Write and execute a query to create a table called Students with columns: 
                                     -- StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
CREATE TABLE Students (
        StudentID INT PRIMARY KEY, 
		Name VARCHAR(50), 
		Age INT
		)

---------------------------------------------------------------------------------------------------------------------------------

-- Describe the differences between SQL Server, SSMS, and SQL.

-- SQL Server   --  This is the main program (or system) that stores and manages your data.
                --  Think of it like a big warehouse where all your information is kept.
-- SSMS (SQL Server Management Studio)
               --   This is a tool used to connect to SQL Server and work with the data.
               --   Like a remote control that helps you open the warehouse, look inside, and manage things.
-- SQL (Structured Query Language)
               --   This is the language you use to talk to SQL Server.
               --   You use it to ask questions like "Show me all customers" or "Add a new product."
               --   It’s like the commands you give to get things done.

------------------------------------------------------------------------------------------------------------------------------------

-- Hard-Level Tasks
-- Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.

--1. DQL (Data Query Language)
--Purpose: To get data from the database.

SELECT * FROM Students;

--2. DML (Data Manipulation Language)
--Purpose: To change or use the data inside the tables.  --  Commands: INSERT, UPDATE, DELETE

INSERT INTO Students VALUES (1, 'Dinara', 25), (2, 'Lisa', 27), (3, 'Tim', 32), (4, 'Amir', 25)
UPDATE Students SET Age = 21 WHERE Name = 'Dinara';
DELETE FROM Students WHERE Name = 'Tim';
SELECT * FROM Students

-- 3. DDL (Data Definition Language)
--Purpose: To create or change the structure of tables or databases. -- Commands: CREATE, ALTER, DROP

CREATE TABLE Clients (
    ID int,
    Name varchar(100),
    City varchar(50)
);

ALTER TABLE Clients ADD Email varchar(100);
SELECT * FROM CLients

DROP TABLE Clients

--4. DCL (Data Control Language)
--Purpose: To control access to the data.   --  Commands: GRANT, REVOKE

--5. TCL (Transaction Control Language)
--Purpose: To manage changes made by DML commands, especially in transactions.  -- Commands: COMMIT, ROLLBACK, SAVEPOINT

BEGIN TRANSACTION;
DELETE FROM Students WHERE Name = 'Klara';
ROLLBACK;
COMMIT;


----------------------------------------------------------------------------------------------------------------------------------------

-- Write a query to insert three records into the Students table.

INSERT INTO Students VALUES (5, 'Klara', 20), (6, 'Jakhongir', 19), (7, 'Michale', 23)
SELECT * FROM Students

-------------------------------------------------------------------------------------------------------------------------------
-- Create a backup of your SchoolDB database and restore it. (write its steps to submit)

-- Backup and Restore Steps for SchoolDB

--1. Open SSMS and connect to the server.
--2. Right-click SchoolDB > Tasks > Back Up...
--3. Set Backup Type: Full, choose backup location, and click OK.
--4. To restore: Right-click Databases > Restore Database...
--5. Choose Device > Add backup file (.bak).
--6. Set database name and options, then click OK.
--7. Confirmation messages will appear for both backup and restore.
