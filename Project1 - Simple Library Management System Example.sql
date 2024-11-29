--! Initialize

CREATE DATABASE LibraryDB_SMS;
USE LibraryDB_SMS;


--* Create Tables For data

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    published_year INT,
    available_copies INT DEFAULT 1
);


CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(15)
);


CREATE TABLE BorrowedBooks (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    borrower_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
		ON DELETE CASCADE,   -- Ensures if a book is deleted, its borrowed records are removed,
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
		ON DELETE CASCADE    -- Ensures if a borrower is deleted, their borrowed records are removed
);



--* Insert Data

INSERT INTO Books (title, author, published_year, available_copies)
VALUES 
    ('The Silent Patient', 'Alex Michaelides', 2019, 5),
    ('Becoming', 'Michelle Obama', 2018, 7),
    ('The Alchemist', 'Paulo Coelho', 1988, 5),
    ('Atomic Habits', 'James Clear', 2018, 8),
    ('Dune', 'Frank Herbert', 1965, 10);
    
INSERT INTO Borrowers (name, email, phone_number)
VALUES 
    ('Daniel Anderson', 'daniel.anderson@example.com', '07123156156'),
    ('Mia Walker', 'mia.walker@example.com', '07489156489'),
    ('James Scott', 'james.scott@example.com', '07321654987'),
    ('Olivia Taylor', 'olivia.taylor@example.com', '07156489325'),
    ('Lucas White', 'lucas.white@example.com', '07986974451');
    
INSERT INTO BorrowedBooks (book_id, borrower_id, borrow_date, return_date)
VALUES 
    (1, 1, '2024-11-05', NULL),   		-- 'The Silent Patient' 	borrowed by Daniel Anderson, 	not yet returned
    (2, 2, '2024-11-01', '2024-11-10'), -- 'Becoming' 				borrowed by Mia Walker,			returned
    (3, 3, '2024-11-07', NULL),   		-- 'The Alchemist' 			borrowed by James Scott, 		not yet returned
    (4, 4, '2024-11-08', NULL),   		-- 'Atomic Habits' 			borrowed by Olivia Taylor,		not yet returned
    (5, 5, '2024-11-02', '2024-11-12'); -- 'Dune' 					borrowed by Lucas White, 		returned
    
    
    
    
--* Interact / Find Data

    
-- List all books	
SELECT * FROM Books;		
-- List all borrowers
SELECT * FROM Borrowers;	

-- List all borrowed books
SELECT bb.borrow_id, b.title, br.name, bb.borrow_date, bb.return_date
FROM BorrowedBooks bb
JOIN Books b ON bb.book_id = b.book_id
JOIN Borrowers br ON bb.borrower_id = br.borrower_id;
    
-- Example: Updating return_date for a borrowed book (borrow_id = 1)
UPDATE BorrowedBooks
SET return_date = CURDATE()
WHERE borrow_id = 1;



-- Check if the borrower has active borrowed books
SELECT borrower_id
FROM BorrowedBooks
WHERE borrower_id = 1 AND return_date IS NULL;

-- If no active borrowed books, delete the borrower
DELETE FROM Borrowers
WHERE borrower_id = 1 AND NOT EXISTS (
    SELECT 1 FROM BorrowedBooks WHERE borrower_id = 1 AND return_date IS NULL
);






--* Wipe Tables

-- disable foreign key checks before truncating
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE BorrowedBooks;
TRUNCATE TABLE Borrowers;
TRUNCATE TABLE Books;

-- Enable foreign key checks after truncating
SET FOREIGN_KEY_CHECKS = 1;

DELETE FROM BorrowedBooks;
DELETE FROM Borrowers;
DELETE FROM Books;
