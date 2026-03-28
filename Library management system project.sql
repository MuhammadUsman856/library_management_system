-- Library Management System Database

-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Create Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    available Bit
);

-- Create Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create Issue Table
CREATE TABLE IssueRecords (
    issue_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Insert Sample Data
INSERT INTO Books VALUES (1, 'C++ Basics', 'Bjarne Stroustrup', 1);
INSERT INTO Books VALUES (2, 'SQL Guide', 'John Smith', 1);

INSERT INTO Members VALUES (1, 'Usman Khan');
INSERT INTO Members VALUES (2, 'Ali Raza');

-- Issue a Book
INSERT INTO IssueRecords VALUES (1, 1, 1, '2026-01-01', NULL);

-- Mark Book as Not Available
UPDATE Books SET available = 0 WHERE book_id = 1;

-- Return Book
UPDATE IssueRecords SET return_date = '2026-01-10' WHERE issue_id = 1;
UPDATE Books SET available = 1 WHERE book_id = 1;

-- View All Books
SELECT * FROM Books;

-- View Issued Books
SELECT b.title, m.name, i.issue_date
FROM IssueRecords i
JOIN Books b ON i.book_id = b.book_id
JOIN Members m ON i.member_id = m.member_id
WHERE i.return_date IS NULL;
