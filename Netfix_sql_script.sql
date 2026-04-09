CREATE DATABASE netflix_project;
USE netflix_project;


SELECT COUNT(*) FROM netflix_cleaned_full; -- How many total records are there?
SELECT COUNT(DISTINCT title) FROM netflix_cleaned_full; -- How many distinct titles are there ?
SELECT DISTINCT title FROM netflix_cleaned_full; -- Displaying all unique titles .

SELECT category, COUNT(*) AS result
FROM netflix_cleaned_full
GROUP BY category;  -- How many Movies vs TV Shows?

SELECT * FROM netflix_cleaned_full
where year > 2018 ;  -- Displaying all the content released after 2018.

SELECT country , COUNT(*) AS SUM
FROM netflix_cleaned_full
GROUP BY country
ORDER by SUM DESC
LIMIT 6 ; -- Top 6 Countries including Unknown.

SELECT rating, COUNT(*) 
FROM netflix_cleaned_full
GROUP BY rating
ORDER BY COUNT(*) DESC
Limit 1 ;  -- Most Common Rating.

SELECT category , avg(duration_num)
FROM netflix_cleaned_full
GROUP BY category ;  -- Calculating average time or duration per category.

SELECT AVG(duration_num)
FROM netflix_cleaned_full
WHERE category = 'Movie'; -- if want to know only movie average.

SELECT title, duration_num
FROM netflix_cleaned_full
WHERE category = 'Movie'
AND duration_type = 'min'
ORDER BY duration_num DESC
LIMIT 1; -- The longest movie.

SELECT year , COUNT(*) AS Content
FROM netflix_cleaned_full
WHERE year >2000
GROUP BY year
ORDER BY year; -- Number of content released each year.

SELECT year , COUNT(*) AS Content
FROM netflix_cleaned_full
WHERE year >2000
GROUP BY year
ORDER by content DESC
Limit 5 ; -- Top 5 year with most content.

SELECT COUNT(*) 
FROM netflix_cleaned_full
WHERE category = 'Movie' AND duration_num > 120; -- Checking how many movies are having longer duartion than 120 minutes. 

SELECT year, category, COUNT(*) AS total
FROM netflix_cleaned_full
Where year > 2000
GROUP BY year, category
ORDER BY year;  -- Displaying number of Movies vs TV Shows per year. 

SELECT year, rating , COUNT(*) AS total
FROM netflix_cleaned_full
where year >2000
GROUP BY year , rating
ORDER BY year, total DESC; -- Top-rated content per year.

SELECT director , COUNT(category) AS Content
FROM netflix_cleaned_full
GROUP BY director
ORDER BY content desc
LIMIT 6 ;  -- Top 6 directors including Unknown . 

SELECT cast, COUNT(*) AS appearances
FROM netflix_cleaned_full
GROUP BY cast
ORDER BY appearances DESC
LIMIT 5;  -- Actors who appear most frequently. 

SELECT cast ,  COUNT(*) AS WORK
FROM netflix_cleaned_full
WHERE country = 'india' 
GROUP BY cast 
ORDER by WORK DESC 
limit 6 ;  -- Top 5 Indian Cast Combination. 
 
SELECT year, category,Count(*) AS total
FROM netflix_cleaned_full
where year>2000
GROUP BY year , category
Order by total DESC 
Limit 5 ;  -- We can see movies are dominating here. 

SELECT type, AVG(duration_num) AS avg_duration
FROM netflix_cleaned_full
WHERE category = 'Movie'
Group by type
Order by avg_duration DESC;  -- What type of content keeps users engaged longer?

SELECT country, COUNT(*) AS total_content
FROM netflix_cleaned_full
GROUP BY country;
SELECT n.title, n.country, c.total_content
FROM netflix_cleaned_full n
JOIN (
    SELECT country, COUNT(*) AS total_content
    FROM netflix_cleaned_full
    GROUP BY country
) c
ON n.country = c.country;   -- Created a Country-wise content table using subquery and join . 

SELECT n.year, n.title, n.duration_num
FROM netflix_cleaned_full n
JOIN (
    SELECT year, MAX(duration_num) AS max_duration
    FROM netflix_cleaned_full
    WHERE category = 'Movie'
    GROUP BY year
) m
ON n.year = m.year AND n.duration_num = m.max_duration; -- Longest movie per year using join. 