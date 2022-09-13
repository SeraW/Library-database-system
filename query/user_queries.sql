-- VIEWs in views.sql
-- advanced queries

-- Select Users, along with their role, ordered by postal code
-- TTITLE CENTER 'Advanced: Select Users, along with their role, ordered by postal code'
SELECT FirstName || ' ' || LastName AS "USER", RoleName, Postal
FROM "User" U, Role R
WHERE U.RoleID = R.RoleID
ORDER BY Postal;

-- Select users where the phone number starts with 000 and also has roleID 2
-- TTITLE CENTER 'Advanced: Select users where the phone number starts with 000 and also has roleID 2'
SELECT FirstName || ' ' || LastName AS Name, u.PhoneNum, u.RoleID
FROM "User" u
WHERE EXISTS
    (SELECT *
    FROM "User" u2
    WHERE u2.PhoneNum LIKE '000%'
    AND u2.RoleID = 2
    AND u.UserID = u2.UserID);

-- Count the number of library members that are active, expired, and inactive
-- TTITLE CENTER 'Advanced: Count the number of library members that are active, expired, and inactive'
SELECT UL.UStatusID AS StatusID, US.StatusDescript, COUNT(UL.UStatusID) AS Number_of_Members
FROM UserLibraryMember UL, UserStatus US
WHERE US.UStatusID = UL.UStatusID
GROUP BY UL.UStatusID, US.statusdescript;

-- Select the title and first name of users and assets who have a user history
-- TTITLE CENTER 'Advanced: Select the title and first name of users and assets who have a user history'
SELECT FirstName, Title, Author
FROM "User" U, Asset A, UserHistory UH
WHERE UH.UserID = U.UserID
AND A.AssetID = UH.AssetID;


--- Select everything from role
-- TTITLE CENTER 'Select everything from role'
SELECT * FROM Role;

--- Select users that have first name Jee Soo
--- TTITLE CENTER 'Select users that have first name Jee Soo'
SELECT * FROM "User" WHERE FirstName = 'Jee Soo';

--- Select all from UserStatus
-- TTITLE CENTER 'Select all from UserStatus'
SELECT * FROM UserStatus;

--- Select card number and userID, order by card number descending
-- TTITLE CENTER 'Select card number and userID, order by card number descending'
SELECT CardNumber, userID FROM UserLibraryMember ORDER BY userID DESC;

--- Select all where userID is above 1
-- TTITLE CENTER 'Select all where userID is above 1'
SELECT * FROM userLibrarian WHERE UserID>1;

--- Select userID and AssetID where UserID is not 1
-- TTITLE CENTER 'Select userID and AssetID where UserID is not 1'
SELECT UserID, AssetID FROM UserHistory WHERE UserID <> 1;

--- Select users whose first name starts with S or where the street number is between 10 and 20
-- TTITLE CENTER 'Select users whose first name starts with S or where the street number is between 10 and 20'
SELECT FirstName, StreetNum
FROM "User"
WHERE FirstName LIKE 'S%' OR StreetNum BETWEEN 10 AND 20;
