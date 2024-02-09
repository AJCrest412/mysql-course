SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));
 
SELECT REPLACE(title, ' ', '->') AS title FROM books;
 
SELECT 
    author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM
    books;
    
 
SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;
 
 
SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;
 
SELECT title, CHAR_LENGTH(title) AS character_count FROM books;
 
SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;
    
SELECT title FROM books WHERE title LIKE '%stories%';
 
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
 
SELECT 
    CONCAT(title, ' - ', released_year) AS summary 
FROM books ORDER BY released_year DESC LIMIT 3;
 
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
 
SELECT title, released_year, stock_quantity 
FROM books ORDER BY stock_quantity LIMIT 3;
 
SELECT title, author_lname 
FROM books ORDER BY author_lname, title;
 
SELECT title, author_lname 
FROM books ORDER BY 2,1;
 
SELECT
    CONCAT(
        'MY FAVORITE AUTHOR IS ',
        UPPER(author_fname),
        ' ',
        UPPER(author_lname),
        '!'
    ) AS yell
FROM books ORDER BY author_lname;


SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) 
FROM books GROUP BY released_year;

SELECT AVG(released_year) 
FROM books GROUP BY author_lname, author_fname;


SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books
ORDER BY pages DESC LIMIT 1;


SELECT 
    released_year AS year,
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year
ORDER BY released_year;


SELECT * FROM books WHERE released_year < 1980;

SELECT * FROM books 
WHERE author_lname = 'Eggers'
OR author_lname = 'Chabon';

SELECT * FROM books
WHERE author_lname = 'Lahiri'
AND released_year > 2000;

SELECT * FROM books
WHERE pages >= 100 
AND pages <= 200;

SELECT * FROM books
WHERE pages BETWEEN 100 and 200;

SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%'
OR author_lname LIKE 'S%';

SELECT title, author_lname
FROM books WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');

SELECT title, author_lname,
CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title = 'Just Kids' THEN 'Memoir' 
    WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memior'
    ELSE 'Novel'
END AS type
FROM books;


SELECT author_fname, author_lname,
	CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;
