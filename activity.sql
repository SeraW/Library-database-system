

CREATE TABLE Phone (
    PhoneID INTEGER PRIMARY KEY,
    PhoneNumber VARCHAR2(50) UNIQUE NOT NULL
);

----------------------------------------------------------------------------------

CREATE TABLE Host (
    HostID INTEGER PRIMARY KEY,
    HostName VARCHAR2(200) NOT NULL,
    HostDescription VARCHAR2(1000) DEFAULT NULL,
    EmailID INTEGER REFERENCES Email(EmailID) ON DELETE CASCADE,
    PhoneID INTEGER REFERENCES Phone(PhoneID) ON DELETE CASCADE
);

-----------------------------------------------------------------------------------
CREATE TABLE PostalCode (
    PostalCode VARCHAR2(10) NOT NULL PRIMARY KEY,
    StreetName VARCHAR2(50) DEFAULT NULL,
    City VARCHAR2(20) DEFAULT NULL
);

-----------------------------------------------------------------------------------
CREATE TABLE StreetLookup (
    StreetNo VARCHAR2(10),  
    StreetName VARCHAR2(50),    
    PostalCode VARCHAR2(10) NOT NULL REFERENCES PostalCode(PostalCode) ON DELETE CASCADE,
    PRIMARY KEY (StreetNo,StreetName)
);

-----------------------------------------------------------------------------------
CREATE TABLE LibBranch (
    LibBranchID INTEGER PRIMARY KEY,
    LibBranchName VARCHAR2(50) NOT NULL,        
    LibBranchPostalCode VARCHAR2(10) NOT NULL REFERENCES PostalCode(PostalCode) ON DELETE CASCADE,
    PhoneID INTEGER REFERENCES Phone(PhoneID) ON DELETE CASCADE
);

-----------------------------------------------------------------------------------

CREATE TABLE Event (
    EventID INTEGER PRIMARY KEY,
    Name VARCHAR2(200) NOT NULL,
    Guest VARCHAR2(100) DEFAULT NULL,
    StartDateTime TIMESTAMP(2) DEFAULT NULL,
    EndDateTime TIMESTAMP(2) DEFAULT NULL,
    LocationID INTEGER REFERENCES LibBranch(LibBranchID) ON DELETE CASCADE,
    Room VARCHAR2(50) DEFAULT 'TBD',
    Audience VARCHAR2(30) DEFAULT 'All ages'
);

-----------------------------------------------------------------------------------

CREATE TABLE Program (
    ProgramID INTEGER PRIMARY KEY,
    Name VARCHAR2(200) DEFAULT '' NOT NULL,
    ProgramTerm VARCHAR(2),
    StartTime TIMESTAMP(2) DEFAULT NULL,
    EndTime TIMESTAMP(2) DEFAULT NULL,
    LocationID INTEGER REFERENCES LibBranch(LibBranchID) ON DELETE CASCADE,
    Room VARCHAR2(50) DEFAULT 'TBD',
    Audience VARCHAR2(30) DEFAULT 'All ages'
);

---------------------------------------------------------------------------------
CREATE TABLE ActivityEvent (
    ID INTEGER NOT NULL REFERENCES Event(EventID) ON DELETE CASCADE,
    UserID INTEGER REFERENCES "User"(UserID) ON DELETE CASCADE,
    HostID INTEGER REFERENCES Host(HostID) ON DELETE CASCADE,   
    ConfirmStatus CHAR(2) ,
    ConfirmTimestamp TIMESTAMP(2) Not NULL,
    PRIMARY KEY ("ID")
);

---------------------------------------------------------------------------------
CREATE TABLE ActivityProgram (    
    ID INTEGER REFERENCES Program(ProgramID) ON DELETE CASCADE,
    UserID INTEGER REFERENCES "User"(UserID) ON DELETE CASCADE,
    HostID INTEGER REFERENCES Host(HostID) ON DELETE CASCADE,
    ConfirmStatus CHAR(2) ,
    ConfirmTimestamp TIMESTAMP(2) Not NULL,
    PRIMARY KEY ("ID")
);
---------------------------------------------------------------------------------
