--this is my question
--Query all columns for a city in CITY with the ID 1661.
SELECT
    *
FROM
    CITY
WHERE
    ID = 1661;

--question no 2
--Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
SELECT
    *
FROM
    CITY
WHERE
    Population > 100000
    AND CountryCode = 'USA';

--------------------------------------------------------
--question no 3
--Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
--Equilateral: It's a triangle with  sides of equal length.
--Isosceles: It's a triangle with  sides of equal length.
--Scalene: It's a triangle with  sides of differing lengths.
--Not A Triangle: The given values of A, B, and C don't form a triangle.
-- Explanation
-- Values in the tuple  form an Isosceles triangle, because .
-- Values in the tuple  form an Equilateral triangle, because . Values in the tuple  form a Scalene triangle, because .
-- Values in the tuple  cannot form a triangle because the combined value of sides  and  is not larger than that of side .
SELECT
    CASE
        WHEN A + B <= C
        OR A + C <= B
        OR B + C <= A THEN 'Not A Triangle'
        WHEN A = B
        AND B = C THEN 'Equilateral'
        WHEN A = B
        OR B = C
        OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
    END AS TriangleType
FROM
    TRIANGLES;
    -----------------------------------------------------------------------------------
    -- question no 4
   -- find max salary from emp table.
   SELECT max(salary) FROM emp;
   ----------------------------------------------------------------------------------
   --question no 5
   --find 2nd highest salary from emp.
   SELECT MAX(SALARY) FROM emp
   WHERE SALARY NOT IN(SELECT MAX(SALARY) FROM emp);
------------------------------------------------------------------------------------
--QUESTION NO 6
--  find the second-highest salary from the EMP table, considering the requirement
--  that if there are two employees with the same highest salary, you want
--  to select the one that comes alphabetically first.

SELECT NAME, MAX(SALARY) FROM emp WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM emp)
 GROUP BY name ORDER BY NAME LIMIT 1;
 --------------------------------------------------------------------------------------
 --QUESTION NO 7
 --find the 3rd highest salary.
 SELECT id, salary FROM emp e1 where 2 =(SELECT COUNT(DISTINCT salary)from emp e2
  WHERE e2.salary>e1.salary);
  -------------------------------------------------------------------------------------
  --QUESTION NO 8
  --find the 4th highest salary.
  SELECT id,salary FROM emp e1 where 3 = (select count(DISTINCT salary) from emp e2
   where e2.salary=e1.salary);
   -----------------------------------------------------------------------------------
   