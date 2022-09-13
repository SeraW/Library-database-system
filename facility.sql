-- Facility
CREATE TABLE Facility (
    "ID" INTEGER NOT NULL PRIMARY KEY
);

--- FacilityComputer
CREATE TABLE ResourceComputer (
    ResourceComputerID INTEGER NOT NULL PRIMARY KEY,
    OS VARCHAR(32) NOT NULL
);

CREATE TABLE FacilityComputer (
    "ID" INTEGER NOT NULL REFERENCES Facility("ID") ON DELETE CASCADE,
    ResourceComputerID INTEGER NOT NULL REFERENCES ResourceComputer(ResourceComputerID) ON DELETE CASCADE,
    PRIMARY KEY ("ID")
);

--- FacilityStudyRoom
CREATE TABLE FacilityStudyRoom (
    "ID" INTEGER NOT NULL REFERENCES Facility("ID") ON DELETE CASCADE,
    RoomNumber INTEGER NOT NULL,
    PRIMARY KEY ("ID")
);

-- FacilityBooking
CREATE TABLE FacilityBooking (
    BookingID INTEGER NOT NULL PRIMARY KEY,
    BookedBy INTEGER REFERENCES "User"(UserID) ON DELETE CASCADE,
    FacilityID INTEGER REFERENCES Facility("ID") ON DELETE CASCADE
);

CREATE TABLE FacilityBookingInfo (
    BookingID INTEGER NOT NULL REFERENCES FacilityBooking(BookingID) ON DELETE CASCADE,
    TimeStart TIMESTAMP NOT NULL,
    TimeEnd TIMESTAMP NOT NULL,
    CONSTRAINT time_check CHECK (TimeStart < TimeEnd),
    PRIMARY KEY (BookingID)
);
