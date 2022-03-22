select 
    dayname(created_at) as aday,
    count(*) as total
from users
group by aday
order by total desc;

select 
    users.id,users.username,count(*) as posts
from users
join photos
    on users.id = photos.user_id
group by users.id
order by posts;


select image_url, count(*) as total_likes
from photos 
join likes 
    on photos.id = likes.photo_id
group by photos.id;


-- problem solved using ****having***** not -----where------
select 
    users.id,
    users.username,
    count(*) as total
from users
join photos
    on users.id = photos.user_id
group by users.id
having count(*)=1;


select tag_name, count(*) as popularity
    from tags 
join photo_tags 
on photo_tags.tag_id = tags.id
group by tags.id
having popularity > 3;