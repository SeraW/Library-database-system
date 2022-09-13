CREATE VIEW vUserFacilityBookings (FirstName, LastName, FacilityID, DurationHours) AS (
    SELECT
        u.FirstName,
        u.LastName,
        fb.BookingID,
        ((fb.TimeEnd - fb.TimeStart) * 86400 / 60) AS DurationHours
    FROM "User" u, FacilityBooking fb
    WHERE u.UserID = fb.BookedBy
);

TTITLE CENTER 'VIEW: UserFacilityBookings'
SELECT * FROM vUserFacilityBookings;


-- Activities with paricipants' name and id
CREATE VIEW vUserActivities (Activity, Participants) AS (
    (SELECT  'Event: ' || e.name AS Activity,  u.firstname || ' ' || u.lastname || '(' || u.userid || ')' AS Participants
    FROM Activityevent ae
    LEFT JOIN event e ON e.EVENTID = ae.ID
    INNER JOIN LIBBranch l on l.libbranchid=e.locationid
    INNER JOIN "User" u on u.userid=ae.userid
    )
    UNION
    (
    SELECT  'Program: ' || p.name AS activity , u.firstname || ' ' || u.lastname || '(' || u.userid || ')' AS Participants
    FROM Activityprogram ap
    LEFT JOIN Program  p ON p.Programid = ap.id
    INNER JOIN LIBBranch l on l.libbranchid=p.locationid
    INNER JOIN "User" u on u.userid=ap.userid
    )
    --ORDER BY activity
);

TTITLE CENTER 'VIEW: Activities with paricipants\' name and id'
SELECT * FROM vUserActivities;


CREATE VIEW vAssetsBorrowed (Title, DayBorrowed, DayReturned, NumDays) AS
    SELECT Title, TimeBorrowed, TimeReturn,
    TimeReturn - TimeBorrowed AS NumDays
    FROM Asset A, AssetHistory AH
    WHERE A.AssetID = AH.AssetID;

TTITLE CENTER 'VIEW: AssetsBorrowed'
SELECT * FROM vAssetsBorrowed;
