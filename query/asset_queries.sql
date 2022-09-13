--VIEWs in views.sql
-- advanced queries

-- Group the number of assets that are on hold, available, unavailable and count how many are in each category
-- Include only those that have more than 1
-- TTITLE CENTER 'Advanced: Group the number of assets that are on hold, available, unavailable and display categories over 1'
SELECT ADescription AS Asset_Status, A.AssetStatID AS ID, COUNT(A.AssetStatID) AS Num_Assets
FROM AssetStatus AST, Asset A
WHERE A.AssetStatID = AST.AssetStatID
GROUP BY ADescription, A.AssetStatID
HAVING COUNT(A.AssetStatID) > 1
ORDER BY Num_Assets DESC;

-- Select the assets in Asset History that have been borrowed after Oct 1st 2021
-- TTITLE CENTER 'Advanced: Select the assets in Asset History that have been borrowed after Oct 1st 2021'
SELECT Title, Author, A.AssetID
FROM Asset A, AssetHistory AH
WHERE A.AssetID = AH.AssetID
AND AH.timeborrowed > TO_DATE('2021-10-01', 'YYYY-MM-DD');

--- Select Assets that are not registered in UserHistory, and Assets not titled 'The Bible'
-- TTITLE CENTER 'Advanced: Select Assets that are not registered in UserHistory, and Assets not titled The Bible'
SELECT Title FROM Asset WHERE  Title <> 'The Bible' MINUS
    (SELECT Title FROM Asset A, UserHistory U
    WHERE A.AssetID = U.AssetID)
UNION
-- Select Assets that are PhysicalAssets
(SELECT Title FROM Asset A, PhysicalAsset P
    WHERE A.AssetID = P.AssetID
    AND Title <> 'The Bible');

-- Select assets if their assetID is in Physical Asset table
-- TTITLE CENTER 'Advanced: Select assets if their assetID is in Physical Asset table'
(SELECT PA.AssetID, Title, ARoleDescription
    FROM Asset A, PhysicalAsset PA, AssetRole AR
    WHERE PA.AssetID = A.AssetID
    AND PA.AroleID = AR.ARoleID)
UNION
-- Select assets if their assetID is in Digital Asset table
(SELECT DA.AssetID, Title, ARoleDescription
    FROM Asset A, DigitalAsset DA, AssetRole AR
    WHERE DA.AssetID = A.AssetID
    AND DA.ARoleID = AR.ARoleID);

-- Assets with AssetID greater than 2
-- TTITLE CENTER 'Assets with AssetID greater than 2'
SELECT * FROM Asset where AssetID>2;

--- Select everything from AssetStatus
-- TTITLE CENTER 'Select everything from AssetStatus'
SELECT * FROM AssetStatus;

--- Select everything from genre where description is not Tech
-- TTITLE CENTER 'Select everything from genre where description is not Tech'
SELECT * FROM Genre WHERE gdescription <> 'Tech';

--- Select AssetID and title where genreid is 3 and AssetID from Asset is also in AssetHistory
-- TTITLE CENTER 'Select AssetID and title where genreid is 3 and AssetID from Asset is also in AssetHistory'
SELECT Asset.AssetID, Title
    FROM Asset, AssetHistory
    WHERE GenreID = 3
    AND Asset.AssetID = AssetHistory.AssetID;

--- Select AssetID 3 from AssetHistory
-- TTITLE CENTER 'Select AssetID 3 from AssetHistory'
SELECT AssetID FROM AssetHistory WHERE AssetID > 3;

--- Select everything from assetRole where the description is 'physical'
-- TTITLE CENTER 'Select everything from assetRole where the description is physical'
SELECT * FROM AssetRole WHERE Aroledescription = 'Physical';

--- Select AssetID
-- TTITLE CENTER 'Select AssetID'
SELECT AssetID FROM PhysicalAsset;

--- Select ISBN where assetID is less than 2
-- TTITLE CENTER 'Select ISBN where assetID is less than 2'
SELECT ISBN FROM PhysBook WHERE AssetID<2;

--- Select AssetID
-- TTITLE CENTER 'Select AssetID'
SELECT AssetID FROM PhysDVD;

--- Select CDDB1 for assets that do not have assetID 2
-- TTITLE CENTER 'Select CDDB1 for assets that do not have assetID 2'
SELECT CDDB1 FROM PhysCD WHERE (NOT AssetID = 2);

--- Select AssetIDs over 4 or where ARole ID is 2
-- TTITLE CENTER 'Select AssetIDs over 4 or where ARole ID is 2'
SELECT AssetID FROM DigitalAsset WHERE AssetID>4 OR ARoleID =2;

--- Select ISBNs that start with 142
-- TTITLE CENTER 'Select ISBNs that start with 142'
SELECT DigiISBN FROM DigiBook WHERE DigiISBN LIKE '142%';

--- Select assetIDs from DigiDVD
-- TTITLE CENTER 'Select assetIDs from DigiDVD'
SELECT AssetID FROM DigiDVD;

--- Select AssetIDs between 1 and 10
-- TTITLE CENTER 'Select AssetIDs between 1 and 10'
SELECT AssetID FROM DigiCD WHERE AssetID BETWEEN 1 AND 10;


--- Select Assets only if the AssetID is in UserHistory and AssetHistory
-- TTITLE CENTER 'Select Assets only if the AssetID is in UserHistory and AssetHistory'
SELECT Title
FROM Asset A, UserHistory U, AssetHistory Ah
WHERE A.AssetID = U.AssetID
AND A.AssetID = Ah.AssetID
AND U.AssetID = Ah.AssetID;


--- Count the number of Assets based on which genre they fall into
-- TTITLE CENTER 'Count the number of Assets based on which genre they fall into'
SELECT GDescription, Asset.GenreID, COUNT(*)
FROM Asset, Genre
WHERE Genre.GenreID = Asset.GenreID
GROUP BY GDescription, Asset.GenreID
ORDER BY Asset.GenreID;
