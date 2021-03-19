# Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»

/* 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
*/

# У нас в таблице user нет поля updated_at, поэтому заполню только created_at и только для одного пользователя
update vk.user
set created_at = now()
where id = 1;


/* 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и
      в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME,
      сохранив введённые ранее значения.
*/

# добавляю новые колонки в которых будут данные для задания
alter table vk.user add column created_at_text varchar(16);
alter table vk.user add column created_at_new datetime;


# заносим данные для колонки в тексте
update vk.user
set created_at_text = convert(DATE_FORMAT(created_at, '%d.%m.%Y %k:%i'), char(16));

# проверяем результат
select created_at, created_at_text from vk.user;

# обновляем данные в колонке с датами на основании колонки с текстом
update vk.user
set created_at_new = STR_TO_DATE(created_at_text, '%d.%m.%Y %k:%i');

# проверяем результат
select
    created_at,
    created_at_text,
    created_at_new,
    DATE_FORMAT(created_at_new, '%d.%m.%Y %k:%i')  = DATE_FORMAT(created_at, '%d.%m.%Y %k:%i') as is_equal
from vk.user;

# убираем лишние колонки
alter table vk.user drop column created_at_text;
alter table vk.user drop column created_at_new;


/* 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
      0, если товар закончился и выше нуля, если на складе имеются запасы.
      Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
      Однако нулевые запасы должны выводиться в конце, после всех записей.
*/

# для таблицы storehouses_products запрос будет выглядеть вот так
select
    value
from storehouses_products
order by -nullif(value, 0) desc;

# но так как самой таблицы я не создал то проверить его можно на vk.friend_request,
# приравняв значение 13 (для примера) к null
select
    from_user_id
from vk.friend_request
order by -nullif(from_user_id, 13) desc;


/* 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
      Месяцы заданы в виде списка английских названий (may, august)
*/

# что бы снова не создавать новое поле воспользуемся CTE
with string_month as (
    select
        user_id,
        firstname,
        lastname,
        gender,
        birthday,
        address,
        date_format(birthday, '%M') month_of_birth
    from vk.profile
)

select
    user_id,
    firstname,
    lastname,
    gender,
    birthday,
    address,
    date_format(birthday, '%M') month_of_birth
from string_month
where month_of_birth in ('may', 'august');


/* 5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса.
      SELECT * FROM catalogs WHERE id IN (5, 1, 2);
      Отсортируйте записи в порядке, заданном в списке IN.
*/

# снова что бы не создавать таблицу используем CTE
with catalogs as (
    select
        column_0 as id,
        column_1 as name
    from (
        VALUES
            ROW (1, 'Процессоры'),
            ROW (2, 'Материнские платы'),
            ROW (3, 'Видеокарты'),
            ROW (4, 'Жесткие диски'),
            ROW (5, 'Оперативная память')
        ) as q
)
SELECT
    id,
    name
FROM catalogs
WHERE id IN (5, 1, 2)
order by FIELD(id, 5, 1, 2);



# Практическое задание теме «Агрегация данных»
/* 1. Подсчитайте средний возраст пользователей в таблице users.*/

select
    round(avg(timestampdiff(year, birthday, current_date)), 2)
from vk.profile;



/* 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
      Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/

# находим день недели в текущем году, и группируем по нему
select
    DAYNAME(birthday + INTERVAL (year(current_date) - YEAR(birthday)) year) as dow,
    count(*) as total_birthdays
from vk.profile
group by dow
order by total_birthdays desc;


/* 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы.*/

# честно слямзино с просторов интернета))
with some_table as (
    select
        column_0 as nums
    from (
        VALUES
            ROW (1),
            ROW (2),
            ROW (3),
            ROW (4),
            ROW (5)
        ) as q
)

select
    round(
        IF(MIN(nums) = 0, 0,
           EXP(SUM(Log(abs(nums)))) * round(0.5 - count(nullif(sign(sign(nums) + 0.5), 1)) % 2, 0)),
        2) as mull
from some_table;
