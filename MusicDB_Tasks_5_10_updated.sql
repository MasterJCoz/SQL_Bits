-- SQL how to link below
-- https://www.w3schools.com/sql/default.asp
-- https://quickref.me/mysql

-- A database
-- A database is an organized collection of data, generally stored and accessed electronically
-- from a computer system. Databases allow for the efficient retrieval, insertion, and deletion
-- of data, along with various means of managing data.

-- Tables & Keys
-- Songs Table: Contains information about songs.
-- Members Table: Contains information about members.
-- Downloads Table: Contains information about downloads, referencing both songs and members


-- Task 5 Functions: Using a string and date functions
-- 5.1 use the concat function to join any two fields 
-- 5.2 use the concat function to join any three fields 

-- Task 5.3: Strech and challenge: Research and apply the DATEDIFF where it applies to any table:
-- Using a date function (https://www.w3schools.com/sql/func_mysql_datediff.asp)


-- Task 6: Use the like Operator(SQL Logical Operators)
-- Task 6.1
-- Query the members table to find Lastname that starts with b
-- Query the members table to find Lastname that ends with a
-- Query the members table to find Lastname that starts a with and ends with a

-- Task 6.2: 
-- Query the members table to find email address that contain .co.uk
-- Query the members table to find email address that does not contain com
-- Query the members table to find email address that does not contain .co.uk
-- Query the members table to find email address that contain .co.uk and does not contain coldmail.co.uk

-- Task 6.2: Strech and challenge: Research and apply the following operators to any of the three tables:
-- SQL IN and NOT IN Operator (https://www.w3schools.com/sql/sql_in.asp)
-- The SQL Between Operator (https://www.w3schools.com/sql/sql_between.asp)



-- Task 7: Applying joins to tables
-- Task 7.1 Apply inner join to the members and downloads tables


-- Task 7.2 Strech and challenge: Research and apply inner join to the members, songs and downloads tables
-- Link to example below of how to apply jon on three tables  
-- https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_join_inner2

-- Task 8: Alter Command
-- Task 8.1 Rename column ARTIST to Artist in the songs table
-- Task 8.1 Rename column GENRE to Genre in the songs table


-- Task 9: Stored Procedure (Variables, Parameters)
-- Task 9.1: Create a functions/stored Procedure to find downloads by MemberID
-- Task 9.2: Strech and challenge: Create a function or procedure to update a field in the songs
-- Note: This function or procedure takes in two parameter, the SongID and the value of the field to be updated


-- Task 10:  CASE Expression and CASE statement
-- Task 10.1: Apply the case statement in the songs table to modify two or more fields (Genre,Artist) data





-- Other SQL Commands
SELECT VERSION();
SELECT NOW();
SELECT USER();
SELECT USER(), NOW();