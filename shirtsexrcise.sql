SELECT article, color FROM shirts;
 
SELECT * FROM shirts WHERE shirt_size='M';
 
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size='M';

UPDATE shirts 
SET 
    shirt_size = 'L'
WHERE
    article = 'polo shirt';
    
    
UPDATE shirts 
SET 
    last_worn = 0
WHERE
    last_worn = 15;
    
    
UPDATE shirts 
SET 
    color = 'off white',
    shirt_size = 'XS'
WHERE
    color = 'white';
    
SELECT * FROM shirts WHERE last_worn=200;
 
DELETE FROM shirts WHERE last_worn=200;
 
 
SELECT * FROM shirts WHERE article='tank top';
 
DELETE FROM shirts WHERE article='tank top';
 
 
 
SELECT * FROM shirts;
 
DELETE FROM shirts;
 
 
 
 
DROP TABLE shirts; 
 
 
show tables;
 
DESC shirts;