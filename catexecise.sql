-- select exercise

SELECT cat_id FROM cats;

SELECT name, breed FROM cats;

SELECT name, age FROM cats WHERE breed='Tabby';

SELECT cat_id, age FROM cats WHERE cat_id=age;

SELECT * FROM cats WHERE cat_id=age;

-- update exercise

SELECT * FROM cats WHERE name='Jackson'; 
 
UPDATE cats SET name='Jack' WHERE name='Jackson'; 
 
SELECT * FROM cats WHERE name='Jackson'; 
 
SELECT * FROM cats WHERE name='Jack'; 
 
SELECT * FROM cats WHERE name='Ringo'; 
 
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo'; 
 
SELECT * FROM cats WHERE name='Ringo'; 
 
SELECT * FROM cats; 
 
SELECT * FROM cats WHERE breed='Maine Coon'; 
 
UPDATE cats SET age=12 WHERE breed='Maine Coon'; 
 
SELECT * FROM cats WHERE breed='Maine Coon';

-- Delete all 4 year old cats:

DELETE FROM cats WHERE age=4;
-- Delete cats where cat_id is the same as their age:

DELETE FROM cats WHERE cat_id=age;

-- Delete all cats:

DELETE FROM cats;