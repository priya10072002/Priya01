library management 

CREATE DATABASE LibraryDB;
USE LibraryDB;
-- Books Table
CREATE TABLE Books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    published_year YEAR NOT NULL,
    genre VARCHAR(30)
);

-- Members Table
CREATE TABLE Members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    membership_date DATE NOT NULL
);

-- Borrowing Table
CREATE TABLE Borrowing (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

-- Insert Data into Books
INSERT INTO Books (title, author, published_year, genre) VALUES
('The Catcher in the Rye', 'J.D. Salinger', 1951, 'Fiction'),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction'),
('1984', 'George Orwell', 1949, 'Dystopian'),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Classics');

-- Insert Data into Members
INSERT INTO Members (name, membership_date) VALUES
('Alice Johnson', '2024-01-15'),
('Bob Smith', '2023-09-10'),
('Charlie Davis', '2025-02-01'),
('Diana Clark', '2022-07-21');

-- Insert Data into Borrowing
INSERT INTO Borrowing (book_id, member_id, borrow_date, return_date) VALUES
(1, 1, '2025-02-01', '2025-02-10'),
(2, 2, '2025-02-05', NULL),
(3, 3, '2025-02-03', '2025-02-07'),
(4, 4, '2025-02-06', '2025-02-12');


-- List all books
SELECT * FROM Books;

-- List all members
SELECT * FROM Members;

-- Show borrowing records with member names and book titles
SELECT m.name AS Member, b.title AS Book, br.borrow_date, br.return_date
FROM Borrowing br
JOIN Members m ON br.member_id = m.id
JOIN Books b ON br.book_id = b.id;

-- Count the number of books borrowed by each member
SELECT m.name AS Member, COUNT(br.id) AS Books_Borrowed
FROM Members m
LEFT JOIN Borrowing br ON m.id = br.member_id
GROUP BY m.name;
