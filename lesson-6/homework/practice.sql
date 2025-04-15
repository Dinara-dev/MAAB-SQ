-- lesson-6 homework: practice

CREATE DATABASE Practice_6
USE Practice_6

-- Puzzle 1: Finding Distinct Values
-- Question: Explain at least two ways to find distinct values based on two columns.

CREATE TABLE Letters  ( col1 VARCHAR (5), col2 VARCHAR (5))
INSERT INTO Letters VALUES ('a', 'b'), ('a', 'b'), ('b', 'a'), ('c', 'd'), ('c', 'd'), ('m', 'n'), ('n', 'm')

SELECT * FROM Letters

-- 1th method
SELECT DISTINCT 
    LEAST(col1, col2) AS col1,
    GREATEST(col1, col2) AS col2
FROM Letters;

-- 2nd method
WITH Normalized AS (
    SELECT col1, col2 FROM Letters WHERE col1 <= col2
    UNION
    SELECT col2 AS col1, col1 AS col2 FROM Letters WHERE col1 > col2
)
SELECT DISTINCT col1, col2 FROM Normalized;
---------------------------------------------------------------------------------------------------------------------------

-- Puzzle 2: Removing Rows with All Zeroes
-- Question: If all the columns have zero values, then don’t show that row. 
                                  --In this case, we have to remove the 5th row while selecting data.

CREATE TABLE TestMultipleZero ( A INT NULL, B INT NULL, C INT NULL, D INT NULL );
INSERT INTO TestMultipleZero(A,B,C,D) VALUES (0,0,0,1), (0,0,1,0), (0,1,0,0), (1,0,0,0), (0,0,0,0), (1,1,1,0);
SELECT * FROM TestMultipleZero

SELECT * FROM TestMultipleZero
WHERE NOT ( A = 0 AND B = 0 AND C = 0 AND D = 0 )

-- Puzzle 3: Find those with odd ids

create table section1(id int, name varchar(20)) 
insert into section1 values (1, 'Been'), (2, 'Roma'), (3, 'Steven'), (4, 'Paulo'), (5, 'Genryh'), 
                                            (6, 'Bruno'), (7, 'Fred'), (8, 'Andro')
SELECT *FROM section1
WHERE id % 2 = 1;

-- Puzzle 4: Person with the smallest id (use the table in puzzle 3)

SELECT 
    MIN(id) AS smallest
FROM section1;

-- Puzzle 5: Person with the highest id (use the table in puzzle 3)

SELECT 
    MAX(id) AS smallest
FROM section1;

-- Puzzle 6: People whose name starts with b (use the table in puzzle 3)

SELECT * FROM section1
WHERE name LIKE 'B%'

-- Puzle 7: Write a query to return only the rows where the code contains the 
                                                                --literal underscore _ (not as a wildcard).
insert into section1 values (9, 'Bee_n'), (10, 'Di__n')

SELECT * FROM section1
WHERE  name LIKE '%\_%' ESCAPE '\';
