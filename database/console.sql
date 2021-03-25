# 2. Пусть задан некоторый пользователь.
#    Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
select
    mes.to_user_id                                                                                          as user_recipeint_id,
    (select concat_ws(' ', p.firstname, p.lastname) from profile p where p.user_id = mes.to_user_id)        as reciver_name,
    mes.from_user_id                                                                                        as user_sender_id,
    (select concat_ws(' ', p2.firstname, p2.lastname) from profile p2 where p2.user_id = mes.from_user_id)  as sender_name,
    mes.mes_count                                                                                           as mes_count
from (
    select
        m.to_user_id,
        m.from_user_id,
        count(m.id) as mes_count
    from message m
    group by m.to_user_id, m.from_user_id
) as mes
group by mes.to_user_id, mes.from_user_id
having max(mes_count) = mes_count
order by mes_count desc;


# 3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
select
    sum(likes_count) as younges_like_sum
from (
    select
        (select count(ul.user_id) from user_like ul where ul.user_id = p.user_id) as likes_count
    from profile p
    order by p.birthday desc
    limit 10
) as youngest_users;


# 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
select
    p.gender,
    sum((select count(ul.user_id) from user_like ul where ul.user_id = p.user_id))
from profile p
group by p.gender;


# 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
select
    user_id,
    (select concat_ws(' ', p.firstname, p.lastname) from profile p where p.user_id = activity.user_id) as user_name,
    sum(count) as total_activity
from (
    select
        user_id,
        count(user_id) as count
    from user_like
    group by user_id

    union all

    select
        from_user_id as user_id,
        count(from_user_id) as count
    from message
    group by from_user_id

    union all

    select
        user_id,
        count(user_id) as count
    from post
    group by user_id

    union all

    select
        from_user_id as user_id,
        count(from_user_id) as count
    from friend_request
    group by from_user_id

    union all

    select
        user_id,
        count(user_id) as count
    from media
    group by user_id

    union all

    select
        user_id,
        count(user_id) as count
    from user_community
    group by user_id
) as activity
group by user_id
order by total_activity
limit 10;

