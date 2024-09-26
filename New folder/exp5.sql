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
(101, '1984', 'George Orwell', 'Secker & Warburg', 1949, 'Science Fiction'),
(102, 'The Alchemist', 'Paulo Coelho', 'HarperCollins', 1988, 'Novel'),
(103, 'Theory of Everything', 'Dr. Stephen Hawking', 'Macmillan Publishers', 2002, 'Non Fiction'),
(104, "The Hitchhiker's Guide to the Galaxy", 'Douglas Addams', 'Viking', 1981, 'Science Fiction'),
(105, 'The Great Gatsby', 'Fitzgerald', 'HarperCollins', 1925, 'Novel'),
(106, 'The Da Vinci Code', 'Dan Brown', 'John Day', 2003, 'Mystery'),
(107, 'To Kill A Mockingbird', 'Harper Lee', 'HarperCollins', 1960, 'Novel'),
(108, 'Pride and Prejudice', 'Jane Austen', 'John Murray', 1813, 'Novel'),
(109, 'The Lord of the Rings', 'JRR Tolkien', 'Indian Souls', 1954, 'Fantasy'),
(110, 'Frankenstein', 'Mary Shelley', 'Macmillan Publishers', 1818, 'Science Fiction');

-- Insert sample data into Members
INSERT INTO Members VALUES
(1, 'Ashmit', 'ashmit@gmail.com', '7007007001', 'Amritsar'),
(2, 'Chitjeet', 'chijji@gmail.com', '7007007002', 'Chandigarh'),
(3, 'Jahnvi', 'jahnvi@gmail.com', '7007007003', 'Chintpurni'),
(4, 'Anisha', 'anisha@gmail.com', '7007007004', ''),
(5, 'Kirat', 'kirat@gmail.com', '7007007005', 'Amritsar'),
(6, 'Harsh', 'harsh@gmail.com', '7007007006', 'Mansa'),
(7, 'Gurleen', 'gurleen@gmail.com', '7007007007', 'Tarn Taran'),
(8, 'Anvesha', 'anvesha@gmail.com', '7007007008', 'Bahadurgarh'),
(9, 'Saiyam', 'saiyam@gmail.com', '7007007009', 'Karnal'),
(10, 'Kabir', 'kabir@gmail.com', '7007007010', 'Mohali');

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


-- Find books with titles starting with "The"
SELECT * FROM Books WHERE Title LIKE 'The%';

-- Find books written by authors whose last names contain "or"
SELECT * FROM Books WHERE Author LIKE '%or%';

-- Find members whose names have exactly four letters
SELECT * FROM Members WHERE Name LIKE '____';

-- Find books that are not in the "Novel" category
SELECT * FROM Books WHERE Category NOT LIKE 'Novel';

-- Find members whose email addresses end with ".net"
SELECT * FROM Members WHERE Email LIKE '%.net';