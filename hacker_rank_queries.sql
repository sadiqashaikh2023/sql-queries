--this is my question
--Query all columns for a city in CITY with the ID 1661.

SELECT * FROM CITY 
WHERE ID = 1661;

--question no 2
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

SELECT *
FROM CITY
WHERE Population > 100000 AND CountryCode = 'USA';
