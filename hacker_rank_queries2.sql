--question no 4
-- Query the two cities in STATION with the shortest and longest CITY names, 
-- as well as their respective lengths (i.e.: number of characters in the name). 
-- If there is more than one smallest or largest city, 
-- choose the one that comes first when ordered alphabetically.
-- Explanation
-- When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with
-- lengths  and . The longest name is PQRS, but there are  options for shortest named city.
-- Choose ABC, because it comes first alphabetically.
-- Note
-- You can write two separate queries to get the desired output. It need not be a single
-- query.
SELECT
    CITY,
    LENGTH(CITY) AS SHORTESTCITY
FROM
    STATION
ORDER BY
    SHORTESTCITY ASC,
    CITY
LIMIT
    1;
---------------------------------------------
SELECT
    CITY,
    LENGTH(CITY) AS LONGESTCITY
FROM
    STATION
ORDER BY
    LONGESTCITY DESC,
    CITY
LIMIT
    1;