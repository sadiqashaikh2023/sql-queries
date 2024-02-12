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
   --question no 9
   --find no of rows in a table(sales) without using count function.

   SELECT sum(1) FROM sales;
   ------------------------------------------------------------------------------------
   --question no 10
   -- find top 5 stars who have done maximum no of movies?

    select star, count(*) as num_movies from movies
    group by star order by num_movies desc limit 5;
  --------------------------------------------------------------------------------------
  question no 11
  --find top 5 genre who have earn max profit from movies table.
  --following are the attributes.
  --NAME, RATING, GENRE, YEAR, RELEASED, SCORE, VOTES, DIRECTOR, WRITER, STAR,
  -- COUNTRY, BUDGET, GROSS, COMPANY, RUNTIME

  SELECT genre, SUM(gross-budget) as total_profit FROM movies
     GROUP BY genre ORDER BY total_profit DESC LIMIT 5; 
-----------------------------------------------------------------------------------
--QUESTION NO 12
-- find top 5 directors who's movie have earn maximum avg profit.

SELECT director, AVG(gross-budget) AS AVG_PROFIT FROM movies
 GROUP BY director ORDER BY AVG_PROFIT DESC LIMIT 5;
 ---------------------------------------------------------------------------------
 --question no 12
 -- find max budget movie name from movies table.
 -- method 1
 SELECT name, budget FROM movies GROUP BY name ORDER BY budget desc limit 1;

-- method 2
SELECT name, budget FROM movies WHERE budget=(SELECT MAX(budget) FROM movies);
 ---------------------------------------------------------------------------------
 --question no 13
 --find top 5 which star and director combination have earn max profit.

 
SELECT star, director, sum(gross-budget) as total_profit from movies
 GROUP by star, director order by total_profit desc limit 5;
------------------------------------------------------------------------------------ 
--question no 14
--find top 5 stars who have earn max profit.

SELECT star, sum(gross-budget) as total_profit FROM movies
 GROUP BY star order by total_profit desc limit 5;
 --------------------------------------------------------------------------------------
--question no 15
--find the avg runtime movie name and star from movies having runtime larger than 120.

SELECT star, avg(runtime) as avg_time_movies FROM movies
 GROUP BY star HAVING avg_time_movies>120 order by avg_time_movies;
----------------------------------------------------------------------------------------- 
--question no 16
--find the possible combination of users with all groups.
select * from users cross join groups;
-----------------------------------------------------------------------------------------
--question no 17
--following are the tables.
--employee(employee_name, street, city)
--works(employee_name, company_name, salary)
--company(comapany_name,city)
--manages(employee_name, manager_name)
-- find the name, street, city of residence for all employees
-- who work for 'first bank corporation' and earn more than 10000.

select e.employee_name, e.street, e.city from employee e
join works w on e.employee_name = w.employee_name 
where comapany_name ='first bank corporation' and salary > 10000;
-------------------------------------------------------------------------------------------
--question no 18
-- find the name of all employee in database who live in a same city as the companiess
-- which they work.
select e.employee_name from employee e join work w on e.employee_name = w.employee_name
 join company c on w.comapany_name = c.comapany_name
where e.city = c.city;
---------------------------------------------------------------------------------------------
--question no 19
--find the names of all employess in the database who earn more than every employee of
-- 'first bank corporation'
select employee_name from works where salary >(select max(salary)from works
group by comapany_name having comapany_name ='first bank corporation');
-------------------------------------------------------------------------
--question no 19
--solution 1
-- find the user id who present more than one group
SELECT user_id FROM membership GROUP by user_id having COUNT(group_id)>1;
-------------------------------------------------------------------------------
--solution 2
SELECT DISTINCT m1.user_id FROM membership m1 join membership m2
 ON m1.user_id = m2.user_id AND m1.group_id<>m2.group_id;
 -------------------------------------------------------------------------------
 --question no 20
 --find duplicate data in the database
 SELECT *, COUNT(*) as duplicate FROM teacher GROUP by name having COUNT(*)>1;
 -------------------------------------------------------------------------------
--question no 21
--retrive 50% data from database
select * from users where user_id <= (select count(user_id)/2 from users);
----------------------------------------------------------------------------------
