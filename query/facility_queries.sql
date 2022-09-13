-- VIEWs in views.sql


-- Facility: get the number of facilities
-- TTITLE CENTER 'Facility: get the number of facilities'
SELECT 'Number of facilities', COUNT("ID") FROM Facility;

--- ResourceComputer
-- TTITLE CENTER 'FacilityComputer'
SELECT OS FROM ResourceComputer ORDER BY OS DESC;

--- FacilityStudentRoom
-- TTITLE CENTER 'FacilityStudentRoom'
SELECT RoomNumber FROM FacilityStudyRoom ORDER BY RoomNumber;


-- MULTI TABLE QUERIES (JOINs)

--- FacilityBooking: select the name facility id, computer number, and os of all computer bookings
-- TTITLE CENTER 'FacilityBooking: select the name facility id, computer number, and os of all computer bookings'
SELECT u.FirstName, fb.FacilityID, fc.ResourceComputerID, rc.OS
FROM "User" u, FacilityBooking fb, ResourceComputer rc, FacilityComputer fc
WHERE u.UserID = fb.BookedBy AND fb.FacilityID = fc.ID AND fc.ResourceComputerID = rc.ResourceComputerID;

-- Get who booked FacilityID=1
-- TTITLE CENTER 'Get who booked FacilityID=1'
SELECT u.FirstName
FROM Facility f
INNER JOIN FacilityBooking fb ON f.ID = fb.FacilityID
INNER JOIN "User" u ON u.UserID=fb.BookedBy WHERE f.ID = 1;

-- Get the number of facilities in each facility type (Computer and Study Room)
-- TTITLE CENTER 'Get the number of facilities in each facility type (Computer and Study Room)'
SELECT
       (SELECT COUNT(*) FROM FacilityComputer) AS "Computer Count",
       (SELECT COUNT(*) FROM FacilityStudyRoom) AS "Study Room Count"
FROM dual; -- dual is a special table you can use if the FROM part isn't really required for your query
           -- (i.e., all logic in SELECT)

-- TTITLE CENTER 'Get start date from the FacilityBookingInfo table'
SELECT (TO_CHAR(TimeStart, 'YYYY-mm-DD')) FROM FacilityBookingInfo;

-- Get the number of bookings on each day
-- TTITLE CENTER 'Get the number of bookings on each day'
SELECT TimeStartDate, COUNT(*) AS Bookings
FROM (
    SELECT (TO_CHAR(TimeStart, 'YYYY-mm-DD')) AS TimeStartDate
    FROM FacilityBookingInfo
)
GROUP BY TimeStartDate
ORDER BY Bookings DESC;

-- Get FacilityID of all Windows computer and all study rooms
(
    SELECT fc."ID"
    FROM ResourceComputer rc, FacilityComputer fc
    WHERE rc.ResourceComputerID = fc.ResourceComputerID AND rc.OS = 'Windows'
)
UNION
(
    SELECT "ID"
    FROM FacilityStudyRoom
);
