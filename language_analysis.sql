/*PREPARE DATA AND INSPECT*/

create table data(
    Month TEXT,
    "Python Worldwide(%)" INTEGER,
    "JavaScript Worldwide(%)" INTEGER,
    "Java Worldwide(%)" INTEGER,
    "C# Worldwide(%)" INTEGER,
    "PhP Worldwide(%)" INTEGER,
    "Flutter Worldwide(%)" INTEGER,
    "React Worldwide(%)" INTEGER,
    "Swift Worldwide(%)" INTEGER,
    "TypeScript Worldwide(%)" INTEGER,
    "Matlab Worldwide(%)" INTEGER
    
);

COPY data(Month,"Python Worldwide(%)","JavaScript Worldwide(%)","Java Worldwide(%)","C# Worldwide(%)","PhP Worldwide(%)","Flutter Worldwide(%)","React Worldwide(%)","Swift Worldwide(%)","TypeScript Worldwide(%)","Matlab Worldwide(%)")
FROM '/MostPopularProgrammingLanguages.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM data
ORDER BY Date;

/*DATA CLEANING*/

SELECT FROM data
WHERE (Month, "Python Worldwide(%)") IS NULL;

ALTER TABLE data
RENAME COLUMN Month TO Date;

ALTER TABLE data
ALTER COLUMN Date TYPE DATE USING TO_DATE(Date, 'YYYY-MM-DD');

/*DATA EXPLORATION*/

/*Q1*/
SELECT 2004 AS year, 'Python' AS language, ROUND(AVG("Python Worldwide(%)"),2) AS average_usage
FROM data
WHERE EXTRACT(YEAR FROM Date) = 2004
UNION ALL
SELECT 2004 AS year, 'JavaScript' AS language, ROUND(AVG("JavaScript Worldwide(%)"),2) AS average_usage
FROM data
WHERE EXTRACT(YEAR FROM Date) = 2004
UNION ALL
SELECT 2004 AS year, 'Java' AS language, ROUND(AVG("Java Worldwide(%)"),2) AS average_usage
FROM data
WHERE EXTRACT(YEAR FROM Date) = 2004
UNION ALL
SELECT 2004 AS year, 'C#' AS language, ROUND(AVG("C# Worldwide(%)"),2) AS average_usage
FROM data
WHERE EXTRACT(YEAR FROM Date) = 2004
UNION ALL
SELECT 2004 AS year, 'PhP' AS language, ROUND(AVG("PhP Worldwide(%)"),2) AS average_usage
FROM data
WHERE EXTRACT(YEAR FROM Date) = 2004
UNION ALL
SELECT 2004 AS year, 'Flutter' AS language, ROUND(AVG("Flutter Worldwide(%)"),2) AS average_usage
FROM data
WHERE EXTRACT(YEAR FROM Date) = 2004
UNION ALL
SELECT 2004 AS year, 'React' AS language, ROUND(AVG("React Worldwide(%)"),2) AS average_usage
FROM data
WHERE EXTRACT(YEAR FROM Date) = 2004
UNION ALL
SELECT 2004 AS year, 'Swift' AS language, ROUND(AVG("Swift Worldwide(%)"),2) AS average_usage
FROM data
WHERE EXTRACT(YEAR FROM Date) = 2004
UNION ALL
SELECT 2004 AS year, 'TypeScript' AS language, ROUND(AVG("TypeScript Worldwide(%)"),2) AS average_usage
FROM data
WHERE EXTRACT(YEAR FROM Date) = 2004
UNION ALL
SELECT 2004 AS year, 'Matlab' AS language, ROUND(AVG("Matlab Worldwide(%)"),2) AS average_usage
FROM data
WHERE EXTRACT(YEAR FROM Date) = 2004;

/*Q2*/
SELECT EXTRACT(YEAR FROM Date) AS year, ROUND(AVG("Python Worldwide(%)"),2) AS average_usage FROM data
GROUP BY year
ORDER BY year;

/*Q3*/
SELECT ROUND(AVG(average_usage),2) AS total_usage
FROM (
    SELECT EXTRACT(YEAR FROM Date) AS year, ROUND(AVG("Python Worldwide(%)"),2) AS average_usage FROM data
    GROUP BY year
    ORDER BY year) AS Sub_Query;