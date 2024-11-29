-- Localhost: 127.0.0.1
-- LibararyDB, 

-- Display all databases
SHOW DATABASES;

-- Create Database
CREATE DATABASE gla13db;

-- To use database as current
USE gla13db;

-- Select current database in use
SELECT DATABASE();



-- tbl_songs is an entity
CREATE TABLE tbl_songs(
-- Create the attributes(columns/fields names)
-- ColumnName, datatype , constraints (primary key makes it unique)
SongID INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
Title VARCHAR(60) NOT NULL,
Artist VARCHAR(40) NOT NULL,
Genre VARCHAR(30) NOT NULL
);

-- Display tables within a database
SHOW TABLES;

-- Display records in out table
SELECT * FROM tbl_songs;
 