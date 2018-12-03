	/*************************************************
	Creation of all my tables for the Library system
	**************************************************/

	CREATE TABLE Book (
		BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		Title VARCHAR(50) NOT NULL,
		PublisherName VARCHAR(50) NOT NULL
	);

		CREATE TABLE BookAuthors (
		BookID INT NOT NULL CONSTRAINT fkBookID_Authors FOREIGN KEY REFERENCES Book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(50) NOT NULL
	);

		CREATE TABLE Publisher (
		PublisherName VARCHAR(50) NOT NULL,
		PublisherAddress VARCHAR(50) NOT NULL,
		PublisherPhone VARCHAR(50) NOT NULL	
	);
		
		CREATE TABLE BookLoans (
		BookID INT NOT NULL CONSTRAINT fkBookID_Loans FOREIGN KEY REFERENCES Book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT fkBranchID_Loans FOREIGN KEY REFERENCES LibraryBranch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo INT NOT NULL CONSTRAINT fkCardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut DATE NOT NULL,
		DueDate DATE NOT NULL
	);
		
		CREATE TABLE BookCopies (
		BookID INT NOT NULL CONSTRAINT fkBookID_Copies FOREIGN KEY REFERENCES Book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT fkBranchID_Copies FOREIGN KEY REFERENCES LibraryBranch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		Copies INT NOT NULL
	);

		CREATE TABLE Borrower (
		CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BorrowerName VARCHAR(50) NOT NULL,
		BorrowerAddress VARCHAR(50) NOT NULL,
		BorrowerPhone VARCHAR(50)
	);

		CREATE TABLE LibraryBranch (
		BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BranchName VARCHAR(50) NOT NULL,
		BranchAddress VARCHAR(50) NOT NULL,
	);

	/***************************************************
	Inserting raw information into my tables(Populating) 
	****************************************************/

		INSERT INTO Book
			(Title, PublisherName)
		VALUES 
			('Chinese Bridges','Knapp'),
			('Plants From Test Tubes','Scoggins'),
			('Mission to Mars','NatGeo'),
			('It','Viking Press'),
			('The Shining','Doubleday'),
			('Enders Game','Card'),
			('Hyperion','Doubleday'),
			('Brave New World','Utopian'),
			('Slaughterhouse-Five','Dell Publishing'),
			('Fahrenheit 451','Prometheus'),
			('Starship Troopers','GP Putnams Sons'),
			('The Martian','Goodreads'),
			('Frankenstein','Puffin'),
			('Blade Runner','Doubleday'),
			('Ready Player One','Random House'),
			('Annihilation','Doubleday'),
			('The Great Gatsby','East Egg'),
			('The Handmaids Tale','McClelland & Stewart'),
			('To Kill a Mockingbird','Pulitzer'),
			('The Fellowship of the Ring','Allen & Unwin'),
			('The Lost Tribe','Doubleday')
		;

		INSERT INTO BookAuthors
			(BookID, AuthorName)
		VALUES
			(1,'Harold Knapp'),
			(2,'Mark Bridgen'),
			(3,'Buzz Aldrin'),
			(4,'Stephen King'),
			(5,'Stephen King'),
			(6,'Orson Scott Card'),
			(7,'Dan Simmons'),
			(8,'Aldous Huxley'),
			(9,'Kurt Vonnegut'),
			(10,'Ray Bradbury'),
			(11,'Robert A. Heinlein'),
			(12,'Andy Weir'),
			(13,'Mary Shelley'),
			(14,'Phillip K. Dick'),
			(15,'Ernest Cline'),
			(16,'Jeff VanderMeer'),
			(17,'F. Scott Fitzgerald'),
			(18,'Margaret Atwood'),
			(19,'Harper Lee'),
			(20,'J. R. R. Tolkien'),
			(21, 'Jack Shephard')
		;
		
		INSERT INTO Publisher
			(PublisherName, PublisherAddress, PublisherPhone)
		VALUES
			('Knapp','2986 Stanley Avenue','516-559-4638'),
			('Scoggins','241 Filbert Street','646-612-2708'),
			('NatGeo','3691 Camden Place','610-816-8551'),
			('Viking Press','2133 Todds Lane','215-869-5083'),
			('Doubleday','2484 Evergreen Lane','845-207-5887'),
			('Card','1509 Blue Spruce Lane','919-332-7925'),
			('Utopian','4068 Bryan Street','947-882-9666'),
			('Dell Publishing','4887 Haven Lane','517-706-7049'),
			('Prometheus','546 North Street','347-380-4030'),
			('GP Putnams Sons','3106 Bird Street','210-522-2085'),
			('Goodreads','3430 Oakridge Farm Lane','210-848-1227'),
			('Puffin','2825 Camden Place','323-523-1313'),
			('Random House','2293 Brown Street','410-316-1705'),
			('East Egg','395 Cherry Ridge Drive','484-563-1073'),
			('McClelland & Stewart','2597 Eden Drive','610-291-6696'),
			('Pulitzer','4716 Oakdale Avenue','434-981-4674'),
			('Allen & Unwin','3541 Filbert Street','434-242-4849')
		;
		
		INSERT INTO BookLoans
			(BookID, BranchID, CardNo, DateOut, DueDate)
		VALUES
			(1, 1, 1, '2018-01-01', '2018-07-01'),
			(2, 2, 2, '2018-01-02', '2018-07-02'),
			(3, 3, 3, '2018-01-03', '2018-02-03'),
			(4, 4, 4, '2018-01-04', '2018-02-04'),
			(5, 1, 5, '2018-01-05', '2018-02-05'),
			(6, 2, 6, '2018-01-06', '2018-02-06'),
			(7, 3, 7, '2018-01-07', '2018-02-07'),
			(8, 4, 8, '2018-01-08', '2018-02-08'),
			(9, 1, 9, '2018-01-09', '2018-02-09'),
			(10, 2, 10, '2018-01-10', '2018-02-10'),
			(11, 3, 1, '2018-01-11', '2018-07-11'),
			(12, 4, 2, '2018-01-12', '2018-07-12'),
			(13, 1, 1, '2018-01-13', '2018-07-13'),
			(14, 2, 2, '2018-01-14', '2018-07-14'),
			(15, 3, 1, '2018-01-15', '2018-07-15'),
			(16, 4, 2, '2018-01-16', '2018-07-16'),
			(17, 1, 1, '2018-01-17', '2018-07-17'),
			(18, 2, 2, '2018-01-18', '2018-07-18'),
			(19, 3, 1, '2018-01-19', '2018-02-19'),
			(20, 4, 2, '2018-01-20', '2018-02-20'),
			(21, 1, 1, '2018-01-21', '2018-02-21'),
			(21, 2, 2, '2018-01-22', '2018-02-22'),
			(21, 3, 1, '2018-01-23', '2018-02-23'),
			(21, 4, 2, '2018-01-24', '2018-02-24'),
			(21, 1, 1, '2018-01-25', '2018-02-25'),
			(20, 2, 2, '2018-03-01', '2018-04-01'),
			(2, 2, 3, '2018-03-02', '2018-04-02'),
			(20, 2, 4, '2018-03-03', '2018-04-03'),
			(20, 3, 2, '2018-03-04', '2018-04-04'),
			(20, 4, 4, '2018-03-05', '2018-04-05'),
			(5, 1, 5, '2018-03-06', '2018-04-06'),
			(5, 2, 6, '2018-03-07', '2018-04-07'),
			(7, 3, 7, '2018-03-08', '2018-04-08'),
			(4, 4, 8, '2018-03-09', '2018-04-09'),
			(2, 1, 9, '2018-03-10', '2018-04-10'),
			(3, 1, 9, '2018-03-11', '2018-04-11'),
			(8, 2, 9, '2018-03-12', '2018-04-12'),
			(14, 3, 10, '2018-03-13', '2018-04-13'),
			(13, 4, 10, '2018-03-14', '2018-04-14'),
			(12, 4, 6, '2018-03-01', '2018-04-01'),
			(16, 4, 6, '2018-04-01', '2018-05-01'),
			(18, 1, 7, '2018-04-02', '2018-05-02'),
			(17, 2, 7, '2018-04-03', '2018-05-03'),
			(21, 3, 8, '2018-04-04', '2018-05-04'),
			(20, 4, 2, '2018-04-05', '2018-05-05'),
			(20, 4, 9, '2018-04-06', '2018-05-06'),
			(8, 1, 9, '2018-04-07', '2018-05-07'),
			(2, 2, 7, '2018-04-08', '2018-05-08'),
			(3, 3, 7, '2018-04-09', '2018-05-09'),
			(1, 4, 7, '2018-04-10', '2018-05-10')
		;
		
		INSERT INTO BookCopies 
			(BookID, BranchID, Copies)
		VALUES
			(1, 1, 2),
			(2, 1, 2),
			(3, 1, 2),
			(4, 1, 2),
			(5, 1, 2),
			(6, 1, 2),
			(7, 1, 2),
			(8, 1, 2),
			(9, 1, 2),
			(10, 1, 2),
			(11, 2, 2),
			(12, 2, 2),
			(13, 2, 2),
			(14, 2, 2),
			(15, 2, 2),
			(16, 2, 2),
			(17, 2, 2),
			(18, 2, 2),
			(19, 2, 2),
			(20, 2, 2),
			(1, 3, 2),
			(2, 3, 2),
			(3, 3, 2),
			(4, 3, 2),
			(5, 3, 2),
			(6, 3, 2),
			(7, 3, 2),
			(8, 3, 2),
			(9, 3, 2),
			(10, 3, 2),
			(11, 4, 2),
			(12, 4, 2),
			(13, 4, 2),
			(14, 4, 2),
			(15, 4, 2),
			(16, 4, 2),
			(17, 4, 2),
			(18, 4, 2),
			(19, 4, 2),
			(20, 4, 2),
			(21, 4, 2)
		;

		INSERT INTO Borrower
			(BorrowerName, BorrowerAddress, BorrowerPhone)
		VALUES
			('Nellie S. Hamilton', '2489 Tree Top Lane', '610-228-2897'),
			('Emma E. Howard', '4721 Shobe Lane', '720-556-5706'),
			('Jennifer C. Tang', '981 Harter Street', '937-657-2539'),
			('Dustin E. Scott', '2853 Mount Tabor',' 914-497-4063'),
			('Terry J. Whorton', '3472 Delaware Avenue', '415-346-7662'),
			('William J. Hall', '4419 Cantebury Drive', '646-684-1630'),
			('Modesto A. Wilkes', '1777 Gnatty Creek Road', '516-351-0194'),
			('Bertha J. Lovelady', '3162 Lowes Alley', '740-248-9911'),
			('Vada W. Robertson', '3357 Baker Avenue', '817-853-8593'),
			('Connie A. Anders', '4015 Waterview Lane', '505-456-4447')
		;
		
		INSERT INTO LibraryBranch
			(BranchName, BranchAddress)
		VALUES
			('Central', '1976 Patterson Street'),
			('Fort Vancouver', '616 Mapleview Drive'),
			('Downtown', '2983 Hall Valley Drive'),
			('Sharpstown', '3978 Camden Place')
		;
		
	/******************************
	 Queries for Stored Procedures
	 ******************************/
GO
	 ALTER PROC spFirstProc
	 AS
		SELECT Book.Title, LibraryBranch.BranchName, BookCopies.Copies
			FROM BookCopies
			INNER JOIN Book ON BookCopies.BookID = Book.BookID
			INNER JOIN LibraryBranch ON BookCopies.BranchID = LibraryBranch.BranchID
			WHERE Book.Title = 'The Lost Tribe' 
			AND LibraryBranch.BranchName = 'Sharpstown' 
GO

GO
	ALTER PROC spSecondProc
	AS
		SELECT Book.Title, LibraryBranch.BranchName, BookCopies.Copies
			FROM BookCopies
			INNER JOIN Book ON BookCopies.BookID = Book.BookID
			INNER JOIN LibraryBranch ON BookCopies.BranchID = LibraryBranch.BranchID
			WHERE Book.Title = 'The Lost Tribe' 
GO

GO
	ALTER PROC spThirdProc
	AS 
		SELECT BorrowerName, BookLoans.DateOut, BookLoans.DueDate 
		FROM BookLoans
		INNER JOIN Borrower ON BookLoans.CardNo = Borrower.CardNo
		WHERE BookLoans.DueDate < '2018-06-15'
GO 
			
GO
	ALTER PROC spFourthProc
	AS 
		SELECT 	Book.Title, Borrower.BorrowerName, Borrower.BorrowerAddress, LibraryBranch.BranchName
			FROM BookLoans
			INNER JOIN Book ON BookLoans.BookID = Book.BookID 
			INNER JOIN Borrower ON BookLoans.CardNo = Borrower.CardNo
			INNER JOIN LibraryBranch ON BookLoans.BranchID = LibraryBranch.BranchID
			WHERE DueDate = '2018-05-10' AND BranchName = 'Sharpstown'
GO 

GO 
	ALTER PROC spFifthProc 
	AS 
		SELECT LibraryBranch.BranchName
			FROM BookCopies
			
			
GO

GO
	CREATE PROC spSixthProc
	AS
		SELECT Borrower.BorrowerName, Borrower.BorrowerAddress
			FROM BookLoans
			INNER JOIN Borrower ON BookLoans.CardNo = Borrower.CardNo
			
GO

GO
	ALTER PROC spSeventhProc 
	AS
		SELECT Book.Title, BookAuthors.AuthorName, BookCopies.Copies, LibraryBranch.BranchName
		FROM BookCopies
		INNER JOIN Book ON BookCopies.BookID = Book.BookID
		INNER JOIN LibraryBranch ON BookCopies.BranchID = LibraryBranch.BranchID
		INNER JOIN BookAuthors ON Book.BookID = BookAuthors.BookID 
		WHERE BookAuthors.AuthorName = 'Stephen King'
		AND LibraryBranch.BranchName = 'Central' 
GO