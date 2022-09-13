-- List of programs with paricipants' name and id
-- TTITLE CENTER 'Advanced: List of programs with paricipants\' name and id'
SELECT p.name AS Program_name, u.firstname || ' ' || u.lastname || '(' || u.userid || ')' AS participant
FROM Program p, "User" u, activityprogram a
WHERE a.userid=u.userid AND p.programid=a.id
ORDER BY u.userid;

-- List of Events with paricipants' name and id
-- TTITLE CENTER 'Advanced: List of Events with paricipants\' name and id'
SELECT e.name AS Event_name, u.firstname || ' ' || u.lastname || '(' || u.userid || ')' AS participant
FROM event e, "User" u, activityevent a
WHERE a.userid=u.userid AND e.eventid=a.id
ORDER BY u.userid;

-- List of Activities with paricipants' name and id
-- TTITLE CENTER 'Advanced: List of Activities with paricipants\' name and id'
(SELECT  'Event: ' || e.name AS activity,  u.firstname || ' ' || u.lastname || '(' || u.userid || ')' AS participant
FROM Activityevent a
LEFT JOIN event e ON e.EventID = a.ID
INNER JOIN LIBBranch l on l.libbranchid=e.locationid
INNER join "User" u on u.userid=a.userid
)
UNION
(
SELECT  'Program: ' || p.name AS activity , u.firstname || ' ' || u.lastname || '(' || u.userid || ')' AS participant
FROM Activityprogram a
LEFT JOIN Program  p ON p.Programid = a.id
INNER JOIN LIBBranch l on l.libbranchid=p.locationid
INNER join "User" u on u.userid=a.userid
)
ORDER BY activity;

-- Show the event info with location
-- TTITLE CENTER 'Advanced: Show the Event info with location'
SELECT e.name AS Event_name, e.guest, l.libbranchname as location,  s.streetno || ' ' || s.streetname || ' ' || p.city || ' ' || p.postalcode  as Address, h.hostname
FROM Event e
INNER JOIN activityevent a ON e.EventID = a.ID
INNER JOIN libbranch l ON l.libbranchid=e.locationid
INNER JOIN postalcode p ON l.libbranchpostalcode=p.postalcode
INNER JOIN streetlookup s ON s.postalcode=p.postalcode
INNER JOIN host h ON a.hostid=h.hostid;

-- Show the Program info with location
-- TTITLE CENTER 'Advanced: Show the Program info with location'
SELECT p.name AS Program_name, p.programterm, l.libbranchname as Location, h.hostname
FROM Program p
INNER JOIN Activityprogram a ON p.programid = a.id
INNER JOIN LIBBranch l on l.libbranchid=p.locationid
INNER join host h on h.hostid=a.hostid;

-- Show participants who are registered for event ID=3
-- TTITLE CENTER 'Advanced: Show participants who are registered for event ID=3'
SELECT u.firstname || ' ' || u.lastname || '(' || u.userid || ')' AS username, e.name AS event_name, e.guest, l.libbranchname
FROM Event e, activityevent a, libbranch l, "User" u
WHERE e.EventID = a.ID
AND l.libbranchid=e.locationid
AND u.userid=a.userid
AND a.ConfirmStatus = 'R'
AND e.eventid=3;

-- Show which activities user4 (userid=4) participates in.
-- TTITLE CENTER 'Advanced: Show which activities user4 (userid=4) participates in'
SELECT  'Event: ' || e.name AS activity,  u.firstname || ' ' || u.lastname || '(' || u.userid || ')' AS username
FROM Activityevent a
LEFT JOIN event e ON e.EventID = a.ID
INNER JOIN LIBBranch l on l.libbranchid=e.locationid
INNER join "User" u on u.userid=a.userid
WHERE u.userid=4
UNION
(
SELECT  'Program: ' || p.name AS activity , u.firstname || ' ' || u.lastname '(' || u.userid || ')' AS username
FROM Activityprogram a
LEFT JOIN Program  p ON p.Programid = a.id
INNER JOIN LIBBranch l on l.libbranchid=p.locationid
INNER join "User" u on u.userid=a.userid
WHERE u.userid=4
)
ORDER BY activity;

-- Host details with HostName containing "library"
-- TTITLE CENTER 'Host details with a host name containing \"library\"'
SELECT h.hostname as host_name, h.hostdescription as host_detail, e.emailaddress as email_address,ph.phonenumber as phone_number
FROM Host h
INNER JOIN Email e on e.emailid=h.emailid
INNER JOIN Phone ph on ph.phoneid=h.phoneid
WHERE LOWER(hostname) LIKE '%library%';

-- Distinct Library Branches holding an Event in alphabetical order of library name
-- TTITLE CENTER 'Distinct Library Branches holding any event'
SELECT DISTINCT l.libbranchname, l.libbranchpostalcode, ph.phonenumber
FROM LibBranch l, Event e, Phone ph
WHERE e.LocationID=l.LibBranchID and l.phoneid=ph.phoneid
ORDER BY l.libbranchname;

-- Count number of Events for each location(library branch)
-- TTITLE CENTER 'Count number of Events for each location(library branch)'
SELECT l.libbranchname, count(LocationID) AS No_of_Events
FROM LibBranch l, Event e
WHERE l.LibBranchID=e.LocationID
GROUP BY l.LibBranchName;

-- Count number of Programs for each location(library branch)
-- TTITLE CENTER 'Count number of Programs for each location(library branch)'
SELECT l.libbranchname, count(LocationID) AS No_of_Programs
FROM LibBranch l, Program p
WHERE l.LibBranchID=p.LocationID
GROUP BY l.LibBranchName;

-- List of Programs hosted by HostID=1
-- TTITLE CENTER 'List of Programs hosted by host id=1'
SELECT p.NAME, p.programterm as Term, TO_CHAR(p.Starttime,'YYYY-mm-DD hh24:mm') AS START_Time, TO_CHAR(p.endtime,'YYYY-mm-DD hh24:mm') AS END_Time, l.libbranchname as location, p.room, p.audience, h.hostname AS Host_Name, h.hostdescription as host_detail, e.emailaddress AS Email_Address, ph.phonenumber as Phone_Number
FROM Program p
INNER JOIN ActivityProgram ap ON ap.ID=p.programid
INNER JOIN Host h ON ap.hostid=h.hostid
INNER JOIN Email e ON e.emailid=h.emailid
INNER JOIN Libbranch l ON l.libbranchid=p.locationid
INNER JOIN Phone ph ON ph.phoneid=h.phoneid
WHERE h.hostid=1;

-- List of Programs for the Fall Term
-- TTITLE CENTER 'List of Programs for the Fall Term'
SELECT p.NAME, p.programterm as Term, TO_CHAR(p.Starttime,'YYYY-mm-DD hh24:mm') AS START_Time, TO_CHAR(p.endtime,'YYYY-mm-DD hh24:mm') AS END_Time, l.libbranchname as location, p.room, p.audience
FROM Program p 
INNER JOIN libbranch l ON l.libbranchid=p.locationid
WHERE p.programterm LIKE '%F';

-- List of Programs starting in January 2022
-- TTITLE CENTER 'List of Programs starting in January 2022'
SELECT p.NAME, p.programterm as Term, TO_CHAR(p.Starttime,'YYYY-mm-DD hh24:mm') AS START_Time, TO_CHAR(p.endtime,'YYYY-mm-DD hh24:mm') AS END_Time, l.libbranchname as location, p.room, p.audience
FROM Program p 
INNER JOIN libbranch l ON l.libbranchid=p.locationid
WHERE CAST(p.StartTime As DATE) > DATE '2022-01-01';

-- List of Events with Event duration during the Month of October
-- TTITLE CENTER 'List of Events with Event duration during the Month of October'
SELECT e.Name AS Event_Name,
       e.Guest,
       to_char(e.StartDateTime, 'Mon-dd') AS Day,
       to_char(e.StartDateTime,'hh24:mm') AS StartTime,       
       ltrim(substr(To_CHAR((e.EndDateTime - e.StartDateTime)*24*60),0,10),'+0') || ' minutes' AS Duration_in_Minutes
       --To_char(e.EndDateTime - e.StartDateTime,'hh:mm') AS Duration_in_HOURs
FROM Event e WHERE to_char(e.StartDateTime,'mm') = 10;

-- List of Activities, Registered
-- TTITLE CENTER 'List of Activities, Registered'
(SELECT 'Event' || ae.ID, u.firstname || ' ' || u.lastname as User_Name,h.hostname,ae.confirmstatus, To_CHAR(ae.confirmtimestamp,'YYYY-mm-DD hh24:mm') as time_Confirmed
FROM activityevent ae
INNER join "User" u on u.userid=ae.userid
INNER JOIN Host h on h.hostID=ae.hostID
WHERE NOT (ae.ConfirmStatus IN ('C','U')))
UNION
(SELECT 'Program'|| ap.ID, u.firstname || ' ' || u.lastname as User_Name,h.hostname,ap.confirmstatus, To_CHAR(ap.confirmtimestamp,'YYYY-mm-DD hh24:mm') as time_Confirmed
FROM activityprogram ap
INNER join "User" u on u.userid=ap.userid
INNER JOIN Host h on h.hostID=ap.hostID
WHERE NOT (ap.ConfirmStatus IN ('C','U')));
