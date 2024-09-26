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


SELECT Books.Title, Members.Name
FROM Borrow
INNER JOIN Books ON Borrow.BookID = Books.BookID
INNER JOIN Members ON Borrow.MemberID = Members.MemberID;


SELECT Books.Title, Borrow.BorrowID
FROM Books
LEFT JOIN Borrow ON Books.BookID = Borrow.BookID;

SELECT Members.Name, Borrow.BorrowID
FROM Members
RIGHT JOIN Borrow ON Members.MemberID = Borrow.MemberID;

SELECT Books.Title, Borrow.BorrowID
FROM Books
LEFT JOIN Borrow ON Books.BookID = Borrow.BookID
UNION
SELECT Books.Title, Borrow.BorrowID
FROM Books
RIGHT JOIN Borrow ON Books.BookID = Borrow.BookID;


SELECT M1.Name AS Member1, M2.Name AS Member2, M1.Address
FROM Members M1
INNER JOIN Members M2 ON M1.Address = M2.Address
WHERE M1.MemberID <> M2.MemberID;