-- Create the Books table
CREATE TABLE Books (
    BookID int PRIMARY KEY, 
    Title varchar(100), 
    Author varchar(100), 
    Publisher varchar(50), 
    Year int,
    Category varchar(50)
);

-- Create the Members table
CREATE TABLE Members (
    MemberID int PRIMARY KEY, 
    Name varchar(100), 
    Email varchar(100), 
    Phone varchar(50), 
    Address varchar(50)
);

-- Create the Borrow table with foreign keys
CREATE TABLE Borrow (
    BorrowID int PRIMARY KEY, 
    BookID int, 
    MemberID int, 
    BorrowDate date,
    ReturnDate date,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Insert sample data into Books
INSERT INTO Books VALUES
(101, 'The Time Traveler''s Wife', 'Audrey Niffenegger', 'MacAdam/Cage', 2003, 'Science Fiction'),
(102, 'The Kite Runner', 'Khaled Hosseini', 'Riverhead Books', 2003, 'Historical Fiction'),
(103, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'Harper', 2014, 'Non-fiction'),
(104, 'The Martian', 'Andy Weir', 'Crown Publishing Group', 2011, 'Science Fiction'),
(105, 'Gone Girl', 'Gillian Flynn', 'Crown Publishing Group', 2012, 'Thriller'),
(106, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Alfred A. Knopf', 2005, 'Crime'),
(107, 'Little Women', 'Louisa May Alcott', 'Roberts Brothers', 1868, 'Coming-of-age'),
(108, 'Jane Eyre', 'Charlotte Brontë', 'Smith, Elder & Co.', 1847, 'Gothic'),
(109, 'The Name of the Wind', 'Patrick Rothfuss', 'DAW Books', 2007, 'Fantasy'),
(110, 'The Handmaid''s Tale', 'Margaret Atwood', 'McClelland and Stewart', 1985, 'Dystopian');


-- Insert sample data into Members
INSERT INTO Members VALUES
(1, 'Aryan', 'aryan@gmail.com', '8888888881', 'Ludhiana'),
(2, 'Bhavya', 'bhavya@gmail.com', '8888888882', 'Patiala'),
(3, 'Jasmine', 'jasmine@gmail.com', '8888888883', 'Jalandhar'),
(4, 'Dhruv', 'dhruv@gmail.com', '8888888884', ''),
(5, 'Ekta', 'ekta@gmail.com', '8888888885', 'Bathinda'),
(6, 'Farhan', 'farhan@gmail.com', '8888888886', 'Ferozepur'),
(7, 'Gurpreet', 'gurpreet@gmail.com', '8888888887', 'Gurdaspur'),
(8, 'Harleen', 'harleen@gmail.com', '8888888888', 'Hoshiarpur'),
(9, 'Ishaan', 'ishaan@gmail.com', '8888888889', 'Kapurthala'),
(10, 'Jatin', 'jatin@gmail.com', '8888888890', 'Moga');

-- Insert sample data into Borrow
INSERT INTO Borrow (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES
(121, 103, 1, '2024-08-01', '2024-08-15'),
(122, 104, 4, '2024-08-02', '2024-08-16'),
(123, 107, 7, '2024-08-03', '2024-08-17'),
(124, 102, 5, '2024-08-04', '2024-08-18'),
(125, 105, 2, '2024-08-05', '2024-08-19'),
(126, 101, 8, '2024-08-06', '2024-08-20'),
(127, 106, 3, '2024-08-07', '2024-08-21'),
(128, 110, 6, '2024-08-08', '2024-08-22'),
(129, 109, 10, '2024-08-09', '2024-08-23'),
(130, 108, 9, '2024-08-10', '2024-08-24');

-- List all books in the library.
SELECT * FROM Books;

-- Find the details of members who have borrowed books.
SELECT DISTINCT Members.* FROM Members JOIN Borrow ON Members.MemberID = Borrow.MemberID;

-- List all books borrowed by a specific member.
SELECT Books.* FROM Books JOIN Borrow ON Books.BookID = Borrow.BookID WHERE Borrow.MemberID = 1;

-- Find the borrow history of a specific book.
SELECT Borrow.*, Members.Name FROM Borrow JOIN Members ON Borrow.MemberID = Members.MemberID WHERE Borrow.BookID = 101;

-- Update the return date of a borrowed book.
UPDATE Borrow SET ReturnDate = '2024-08-05' WHERE BorrowID = 122;

-- Delete a member from the database.
DELETE FROM Borrow WHERE MemberID = 10;
DELETE FROM Members WHERE MemberID = 10;

-- Count the number of books in each category:
SELECT Category, COUNT(*) AS Qty FROM Books GROUP BY Category;

-- Find the details of members who have not borrowed any books:
SELECT Members.* FROM Members LEFT JOIN Borrow ON Members.MemberID = Borrow.MemberID WHERE Borrow.MemberID IS NULL;

-- List all overdue books (assuming current date is '2024-01-25')
SELECT Books.*, Borrow.ReturnDate FROM Books JOIN Borrow ON Books.BookID = Borrow.BookID WHERE Borrow.ReturnDate < "2024-01-25";