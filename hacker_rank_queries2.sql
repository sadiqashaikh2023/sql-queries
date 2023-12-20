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

------------------------------------------
--QUESTION N0 5
--Query the average population of all cities in CITY where District is California.
SELECT
    AVG(POPULATION) AS AVERAGEPOPULATION
FROM
    CITY
WHERE
    DISTRICT = 'CALIFORNIA';

--QUESTION NO 6
--Query the difference between the maximum and minimum populations in CITY.
SELECT
    MAX(POPULATION) - MIN(POPULATION) AS POPULATIONDIFFRENCE
FROM
    CITY;

--QUESTION NO 7
--Query all columns (attributes) for every row in the CITY table.
SELECT
    *
FROM
    CITY;

--------------------------------------------------------------------------------
--QUESTION NO 6
--Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
SELECT
    CITY.NAME
FROM
    CITY
    JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE
    COUNTRY.CONTINENT = 'AFRICA';
    ------------------------------------------------------

--     QUESTION NO 7
--     Generate the following two result sets:

-- Query an alphabetically ordered list of all names in OCCUPATIONS,
--  immediately followed by the first letter of each profession as a
--   parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A),
--    ADoctorName(D), AProfessorName(P), and ASingerName(S)


SELECT NAME, CONCAT('(', SUBSTRING(OCCUPATION, 1, 1), ')') AS PROFESSION FROM OCCUPATIONS
ORDER BY NAME;

---------------------------------------------------------------------

--QUESTION NO 8
--Query the number of ocurrences of each occupation in OCCUPATIONS.
-- Sort the occurrences in ascending order, and output them in the following format:

-- There are a total of [occupation_count] [occupations.]

SELECT CONCAT('There are a total of', ' ', COUNT(*), ' ', LOWER(OCCUPATION),'S.')
 FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY COUNT(*), LOWER(OCCUPATION);
 ----------------------------------------------------------------------------------
--QUESTION NO 9
--Given the CITY and COUNTRY tables, query the sum of the populations of all cities
-- where the CONTINENT is 'Asia'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT SUM(CITY.POPULATION) AS TOTAL_POPULATION FROM CITY 
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'ASIA';