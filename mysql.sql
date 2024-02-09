--To list available databases:
show databases;


--The general command for creating a database:
CREATE DATABASE <database_name>;
--A specific example:
CREATE DATABASE soap_store;


--To drop a database:
DROP DATABASE <database-name>;

--To use a database:
USE <database-name>;


--Creating Tables:
CREATE TABLE cats (
    name VARCHAR(50),
    age INT
);
CREATE TABLE dogs (
    name VARCHAR(50),
    breed VARCHAR(50),
    age INT
);


--To list available tables in databases:
SHOW tables;

--to show columns detail all three are produce same outcome
SHOW COLUMNS FROM cats;
DESCRIBE cats;
DESC cats;


--To drop a table:
DROP TABLE <table-name>;
--To specifically drop the cats table:
DROP TABLE cats;


--Insert a cat:
INSERT INTO cats (name, age) 
VALUES ('Blue Steele', 5);

-- Single insert (switching order of name and age)
INSERT INTO cats (age, name) 
VALUES 
  (2, 'Beth');

-- Multiple Insert:
INSERT INTO cats (name, age) 
VALUES 
  ('Meatball', 5), 
  ('Turkey', 1), 
  ('Potato Face', 15);


--Using NOT NULL:
CREATE TABLE cats2 (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

--Using  DEFAULT:
CREATE TABLE cats3  (    
    name VARCHAR(20) DEFAULT 'no name provided',    
    age INT DEFAULT 99  
);

--Combine NOT NULL and DEFAULT: bcz we can give null as a value if not null is not include
CREATE TABLE cats4  (    
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
    age INT NOT NULL DEFAULT 99 
);


-- One way of specifying a PRIMARY KEY
CREATE TABLE unique_cats (
	cat_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

-- Another option:
CREATE TABLE unique_cats2 (
	cat_id INT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);


--  AUTO_INCREMENT
CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);


-- To get all the columns:
SELECT * FROM cats;

-- To only get the age column:
SELECT age FROM cats;

-- To select multiple specific columns:
SELECT name, breed FROM cats;


-- Use where to specify a condition:
SELECT * FROM cats WHERE age = 4;
SELECT * FROM cats WHERE name ='Egg';


-- Use 'AS' to alias a column in your results (it doesn't actually change the name of the column in the table)
SELECT cat_id AS id, name FROM cats;


--Updating Data: if where is not specified then all rows are updated
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';


-- Delete all cats with name of 'Egg':
DELETE FROM cats WHERE name='Egg';
-- Delete all rows in the cats table:
DELETE FROM cats;

--string functions

--CONCAT

SELECT CONCAT('pi', 'ckle');
SELECT CONCAT(author_fname,' ', author_lname) AS author_name FROM books;
SELECT CONCAT_WS('-',title, author_fname, author_lname) FROM books;

--SUBSTR or SUBSTRING

SELECT SUBSTRING('Hello World', 1, 4);
SELECT SUBSTRING('Hello World', 7);   -- 7 to end of the string
SELECT SUBSTRING('Hello World', -3);
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;
SELECT CONCAT(SUBSTRING(title, 1, 10),'...') AS 'short title'FROM books;

--REPLACE

SELECT REPLACE('Hello World', 'Hell', '%$#@');
SELECT REPLACE(title, ' ', '-') FROM books;

--REVERSE

SELECT REVERSE('Hello World');
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

--LENGTH

SELECT CHAR_LENGTH('Hello World');  -- length function also there which returns number bytes occupied by string
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

--TYPE CASE

SELECT UPPER('Hello World');   -- ucase() same
SELECT LOWER('Hello World');  -- lcase() same
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books; 
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;

-- others

SELECT INSERT('Hello Bobby', 6, 0, 'There'); -- 6-> from where it has to be insert 0->how many character you want to replace
SELECT LEFT('omghahalol!', 3);
SELECT RIGHT('omghahalol!', 4);
SELECT REPEAT('ha', 4);
SELECT TRIM('  pickle  ');
SELECT TRIM(leading '.' from '....pickle....');
SELECT TRIM(trailing '.' from '....pickle....');
SELECT TRIM(both '.' from '....pickle....');

--to use sql file
source file_name.sql


--DISTINCT

SELECT DISTINCT author_lname FROM books; 
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;  --same as previous


--ORDER BY

SELECT * FROM books ORDER BY author_lname;  -- by default asc
SELECT * FROM books ORDER BY author_lname DESC;
SELECT * FROM books ORDER BY released_year;
SELECT book_id, author_fname, author_lname, pages FROM books ORDER BY 2 desc;
SELECT book_id, author_fname, author_lname, pages FROM books ORDER BY author_lname, author_fname;
SELECT book_id, author_fname, author_lname, pages FROM books ORDER BY author_lname desc, author_fname desc; 


--LIMIT    


SELECT title FROM books LIMIT 3;

SELECT * FROM books LIMIT 1;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1;  --most recent book

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 5;  --most recent 5 book

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,5;  -- 0->starting index 5->how many

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1,3;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 10,1;

SELECT * FROM books LIMIT 95,18446744073709551615;
SELECT title FROM books LIMIT 5, 50;

--LIKE
-- % represents 0 or more characters
-- _ represents 1 character

SELECT title, author_fname, author_lname, pages 
FROM books
WHERE author_fname LIKE '%da%';

SELECT title, author_fname, author_lname, pages 
FROM books
WHERE title LIKE '%:%';

SELECT * FROM books
WHERE author_fname LIKE '____';

SELECT * FROM books
WHERE author_fname LIKE '_a_';

-- To select books with '%' in their title:
SELECT * FROM books
WHERE title LIKE '%\%%';

-- To select books with an underscore '_' in title:
SELECT * FROM books
WHERE title LIKE '%\_%';


--count
SELECT COUNT(null);  -->   0
SELECT COUNT(*) FROM books;
SELECT COUNT(author_lname) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;

--group by
SELECT author_lname, COUNT(*) 
FROM books
GROUP BY author_lname;

SELECT 
    author_lname, COUNT(*) AS books_written
FROM
    books
GROUP BY author_lname
ORDER BY books_written DESC;

SELECT author_fname, author_lname, COUNT(*) 
FROM books 
GROUP BY author_lname, author_fname;


SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*)
FROM books
GROUP BY author;

--min max
SELECT MAX(pages) FROM books;
SELECT MIN(author_lname) FROM books;

SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;

SELECT author_lname, MAX(released_year), MIN(released_year) FROM books GROUP BY author_lname;

SELECT 
	author_lname, 
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release,
      MAX(pages) AS longest_page_count
FROM books GROUP BY author_lname, author_fname;

--subquery
SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT MIN(released_year) FROM books;

SELECT title, released_year FROM books 
WHERE released_year = (SELECT MIN(released_year) FROM books);

--sum
SELECT SUM(pages) FROM books;
SELECT author_lname, COUNT(*), SUM(pages)
FROM books
GROUP BY author_lname;


--avg
SELECT AVG(pages) FROM books;
SELECT AVG(released_year) FROM books;
SELECT 
    released_year, 
    AVG(stock_quantity), 
    COUNT(*) FROM books
GROUP BY released_year;


--data types

-- varchar vs char 
-- varchar & char takes variable length of string specified in ()
-- difference is that varchar takes only required space where char takes fixed size specified in()
-- ex  varchar (4)                 char (4)
--     ''  --> takes 1byte          ''-->takes 4byte
--    'ab' --> takes 3 byte         'ab'-->takes 4 byte
--    'abcd' -->takes 5 byte        'abcd' --> takes 4 byte
--in char extra spaces or padding are add if string is short  then storing to database
--so char is optimised if we have store fix length of string.

-- tinyint  -> 1byte
-- shortint -> 2byte
-- mediumint -> 3byte
-- int      -> 4byte
-- bigint   -> 8byte


--decimal(x,y)

-- x->total digits, y->decimal digits,  so before decimal only x-y digits are valid or it will give error
-- ex. decimal (5,2)  -> max value its store is 999.99   
-- if decimals are exceeds limit of y then its truncate and round up in y but y-x should be follow.


-- float -> 4bytes -> total ~7 digits allowed after that round up start
-- double ->8bytes  -> total ~15 decimal digits allowed after that round up start

-- date -> yyyy-mm-dd      
-- time -> hh:mm:ss
--datetime -> yyyy-mm-dd hh:mm:ss

-- current
--  date --> current_date() or curdate() both are same
--  time --> current_time() or curtime() both are same
--  datetime --> current_timestamp() or now() both are same

SELECT CURTIME();
SELECT CURDATE();
SELECT NOW();


--other date functions
-- day(date or datetime) -> dd , dayofweek(d or dt) -> 1 to 7 as sun to sat, 
--dayofyear(d or dt) -> 1 to 365,
-- monthname(d or dt) -> january to december,
--etc go to document
--if we provide time object to date function this will consider it todays date.

--other time funciton 
--hour(t or dt)
--minute(t or dt)
--second(t or dt)

--formating date and time  birthdt is datetime bdate is date
SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;
--date_format format both date and time(if dt is given)
--time_formate only formate time
SELECT TIME_FORMAT("19:30:10", "%h %i %s %p");


datediff(d1 or dt1, d2 or dt2)  gives difference in days work with (dt,d)(dt, dt)(d,d)(d,dt) 
date_add or adddate(date, interval exp)  date_sub or subdate(date, interval exp) 
gives new date or dt work with d dt, if dt is provide also work with time

timediff(t1 or dt1,t2 or dt2)  gives difference in time work with time, datetime (t,t)(dt,dt) 

also we can do 
 select curdate() + interval 10 hour + interval 10 second; //takes tie 00:00:00 if not given
 select curtime() + interval 10 day + interval 10 second;  //takes current date by defualt if not given
 select now() + interval 10 day + interval 10 second;

-- What's the difference between DATETIME and TIMESTAMP?

-- They both store datetime information, but there's a difference in the range, 
-- TIMESTAMP has a smaller range. TIMESTAMP also takes up less space. 
-- TIMESTAMP is used for things like meta-data about when something is created
-- or updated.
timestamp have timestampdiff(), timestampadd(), timestampsub()

CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   -- by this whenever any field or col change new timestamp is store in this
);


--comparison & logical operator

-- !=
SELECT * FROM books
WHERE released_year != 2017;

--not like
SELECT * FROM books
WHERE title NOT LIKE '%e%';

-- > < >= <=
SELECT * FROM books
WHERE pages > 500;

SELECT * FROM books
WHERE pages < 200;

SELECT * FROM books
WHERE released_year <= 2000;

SELECT * FROM books
WHERE released_year <= 1985;

--And or &&

SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers'
AND title LIKE '%novel%';

-- or or ||
SELECT title, pages FROM books
WHERE pages < 200 
OR title LIKE '%stories%';

-- between (inclusive),  not between(exclusive)
SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;


--between for time date and datetime put same type gthen its work or its not work
SELECT * FROM people WHERE birthtime 
BETWEEN CAST('12:00:00' AS TIME) 
AND CAST('16:00:00' AS TIME);

SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 12 AND 16;


-- in, not in , %
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');


SELECT title, released_year FROM books
WHERE released_year >= 2000 
AND released_year % 2 = 1;

--case, IF 
-- If only 2 conditions are given we can use if else case is also work for 2 or multiple conditions
SELECT title, released_year,
CASE
	WHEN released_year >= 2000 THEN 'modern lit'
    ELSE '20th century lit' 
END AS genre
FROM books;

SELECT title, released_year,
IF(released_year >= 2000, 'modern lit','20th century lit') 
FROM books;

SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;


SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
    
-- is null
select * from books where title is null;
delete from books where title is null;

--more constaints

-- unique

CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');

-- This insert would result in an error:
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');

--check
CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);

CREATE TABLE palindromes (
  word VARCHAR(100) CHECK(REVERSE(word) = word)
)

--check with coustom name
CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);

CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);

--constraints with multiple columns

CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);

CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);


--ALTER table
-- to change column name, add or remove columns, change type of column etc...

--add column
ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);

ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;        --if defualt was not set and not null then for string empty string and for int 0 was set by defualt

--drop column
ALTER TABLE companies DROP COLUMN phone;
ALTER TABLE companies DROP phone;   --same as above column was not required

--rename table or column_name
RENAME TABLE companies to suppliers;

ALTER TABLE suppliers RENAME TO companies;

ALTER TABLE companies
RENAME COLUMN name TO company_name;

-- change defination of column
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';

--change name and definaton both at a time
ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);

--add or drop constraints

ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);

ALTER TABLE houses DROP CONSTRAINT positive_pprice;

--JOINS

--cross join or cartesian join
-- in this join each row of one table is join to each row of other table 
--so if table-1 have 5 rows and table-2 have 4 rows then new table have 20 rows and its not that much useful
-- To perform a (kind of useless) cross join:

--         CROSS JOIN Syntax
-- SELECT column_name(s)
-- FROM table1
-- CROSS JOIN table2;

SELECT * FROM customers, orders;
SELECT * FROM customers cross join orders; --same as above
select first_name, amount from customers, orders where customers.id = customer_id;
select first_name, amount from customers cross join orders where customers.id = customer_id; --same as above


--inner join
-- in this join row of one table is join to a specific row of other table
-- so if we have 5 rows in t1 than after inner join we have 5 rows doesnt matter how many rows other table have
-- inner join is defualt join if we not specified inner by defualt this apply
-- Our first inner join!

--       Syntax
-- SELECT column_name(s)
-- FROM table1
-- [INNER] JOIN table2
-- ON table1.column_name = table2.column_name;

SELECT * FROM customers
INNER JOIN orders ON orders.customer_id = customers.id;

SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders ON orders.customer_id = customers.id;

-- The order doesn't matter here:
SELECT * FROM orders
JOIN customers ON customers.id = orders.customer_id;

SELECT 
    first_name, last_name, SUM(amount) AS total
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id
GROUP BY first_name , last_name
ORDER BY total;

--left join , right join, full or full outer join 
--right is same as left and full is left + right
--order matters

SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        LEFT JOIN
    orders ON orders.customer_id = customers.id;


SELECT 
    order_date, amount, first_name, last_name
FROM
    orders
        LEFT JOIN
    customers ON orders.customer_id = customers.id;

SELECT 
    first_name, 
    last_name, 
    IFNULL(SUM(amount), 0) AS money_spent              -- ifnull then take 0 or sum
FROM
    customers
        LEFT JOIN
    orders ON customers.id = orders.customer_id
GROUP BY first_name , last_name;    

--on delete cascade 
--by using this if any referenced row in the table was delete all the row in other table who are refrence that row also delete
--we can not drop  refrenced table first drop table which are refer other table
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON DELETE CASCADE
);

-- query ex for join

SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'passing'
        ELSE 'failing'
    END AS passing_status
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;


--round

select round(3.324534);  --gives 3
select round(3.324534,2);  --gives 3.32

--ifnull
select ifnull(null, 0)    --gives 0 instead of null there are any field or column


--VIEW
-- INSTEAD OF TYPING THIS QUERY ALL THE TIME...
SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM
    reviews
        JOIN
    series ON series.id = reviews.series_id
        JOIN
    reviewers ON reviewers.id = reviews.reviewer_id;

-- WE CAN CREATE A VIEW:
CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

-- NOW WE CAN TREAT THAT VIEW AS A VIRTUAL TABLE 
-- (AT LEAST WHEN IT COMES TO SELECTING)
SELECT * FROM full_reviews;

-- if we insert, selete or update in view originol table is also changed
--but not all the views are updateble or deleteable thire are some rules like for join or aggrigate function used tables are not updatable and deleteble.

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;


-- 2 option for change table schema or alter table 
CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;

ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

--For drop the view
DROP VIEW ordered_series;

--we can  also use this type of sintax for using custom table
select result from (select dayname(created_at) as result, 
count(*) as count, 
dense_rank() over(order by count(*) desc) as rankii 
from users 
group by dayname(created_at)) as t 
where t.rankii = 1;

-- HAVING Clouse
--its used to apply filter on group data
SELECT 
    title, 
    AVG(rating),
    COUNT(rating) AS review_count
FROM full_reviews 
GROUP BY title HAVING COUNT(rating) > 1;

-- WITH ROLLUP
--create summary for all data like if we want total avg 
SELECT 
    title, AVG(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;


SELECT 
    title, COUNT(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;


SELECT 
    first_name, released_year, genre, AVG(rating)
FROM
    full_reviews
GROUP BY released_year , genre , first_name WITH ROLLUP;

-- To View Modes:
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

-- To Set Them:
SET GLOBAL sql_mode = 'modes';
SET SESSION sql_mode = 'modes';

--WINDOW FUNCTIONS
--Window functions perform aggregate operations on groups of rows, but they produce a result FOR EACH ROW.
SELECT emp_no, department, salary, 
	AVG(salary) OVER(PARTITION BY department) AS dept_avg FROM emps;

+--------+------------------+--------+
| emp_no | department       | salary |
+--------+------------------+--------+
|      8 | sales            |  59000 |
|     12 | sales            |  60000 |
|     20 | customer service |  56000 |
|     21 | customer service |  55000 |
+--------+------------------+--------+

                    |
                    |
                    \/
+--------+------------------+--------+------------+
| emp_no | department       | salary | dept_avg   |
+--------+------------------+--------+------------+
|     20 | customer service |  56000 | 55500.0000 |
|     21 | customer service |  55000 | 55500.0000 |
|      8 | sales            |  59000 | 59500.0000 |
|     12 | sales            |  60000 | 59500.0000 |
+--------+------------------+--------+------------+


--OVER
--The OVER() clause constructs a window.  When it's empty, the window will include all records

SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;
    
--PARTITION BY
--Inside of the the OVER(), use PARTITION BY to form rows into groups of row

SELECT 
    emp_no, 
    department, 
    salary, 
    COUNT(*) OVER(PARTITION BY department) as dept_count
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;

--ORDER BY
--Use ORDER BY inside of the OVER() clause to re-order rows within each window.

SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min
FROM employees;

--RANK()  
--give ranks to each row as per order given
select emp_no, 
	   department,
       salary, 
       rank() over(partition by department order by salary desc) as dept_salary_rank,
	   rank() over (order by salary desc) as overall_salary_rank 
from employees order by department;


--DENSE_RANK()   give same rank to same value 
--ROW_NUMBER()  give row number 
SELECT 
    emp_no, 
    department, 
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num
FROM employees ORDER BY overall_rank;

--NTILE() to choose range in which row fit like if 1000 to 10000 we make 5 range by ntile(5) so all 1000 to 2000 salary are in 1 range
SELECT 
    emp_no, 
    department, 
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
	NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;

--FIRST_VALUE(col) take first occurence of given col 

SELECT 
    emp_no, 
    department, 
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall
FROM employees;


--LAG() take previous row 
--LEAD() take next row
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    salary - LEAD(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_diff
FROM employees;

-- MySQL Database Triggers
-- SQL statements that are AUTOMATICALLY RUN when a specific table is change

-- The Syntax
-- CREATE TRIGGER trigger_name 
--     trigger_time trigger_event ON table_name FOR EACH ROW
--     BEGIN
--     ...
--     END;

-- trigger_time    trigger_event    ON     table_name
-- BEFORE           INSERT                    photos

-- AFTER            UPDATE                     users

--                  DELETE

--  write trigger and run it after run trigger its add to the database so whenever we try to edit table specified in trigger its trigger and run 
-- ex.
DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;

-- Listing Triggers
SHOW TRIGGERS;

-- Removing Triggers
DROP TRIGGER trigger_name;

