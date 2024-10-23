CREATE DATABASE PRIME_VIDEO



SELECT * FROM [PRIME_VIDEO].[dbo].[Prime Video]

--------------1.Find the most common rated movies or shows on Prime Video.------------------------------------------------------------------------------------------------------------------

SELECT TOP (1) type, rating, COUNT(rating) as Counts FROM [PRIME_VIDEO].[dbo].[Prime Video]
WHERE type = 'Movie'
GROUP BY type, rating
ORDER BY Counts DESC

--------------2.Count the number of titles available in each genre. Which genre has the most titles?-----------------------------------------------------------------------------


SELECT TRIM(listed_in) AS Genre, COUNT(title) AS TitleCount
FROM [PRIME_VIDEO].[dbo].[Prime Video]
CROSS APPLY STRING_SPLIT(listed_in, ',') AS Genres
GROUP BY TRIM(listed_in)
ORDER BY TitleCount DESC

-------------3.How many titles were released each year?-------------------------------------------------------------------------------

SELECT COUNT(title), release_year FROM  [PRIME_VIDEO].[dbo].[Prime Video]
GROUP BY release_year
ORDER BY release_year DESC

-------------4.Identify the longest movie or TV show duration---------------------------------------------------------------------------------------------------------------------

SELECT TOP(1) type,
    duration,
    CAST(LEFT(duration, PATINDEX('%[a-zA-Z]%', duration) - 1) AS INT) AS durationInMinutes
FROM [PRIME_VIDEO].[dbo].[Prime Video]
ORDER BY durationInMinutes DESC

-------------5.List all the movies released in the specific year (eg, 2020)-----------------------------------------------------------------------------

SELECT type, release_year FROM [PRIME_VIDEO].[dbo].[Prime Video]
WHERE type = 'Movie' AND
release_year = '2020'

-------------6.List all movies that are documentries------------------------------------------------------------------------------------------------------------------------------
 
 SELECT type, listed_in FROM [PRIME_VIDEO].[dbo].[Prime Video]
 WHERE 
 type = 'Movie' AND
 listed_in LIKE '%Documentary%' 

 ------------7.Find all the movie/TV shows by director  'Mark Knight' --------------------------------------------------------------------------------

 SELECT type, director FROM [PRIME_VIDEO].[dbo].[Prime Video]
 WHERE director = 'Mark Knight'

 --------------8.Identify the top 5 directors with the highest number of movies-------------------------------------------------------------------------------------------------

SELECT TOP(5) director, COUNT(type) AS movie_count
FROM [PRIME_VIDEO].[dbo].[Prime Video]
GROUP BY director
ORDER BY movie_count DESC

---------------9.Count the number of movies vs tv show--------------------------------------------------------------------------------------------------------------------------------

SELECT type, COUNT(type) AS counts FROM [PRIME_VIDEO].[dbo].[Prime Video]
GROUP BY type

---------------10.Find titles released in the last five years-------------------------------------------------------------------------------------------------------------------------------

SELECT title, release_year FROM [PRIME_VIDEO].[dbo].[Prime Video]
ORDER BY release_year DESC
