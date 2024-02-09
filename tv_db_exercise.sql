-- Q-1
SELECT 
    title, rating
FROM
    series
        JOIN
    reviews ON series.id = reviews.series_id;

-- Q-2
SELECT 
    title, ROUND(AVG(rating), 2) AS avg_rating
FROM
    series
        JOIN
    reviews ON series.id = reviews.series_id
GROUP BY title
ORDER BY avg_rating;

-- Q-3

SELECT 
    first_name, last_name, rating
FROM
    reviewers
        JOIN
    reviews ON reviews.reviewer_id = reviewers.id;
    
-- Q-4

SELECT 
    title AS unreviewed_series
FROM
    series
        LEFT JOIN
    reviews ON series.id = reviews.series_id
WHERE
    rating IS NULL;

-- Q-5

SELECT 
    genre, ROUND(AVG(rating), 2) AS avg_rating
FROM
    series
        JOIN
    reviews ON series.id = reviews.series_id
GROUP BY genre;

-- Q-6

select 
	first_name, 
	last_name, 
    count(rating) as COUNT,  
    ifnull(min(rating),0.0) as MIN, 
    ifnull(max(rating),0.0) as MAX,
    round(ifnull(avg(rating),0.00),2) as AVG,
	case 
		when count(rating) > 0 then 'ACTIVE' 
        else 'INACTIVE' 
    end as STATUS 
from 
    reviewers 
		left join 
	reviews on reviewers.id = reviewer_id 
group by first_name, last_name;

-- USING IF 
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS count,
    IFNULL(MIN(rating), 0) AS min,
    IFNULL(MAX(rating), 0) AS max,
    ROUND(IFNULL(AVG(rating), 0), 2) AS average,
    IF(COUNT(rating) > 0,
        'ACTIVE',
        'INACTIVE') AS status
FROM
    reviewers
        LEFT JOIN
    reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name , last_name;

-- Q-7

select 
	title, rating,
    concat(first_name, ' ', last_name) as reviewer
from 
	reviewers 
    join 
    reviews on reviewers.id = reviewer_id 
    join 
    series on series.id = series_id;
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    