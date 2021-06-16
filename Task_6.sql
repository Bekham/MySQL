-- Task 6_1

-- Ïğåäëîæåíèÿ ïî óëó÷øåíèş êîäà îòñóòñòâóşò

-- Task 6_2

select from_user_id, to_user_id, Count(*) as total_messages
from messages
where to_user_id = 1001 or from_user_id = 1001
group by from_user_id + to_user_id limit 1;

-- Task 6_3 (ÍÅ ÑÌÎÃ ĞÅØÈÒÜ ÇÀÄÀÍÈÅ Â ÒÎ×ÍÎÌ ÑÎÎÒÂÅÒÑÒÂÈÈ Ñ ÏÎÑÒÀÂËÅÍÍÎÉ ÇÀÄÀ×ÅÉ)

select lp.liked_profile_id, p.user_id, p.birthday, TIMESTAMPDIFF(YEAR, p.birthday, NOW()) `year` 
from likes_profile lp, profiles p
where p.user_id = lp.liked_profile_id
order by TIMESTAMPDIFF(YEAR, p.birthday, NOW()) limit 10

-- Task 6_4

select 
(select Count(user_id) 
from likes_profile
where user_id in (select user_id from profiles p 
where gender = 'f')) as female,
(select Count(user_id)
from likes_profile
where user_id in (select user_id from profiles p 
where gender = 'm')) as male
from likes_profile lp limit 1;

-- Task 6_5

select distinct u_i, updated  from
(select user_id as u_i, updated_at as updated
from media m 
union
select from_user_id as u_i, created_at as updated
from messages m2 
union
select user_id  as u_i, post_updated_at as updated
from posts p) as all_summ
-- group by u_i
order by updated  limit 10
