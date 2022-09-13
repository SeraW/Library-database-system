-- VIEWs in views.sql

-- JobPosting: get postings where they are available until after October 16, 2021, 12:00 PM
--             (i.e., postings which expire after October 16, 2021 at 12:00 PM)
-- TTITLE CENTER 'JobPosting: get postings where they are available until after October 16, 2021, 12:00 PM'
SELECT *
FROM JobPosting
WHERE AvailableUntil > TO_DATE('2021-10-16 12:00:00', 'YYYY-MM-DD HH24:MI:SS')
ORDER BY AvailableUntil DESC;

-- JobPosting: get the number of postings that expire on each date
-- TTITLE CENTER 'JobPosting: get the number of postings that expire on each date'
SELECT TO_CHAR(AvailableUntil,'YYYY-mm-DD hh24:mm') AS Available_Until, COUNT(*)
FROM JobPosting
GROUP BY AvailableUntil
ORDER BY AvailableUntil DESC;

-- JobPosting: get the UserID with the most postings
-- TTITLE CENTER 'JobPosting: get the UserID with the most postings'
SELECT MAX(PostedBy) AS "Most Postings"
FROM JobPosting;

-- JobPosting/UserHistory: select UserID of all users who have posted a job and have also borrowed assets from the
-- library
-- TTITLE CENTER 'JobPosting/History: select UserID of all users who have posted a job and have also borrowed assets from the library'
SELECT DISTINCT PostedBy AS "UserID"
FROM JobPosting
WHERE EXISTS(
    SELECT UserID
    FROM UserHistory
)
ORDER BY PostedBy ASC;
