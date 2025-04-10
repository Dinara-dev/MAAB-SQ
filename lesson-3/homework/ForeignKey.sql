--  Easy-Level Tasks 

CREATE DATABASE Homework_lesson3
USE Homework_lesson3

CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10,2))

INSERT INTO Products VALUES (1, 'Lays', 11000),
                     (2, 'Borjomi', 12000),
                     (3, 'Pepsi', 6000);
DROP TABLE Products;

-- NULL
CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(50) NULL, Price DECIMAL(10,2))
INSERT INTO Products(ProductID, ProductName) VALUES(5, 'Pepsi')
INSERT INTO Products(ProductID, Price) VALUES(2,5000)
 
   
SELECT * FROM Products
DROP TABLE Products
  
-- NOT NULL
CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(50) NOT NULL, Price DECIMAL(10,2))
INSERT INTO Products (ProductID, ProductName, Price) VALUES (2, 120000)
INSERT INTO Products (ProductID, ProductName, Price) VALUES (1, 'Lipstick', 170000)

-- UNIQUE 
USE Homework_lesson3
CREATE TABLE Students (
       ID INT UNIQUE,
	  Name VARCHAR (50)
)

INSERT INTO Students VALUES (1, 'Dina'), (2, 'Tina')
INSERT INTO Students VALUES (3, 'Kevin')

SELECT * FROM Students

-- IDENTITY
CREATE TABLE  Categories
(
    CategoryID INT IDENTITY (100,1),
   CategoryName VARCHAR (50)
)
INSERT INTO  Categories VALUES ('Matte')
INSERT INTO  Categories VALUES ('Eye-shadow')

SELECT * FROM  Categories
DROP TABLE Categories

-- Medium-Level Tasks 
-- Use BULK INSERT to import data from a text file into the Products table.

CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(50) NULL, Price DECIMAL(10,2))


BULK INSERT [dbo].[Products]
FROM 'C:\Users\Admin\Desktop\SQL\Products.csv'
WITH (
     firstrow = 2,
   rowterminator = '\n',
   fieldterminator = ','
   )

SELECT * FROM Products
DROP TABLE Products

--Create a FOREIGN KEY in the Products table that references the Categories table.

CREATE TABLE  Categories
(
    CategoryID INT PRIMARY KEY,
   CategoryName VARCHAR (50) NULL
)
INSERT INTO  Categories VALUES (1,'Matte'), (2,'Eye-shadow')


SELECT * FROM  Categories
DROP TABLE Categories


CREATE TABLE Products (
             ProductID INT PRIMARY KEY,
			 ProductName VARCHAR(50) NULL, 
			 Price DECIMAL(10,2), 
			 CategoryID INT-- ON DELETE CASCADE
)

INSERT INTO Products VALUES (100, 'Lipstick', 46, 1), (101, 'Pink',32, 1), (102, 'Parfume', 70, 2)

SELECT * FROM  Products
DROP TABLE Products 

 --  Add a CHECK constraint to the Products table ensuring Price > 0. 

 CREATE TABLE Products (
             ProductID INT PRIMARY KEY,
			 ProductName VARCHAR(50) NULL, 
			 Price DECIMAL(10,2) CHECK (Price > 300000)
)


INSERT INTO Products ( ProductID, ProductName, Price)
VALUES (1, 'Skincare', 350000),
       (2, 'Mist', 380000),
       (3, 'Lipstick', 400000),
       (4, 'RareBeauty', 220000),
       (5, 'KIKO', 420000)
;


SELECT * FROM Products;
DROP TABLE Products 

-- Modify the Products table to add a column Stock (INT, NOT NULL).


 CREATE TABLE Products (
             ProductID INT PRIMARY KEY,
			 ProductName VARCHAR(50) NULL, 
			 Price DECIMAL(10,2) 
)
ALTER TABLE Products
ADD Stock INT NOT NULL;

SELECT * FROM Products
DROP TABLE Products

-- Use the ISNULL function to replace NULL values in a column with a default value.

CREATE TABLE Students( StudentID INT, fname VARCHAR (50), lname VARCHAR(50), mname VARCHAR(50))
INSERT INTO Students VALUES (1, 'Dina', 'Sagdullaeva', 'Lufullaevna'),
                            (2, 'Liana', NULL, 'Bakhadirovna'),
							(3, NULL, 'Victor', 'Vasilovich'),
							(4, 'Leo', 'Lily', 'Lucas'),
							(5,  NULL, NULL,  NULL),
							(6, 'Madina', 'Akhmedova',NULL)

SELECT * FROM Students					
DROP TABLE Students

SELECT ISNULL (fname, 'Dinara') AS SellerName FROM Students;


-- Hard-Level Tasks

-- Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18

 CREATE TABLE Customers (
               CustomerID INT PRIMARY KEY,
			   CustomerName VARCHAR (50) NULL,
			   Age INT CHECK ( Age >= 18)
			   )
INSERT INTO Customers VALUES (1, 'Umid', 21)
INSERT INTO Customers VALUES (2, 'Aziz', 16)
INSERT INTO Customers VALUES (3, 'Lina', 25)

SELECT * FROM Customers
DROP TABLE Customers

-- Create a table with an IDENTITY column starting at 100 and incrementing by 10.

 CREATE TABLE Customers (
               CustomeID INT IDENTITY (100, 10),
			   CustomerName VARCHAR (50) NULL,
			   Age INT 
			   )

INSERT INTO Customers VALUES ('Umid', 21),
                             ('Aziz', 16),
                             ('Lina', 25)

SELECT * FROM Customers
	DROP TABLE Customers
       
-- Write a query to create a composite PRIMARY KEY in a new table OrderDetails.

CREATE TABLE OrderDretails (
              OrderID INT PRIMARY KEY,
			  OrderName VARCHAR (50)
			  )
INSERT INTO OrderDretails VALUES (1, 'Computer')

			  SELECT * FROM OrderDretails

			  -- Explain with examples the use of COALESCE and ISNULL functions for handling NULL values.

CREATE TABLE Students( StudentID INT, fname VARCHAR (50), lname VARCHAR(50), mname VARCHAR(50))
INSERT INTO Students VALUES (1, NULL, NULL, 'Bakhadirovna'),
                            (2,  NULL, NULL,  NULL),
							(3, NULL, 'Victor', 'Vasilovich'),
							(4, 'Leo', 'Lily', 'Lucas'),
							(6, 'Madina', 'Akhmedova',NULL)

SELECT * FROM Students	
DROP TABLE Students
SELECT COALESCE ( fname, lname, mname) FROM Students 


-- Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.

CREATE TABLE Employees(
             EmpID INT PRIMARY KEY,
			 EmpNAME VARCHAR (50),
			 Email VARCHAR (50) UNIQUE 
			 )

INSERT INTO Employees VALUES (1, 'Dina', 'sagdullaevadinara@gmail.com'),
                              (2, 'Tim', 'timur@gamil.com'),
					          (3, 'Filix', 'timur@gamil.com');

SELECT * FROM Employees

-- Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.

CREATE TABLE  Categories
(
    CategoryID INT PRIMARY KEY,
   CategoryName VARCHAR (50) NULL
)
INSERT INTO  Categories VALUES (1,'Matte'), (2,'Eye-shadow')
INSERT INTO  Categories VALUES (3,'White')

SELECT * FROM  Categories
DROP TABLE Categories

CREATE TABLE Products (
             ProductID INT PRIMARY KEY,
			 ProductName VARCHAR(50) NULL, 
			 Price DECIMAL(10,2), 
			 FOREIGN KEY (ProductID) REFERENCES Categories(CategoryID) ON DELETE CASCADE
)

INSERT INTO Products VALUES (1, 'Lipstick', 76), (2, 'Pink',32)


SELECT * FROM  Products
DROP TABLE Products


CREATE TABLE Products (
             ProductID INT PRIMARY KEY,
			 ProductName VARCHAR(50) NULL, 
			 Price DECIMAL(10,2), 
			 FOREIGN KEY (ProductID) REFERENCES Categories(CategoryID) ON UPDATE CASCADE
)

INSERT INTO Products VALUES (3, 'Phone', 66)
