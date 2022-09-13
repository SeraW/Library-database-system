CREATE TABLE JobPosting (
    JobID INTEGER PRIMARY KEY,
    PostedBy INTEGER REFERENCES "User"(UserId) ON DELETE CASCADE,
    ApprovedBy INTEGER REFERENCES "User"(UserId) ON DELETE CASCADE,
    PostedOn TIMESTAMP NOT NULL,
    AvailableUntil TIMESTAMP NOT NULL,
    JobTitle NVARCHAR2(32) NOT NULL,
    JobDescription NVARCHAR2(256),
    ApplyDetails NVARCHAR2(256) NOT NULL
);