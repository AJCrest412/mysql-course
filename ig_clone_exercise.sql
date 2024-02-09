-- 1. Finding 5 oldest users

SELECT * FROM users
ORDER BY created_at
LIMIT 5;

-- 2.
select result from (select dayname(created_at) as result, 
count(*) as count, 
dense_rank() over(order by count(*) desc) as rankii 
from users 
group by dayname(created_at)) as t 
where t.rankii = 1;

-- 3. identify inactive users.
select username
from users 
	left join 
    photos on 
    user_id = users.id 
where photos.id is null;

-- 4. find the user with most like on single photo

select  username,
		photo_id,
        image_url,
        total 
from 
users 
join
(
	select photos.user_id,
    photo_id,
    image_url,
    count(*) as total,
    rank() over (order by count(*) desc) as rankii 
	from
		photos 
		join 
		likes on photo_id = photos.id
	group by photo_id 
) as t 
on 
users.id = t.user_id 
where t.rankii = 1; 
 
-- or 
  
SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- 5.

select ((select count(*) from photos) / (select count(*) from users) ) as avrage; 


-- 6.

select tag_name, 
	   count(*) as most_used 
from 
	tags 
    join 
    photo_tags on tags.id = tag_id 
group by tag_id 
order by most_used desc 
limit 5;

-- 7.

SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 
