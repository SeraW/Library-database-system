-- Role
INSERT INTO ROLE (RoleID, RoleName) VALUES (1, 'Library Member');
INSERT INTO ROLE (RoleID, RoleName) VALUES (2, 'Librarian');

-- Address
INSERT INTO Address (Postal, Street) VALUES ('1h28y6', 'streetname');
INSERT INTO Address (Postal, Street) VALUES ('u8l0w2', 'fish');
INSERT INTO Address (Postal, Street) VALUES ('w0b6r2', 'park');
INSERT INTO Address (Postal, Street) VALUES ('g0b6r6', 'avenue');
INSERT INTO Address (Postal, Street) VALUES ('y3b1g6', 'redcar');
INSERT INTO Address (Postal, Street) VALUES ('h2bfg9', 'yonge');

--Email
INSERT INTO  Email (EmailID, EmailAddress) VALUES (1,'jkim@gmail.com');
INSERT INTO  Email (EmailID, EmailAddress) VALUES (2,'spius@gmail.com');
INSERT INTO  Email (EmailID, EmailAddress) VALUES (3,'swong@gmail.com');
INSERT INTO  Email (EmailID, EmailAddress) VALUES (4,'dchan@gmail.com');
INSERT INTO  Email (EmailID, EmailAddress) VALUES (5,'klau@gmail.com');
INSERT INTO  Email (EmailID, EmailAddress) VALUES (6,'Nkwong@gmail.com');
INSERT INTO  Email (EmailID, EmailAddress) VALUES (7,'admin@library.ca');
INSERT INTO  Email (EmailID, EmailAddress) VALUES (8,'admin@ibby.org');
INSERT INTO  Email (EmailID, EmailAddress) VALUES (9,'merrilcollection@library.ca');
INSERT INTO  Email (EmailID, EmailAddress) VALUES (10,'appelsalon@library.ca');
INSERT INTO  Email (EmailID, EmailAddress) VALUES (11,'artexhibits@library.ca');

-- User
INSERT INTO "User" (UserID, FirstName, LastName, PhoneNum, StreetNum, Postal, EmailID, RoleID)
VALUES (0000, 'Jee Soo','Kim', '000-000-0000', 12, '1h28y6', 1, 2);
INSERT INTO "User" (UserID, FirstName, LastName, PhoneNum, StreetNum, Postal, EmailID, RoleID)
VALUES (0001, 'Sulaxan', 'Pius', '123-000-0000', 19, 'u8l0w2',2, 2);
INSERT INTO "User" (UserID, FirstName, LastName, PhoneNum, StreetNum, Postal, EmailID, RoleID)
VALUES (0002, 'Sera', 'Wong', '123-456-0000', 9, 'w0b6r2',3, 2);
INSERT INTO "User" (UserID, FirstName, LastName, PhoneNum, StreetNum, Postal, EmailID, RoleID)
VALUES (0003, 'Donald', 'Chan', '123-456-7890', 102, 'g0b6r6', 4, 1);
INSERT INTO "User" (UserID, FirstName, LastName, PhoneNum, StreetNum, Postal, EmailID, RoleID)
VALUES (0004, 'Kiarra', 'Lau', '000-456-7890', 15, 'y3b1g6', 5, 1);
INSERT INTO "User" (UserID, FirstName, LastName, PhoneNum, StreetNum, Postal, EmailID, RoleID)
VALUES (0005, 'Nick', 'Kwong', '000-000-7890', 72, 'h2bfg9', 6, 1);

-- UserStatus
INSERT INTO UserStatus (UStatusID, StatusDescript) VALUES (1, 'Active');
INSERT INTO UserStatus (UStatusID, StatusDescript) VALUES (2, 'Inactive');
INSERT INTO UserStatus (UStatusID, StatusDescript) VALUES (3, 'Expired');

-- UserLibraryMember
INSERT INTO UserLibraryMember(UserID, CardNumber, UStatusID) VALUES (0003,12345, 1);
INSERT INTO UserLibraryMember(UserID, CardNumber, UStatusID) VALUES (0004, 12346, 2);
INSERT INTO UserLibraryMember(UserID, CardNumber, UStatusID) VALUES (0005, 12347, 3);

-- UserLibrarian
INSERT INTO UserLibrarian(UserID) VALUES (0000);
INSERT INTO UserLibrarian(UserID) VALUES (0001);
INSERT INTO UserLibrarian(UserID) VALUES (0002);


-- AssetStatus
INSERT INTO AssetStatus(AssetStatID, ADescription) VALUES ('A', 'Available');
INSERT INTO AssetStatus(AssetStatID, ADescription) VALUES ('H', 'On Hold');
INSERT INTO AssetStatus(AssetStatID, ADescription) VALUES ('U', 'Unavailable');

-- Genre
INSERT INTO Genre(GenreID, GDescription) VALUES (1, 'Tech');
INSERT INTO Genre(GenreID, GDescription) VALUES (2, 'History');
INSERT INTO Genre(GenreID, GDescription) VALUES (3, 'Music');

-- Asset
INSERT INTO Asset(AssetID, AssetStatID, Title, Author, GenreID, Publisher, CoverImage, Copies)
VALUES (0001,'A', 'The Bible', 'Jesus', 1, NULL, NULL, NULL);
INSERT INTO Asset(AssetID, AssetStatID, Title, Author, GenreID, Publisher, CoverImage, Copies)
VALUES (0002,'H', 'Batman', 'Nolan', 2, NULL, NULL, NULL);
INSERT INTO Asset(AssetID, AssetStatID, Title, Author, GenreID, Publisher, CoverImage, Copies)
VALUES (0003,'U', 'Sql for dummies', 'author', 2, NULL, NULL, NULL);
INSERT INTO Asset(AssetID, AssetStatID, Title, Author, GenreID, Publisher, CoverImage, Copies)
VALUES (0004,'A', 'Planet Earth', 'director', 3, NULL, NULL, NULL);
INSERT INTO Asset(AssetID, AssetStatID, Title, Author, GenreID, Publisher, CoverImage, Copies)
VALUES (0005,'U', 'Comic book', 'okokok', 3, NULL, NULL, NULL);
INSERT INTO Asset(AssetID, AssetStatID, Title, Author, GenreID, Publisher, CoverImage, Copies)
VALUES (0006,'U', 'Numb', 'Linkin park', 3, NULL, NULL, NULL);

-- UserHistory
INSERT INTO UserHistory(UserHistoryID, UserID, AssetID) VALUES (0001,0003,0005);
INSERT INTO UserHistory(UserHistoryID, UserID, AssetID) VALUES (0002,0003,0006);

-- AssetHistory
INSERT INTO AssetHistory(AssetHistoryID, AssetID, TimeBorrowed, TimeReturn) VALUES (0000,0003, TO_DATE('2021-10-06', 'YYYY-MM-DD'), TO_DATE('2021-11-06', 'YYYY-MM-DD'));
INSERT INTO AssetHistory(AssetHistoryID, AssetID, TimeBorrowed, TimeReturn) VALUES (0001,0006, TO_DATE('2021-9-06', 'YYYY-MM-DD'), TO_DATE('2021-10-06', 'YYYY-MM-DD'));
INSERT INTO AssetHistory(AssetHistoryID, AssetID, TimeBorrowed, TimeReturn) VALUES (0002,0005, TO_DATE('2021-10-08', 'YYYY-MM-DD'), TO_DATE('2021-11-08', 'YYYY-MM-DD'));

--AssetRoLe
INSERT INTO AssetRoLe(ARoleID, ARoleDescription)VALUES(1,'Physical');
INSERT INTO AssetRoLe(ARoleID, ARoleDescription)VALUES(2,'Digital');

--PhysicalAsset
INSERT INTO PhysicalAsset(AssetID, ARoleID) VALUES (0001, 1);
INSERT INTO PhysicalAsset(AssetID, ARoleID) VALUES (0002, 1);
INSERT INTO PhysicalAsset(AssetID, ARoleID) VALUES (0003, 1);

--PhysBook
INSERT INTO PhysBook (AssetID, ISBN) VALUES (0001,'123-123-1232');

--PhysDVD
INSERT INTO PhysDVD(AssetID) VALUES (0002);

--PhysCD
INSERT INTO PhysCD(AssetID, CDDB1) VALUES (0003, '12qd-2321');

--DigitalAsset
INSERT INTO DigitalAsset(AssetID, ARoleID) VALUES (0004, 2);
INSERT INTO DigitalAsset(AssetID, ARoleID) VALUES (0005, 2);
INSERT INTO DigitalAsset(AssetID, ARoleID) VALUES (0006, 2);

--DigiBook
INSERT INTO DigiBook (AssetID, DigiISBN) VALUES (0004, '142-124-2353');

--DigiDVD
INSERT INTO DigiDVD (AssetID) VALUES (0005);

--DigiCD
INSERT INTO DigiCD(AssetID, DigiCDDB1) VALUES(0006,'243-234-2342');

--Phone
INSERT INTO  Phone (PhoneID, PhoneNumber) VALUES (1,'1-800-123-4567');
INSERT INTO  Phone (PhoneID, PhoneNumber) VALUES (2,'416-393-7748');
INSERT INTO  Phone (PhoneID, PhoneNumber) VALUES (3,'416-123-4567');
INSERT INTO  Phone (PhoneID, PhoneNumber) VALUES (4,'416-103-4567');
INSERT INTO  Phone (PhoneID, PhoneNumber) VALUES (5,'416-113-4567');
INSERT INTO  Phone (PhoneID, PhoneNumber) VALUES (6,'416-133-4567');

-- Host
INSERT INTO Host (HostID, HostName, HostDescription, EmailID, PhoneID) VALUES (1,'Library','Library Activity commitee hosts many of useful programs and events for public.', 7,1);
INSERT INTO Host (HostID, HostName, HostDescription, EmailID, PhoneID) VALUES (2,'IBBY', 'The International Board on Books for Young People',8,'' );
INSERT INTO Host (HostID, HostName, HostDescription, EmailID, PhoneID) VALUES (3,'the Merril Collection', 'the Merril Collection of Science Fiction, Speculation and Fantasy',9,2);
INSERT INTO Host (HostID, HostName, HostDescription, EmailID, PhoneID) VALUES (4,'The Appel Salon', 'The Appel Salon hosts local and international authors in conversation about their new books and big ideas.', 10,1);
INSERT INTO Host (HostID, HostName, HostDescription, EmailID, PhoneID) VALUES (5,'the Art Exhibits', 'Art exhibits reflect the diverse cultural interests of the City and its neighbourhoods',11,1);

-- PostalCode
INSERT INTO PostalCode(PostalCode,StreetName,City) VALUES ('M1A 0P1','Yonge Street','Toronto');
INSERT INTO PostalCode(PostalCode,StreetName,City) VALUES ('M2G 1K3','Davenport Street','Toronto');
INSERT INTO PostalCode(PostalCode,StreetName,City) VALUES ('M1A 0S2','Avenue Road','Toronto');
INSERT INTO PostalCode(PostalCode,StreetName,City) VALUES ('M1A 0A1','Lakeshore Road','Toronto');

-- StreetLookup
INSERT INTO StreetLookup(StreetNo,StreetName,PostalCode) VALUES ('100','Yonge Street','M1A 0P1');
INSERT INTO StreetLookup(StreetNo,StreetName,PostalCode) VALUES ('10','Davenport Street','M2G 1K3');
INSERT INTO StreetLookup(StreetNo,StreetName,PostalCode) VALUES ('1100','Avenue Road','M1A 0S2');
INSERT INTO StreetLookup(StreetNo,StreetName,PostalCode) VALUES ('5','Lakeshore Road','M1A 0A1');

-- LibBranch
INSERT INTO LibBranch (LibBranchID,LibBranchName,LibBranchPostalCode,PhoneID)
VALUES (1, 'Central Library','M1A 0P1',3);
INSERT INTO LibBranch (LibBranchID,LibBranchName,LibBranchPostalCode,PhoneID)
VALUES (2, 'Davenport Library','M2G 1K3',4);
INSERT INTO LibBranch (LibBranchID,LibBranchName,LibBranchPostalCode,PhoneID)
VALUES (3, 'Avenue Library','M1A 0S2',5);
INSERT INTO LibBranch (LibBranchID,LibBranchName,LibBranchPostalCode,PhoneID)
VALUES (4, 'Waterfront Library','M1A 0A1',6);

--INSERT INTO LibBranch (LibBranchID,LibBranchName,LibBranchStreetNo,LibBranchStreetName,LibBranchCity,LibBranchPostalCode,PhoneID)
--VALUES (1, 'Central Library','100','Yonge Street', 'Toronto','M1A 0P1',3);
--INSERT INTO LibBranch (LibBranchID,LibBranchName,LibBranchStreetNo,LibBranchStreetName,LibBranchCity,LibBranchPostalCode,PhoneID)
--VALUES (2, 'Davenport Library','10','Davenport Street', 'Toronto','M2G 1K3',4);
--INSERT INTO LibBranch (LibBranchID,LibBranchName,LibBranchStreetNo,LibBranchStreetName,LibBranchCity,LibBranchPostalCode,PhoneID)
--VALUES (3, 'Avenue Library','1100','Avenue Road', 'Toronto','M1A 0S2',5);
--INSERT INTO LibBranch (LibBranchID,LibBranchName,LibBranchStreetNo,LibBranchStreetName,LibBranchCity,LibBranchPostalCode,PhoneID)
--VALUES (4, 'Waterfront Library','5','Lakeshore Road', 'Toronto','M1A 0A1',6);

-- Event
INSERT INTO Event (EventID,Name,Guest,StartDateTime,EndDateTime,LocationID)
VALUES (1, 'John Harrison: A Calling','John Harrison', TO_TIMESTAMP('2021-10-07 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-07 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Event (EventID,Name,Guest,StartDateTime,EndDateTime,LocationID)
VALUES (2, 'How Democracies Degenerate','Charles Taylor', TO_TIMESTAMP('2021-10-07 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-07 19:30:00', 'YYYY-MM-DD HH24:MI:SS'),2);
INSERT INTO Event (EventID,Name,Guest,StartDateTime,EndDateTime,LocationID)
VALUES (3, 'Free Speech, Democracy and Big Tech','Jenny Pink', TO_TIMESTAMP('2021-10-08 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-08 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
INSERT INTO Event (EventID,Name,Guest,StartDateTime,EndDateTime,LocationID)
VALUES (4, 'Environmentalist in Residence: Urban Food','John Harrison', TO_TIMESTAMP('2021-10-09 18:00:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-09 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Event (EventID,Name,Guest,StartDateTime,EndDateTime,LocationID)
VALUES (5, 'Illustrator in Residence: Journey to Becoming an Illustrator','Suzie Kay', TO_TIMESTAMP('2021-10-09 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2);

-- Program
INSERT INTO Program (ProgramID,Name,ProgramTerm,StartTime,EndTime,LocationID)
VALUES (1, 'Introduction to Digital Ilusttration','F', TO_TIMESTAMP('2021-10-15 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-12-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'),1);
INSERT INTO Program (ProgramID,Name,ProgramTerm,StartTime,EndTime,LocationID)
VALUES (2, 'Computer Literacy', 'F', TO_TIMESTAMP('2022-01-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-04-15 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3);


-- ActivityEvent
INSERT INTO ActivityEvent (ID,UserID,HostID,ConfirmStatus,ConfirmTimestamp) VALUES (1, 1, 1,'R', TO_TIMESTAMP('2021-09-28 13:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ActivityEvent (ID,UserID,HostID,ConfirmStatus,ConfirmTimestamp) VALUES (2, 3, 2,'R', TO_TIMESTAMP('2021-10-01 09:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ActivityEvent (ID,UserID,HostID,ConfirmStatus,ConfirmTimestamp) VALUES (3, 3, 4,'R', TO_TIMESTAMP('2021-10-01 09:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ActivityEvent (ID,UserID,HostID,ConfirmStatus,ConfirmTimestamp) VALUES (4, 4, 5,'R', TO_TIMESTAMP('2021-10-01 09:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ActivityEvent (ID,UserID,HostID,ConfirmStatus,ConfirmTimestamp) VALUES (5, 4, 3,'R', TO_TIMESTAMP('2021-10-01 09:05:00', 'YYYY-MM-DD HH24:MI:SS'));

-- ActivityProgram
INSERT INTO ActivityProgram (ID,UserID,HostID,ConfirmStatus,ConfirmTimestamp) VALUES (1, 5, 1,'R', TO_TIMESTAMP('2021-10-01 09:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ActivityProgram (ID,UserID,HostID,ConfirmStatus,ConfirmTimestamp) VALUES (2, 5, 1,'R', TO_TIMESTAMP('2021-10-01 09:05:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Facility
INSERT INTO Facility VALUES(1);
INSERT INTO Facility VALUES(2);
INSERT INTO Facility VALUES(3);
INSERT INTO Facility VALUES(4);
INSERT INTO Facility VALUES(5);
INSERT INTO Facility VALUES(6);

INSERT INTO ResourceComputer VALUES(1, 'Windows');
INSERT INTO ResourceComputer VALUES(2, 'macOS');
INSERT INTO ResourceComputer VALUES(3, 'Linux');

INSERT INTO FacilityComputer VALUES(1, 1);
INSERT INTO FacilityComputer VALUES(2, 2);
INSERT INTO FacilityComputer VALUES(3, 3);

INSERT INTO FacilityStudyRoom VALUES(4, 1);
INSERT INTO FacilityStudyRoom VALUES(5, 2);
INSERT INTO FacilityStudyRoom VALUES(6, 3);

-- FacilityBooking
INSERT INTO FacilityBooking VALUES(1, 0, 1);
INSERT INTO FacilityBooking VALUES(2, 2, 2);
INSERT INTO FacilityBooking VALUES(3, 3, 1);
INSERT INTO FacilityBooking VALUES(4, 1, 4);
INSERT INTO FacilityBooking VALUES(5, 4, 3);
INSERT INTO FacilityBooking VALUES(6, 5, 6);

-- FacilityBookingInfo
INSERT INTO FacilityBookingInfo VALUES(
       1,
       TO_TIMESTAMP('2021-10-06 17:00:00', 'YYYY-MM-DD HH24:MI:SS'),
       TO_TIMESTAMP('2021-10-06 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO FacilityBookingInfo VALUES(
        2,
        TO_TIMESTAMP('2021-10-06 16:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2021-10-06 17:00:00', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO FacilityBookingInfo VALUES(
        3,
        TO_TIMESTAMP('2021-10-06 15:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2021-10-06 16:00:00', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO FacilityBookingInfo VALUES(
        4,
        TO_TIMESTAMP('2021-10-07 17:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2021-10-07 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO FacilityBookingInfo VALUES(
        5,
        TO_TIMESTAMP('2021-10-06 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2021-10-06 15:00:00', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO FacilityBookingInfo VALUES(
        6,
        TO_TIMESTAMP('2021-10-06 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2021-10-06 15:00:00', 'YYYY-MM-DD HH24:MI:SS')
);


-- JobPosting
INSERT INTO JobPosting VALUES(0, 3, 0, TO_TIMESTAMP('2021-10-06 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-13 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'job1', 'desc', 'apply.com');
INSERT INTO JobPosting VALUES(1, 4, 1, TO_TIMESTAMP('2021-10-07 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-14 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'job2', 'desc', 'apply.com');
INSERT INTO JobPosting VALUES(2, 5, 2, TO_TIMESTAMP('2021-10-08 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'job3', 'desc', 'apply.com');
INSERT INTO JobPosting VALUES(3, 3, 2, TO_TIMESTAMP('2021-10-09 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-16 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'job4', 'desc', 'apply.com');
INSERT INTO JobPosting VALUES(4, 4, 1, TO_TIMESTAMP('2021-10-10 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-17 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'job5', 'desc', 'apply.com');
INSERT INTO JobPosting VALUES(5, 5, 0, TO_TIMESTAMP('2021-10-11 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-18 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'job6', 'desc', 'apply.com');
INSERT INTO JobPosting VALUES(6, 5, 0, TO_TIMESTAMP('2021-10-12 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-18 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'job6', 'desc', 'apply.com');
