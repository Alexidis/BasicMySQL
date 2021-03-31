
DROP schema if exists shop;
create schema shop;

DROP TABLE IF EXISTS shop.users;
CREATE TABLE shop.users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO shop.users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

DROP TABLE IF EXISTS shop.catalogs;
CREATE TABLE shop.catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO shop.catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');


DROP TABLE IF EXISTS shop.products;
CREATE TABLE shop.products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO shop.products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

DROP schema if exists sample;
create schema sample;

DROP TABLE IF EXISTS sample .users;
CREATE TABLE sample .users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO sample .users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');


# Практическое задание по теме “Транзакции, переменные, представления”


# 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
# Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.


start transaction;
    insert into sample.users (name, birthday_at, created_at, updated_at)
    select name, birthday_at, created_at, updated_at from shop.users as su where su.id = 1;
commit;


# 2. Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.


create or replace view shop.product_description as (
    select
        p.name as prodaut_name,
        c.name as catalog_name
    from shop.products as p
    left join shop.catalogs c on
        c.id = p.catalog_id
);

select * from shop.product_description;


# 3. по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17.
# Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.


# не нашел функции генерации последовательностей
with
     discharged_august as (
        select
            column_0 as target_date
        from (
              values
                  row('2018-08-01'),
                  row('2016-08-04'),
                  row('2018-08-16'),
                  row('2018-08-17')
            ) as target
    ),
     full_august as (
         select
            column_0 as date
        from (
              values
                  row('2018-08-01'),
                  row('2018-08-02'),
                  row('2018-08-03'),
                  row('2018-08-04'),
                  row('2018-08-05'),
                  row('2018-08-06'),
                  row('2018-08-07'),
                  row('2018-08-08'),
                  row('2018-08-09'),
                  row('2018-08-10'),
                  row('2018-08-11'),
                  row('2018-08-12'),
                  row('2018-08-13'),
                  row('2018-08-14'),
                  row('2018-08-15'),
                  row('2018-08-16'),
                  row('2018-08-17'),
                  row('2018-08-18'),
                  row('2018-08-19'),
                  row('2018-08-20'),
                  row('2018-08-21'),
                  row('2018-08-22'),
                  row('2018-08-23'),
                  row('2018-08-24'),
                  row('2018-08-25'),
                  row('2018-08-26'),
                  row('2018-08-27'),
                  row('2018-08-28'),
                  row('2016-08-29'),
                  row('2018-08-30'),
                  row('2018-08-31')
            ) as august
     )
select
    fa.date,
    if(da.target_date is null, 0, 1)
from full_august fa
left join discharged_august da on
    da.target_date = fa.date;


# 4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.


# Для большой таблицы я бы так не делал, но там зависит он индексов в таблице
with fresh_five as (
    select
        id
    from shop.users
    order by created_at desc
    limit 5
    )
delete u
from shop.users u
where u.id not in (select id from fresh_five);


# Практическое задание по теме “Хранимые процедуры и функции, триггеры"


# 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
# С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
# с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
# с 18:00 до 00:00 — "Добрый вечер",
# с 00:00 до 6:00 — "Доброй ночи".


DROP FUNCTION IF EXISTS example.greetings;
create FUNCTION example.greetings(current_hour time)
 returns varchar(256) DETERMINISTIC
begin
    declare c_hour time;
    declare greeting_text varchar(256);
    set c_hour = coalesce(current_hour, current_time());

    set greeting_text  =
        case
            when c_hour between time('6:00') and time('12:00') then 'Доброе утро'
            when c_hour between time('12:00') and time('18:00') then 'Добрый день'
            when c_hour between time('18:00') and time('23:59:59') then 'Добрый вечер'
            when c_hour between time('0:00') and time('6:00' )then 'Доброй ночи'
        end;
    return greeting_text;
end;

select
    example.greetings('08:12'),
    example.greetings('15:12'),
    example.greetings('22:12'),
    example.greetings('01:12');


# 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
# Допустимо присутствие обоих полей или одно из них.
# Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
# Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
# При попытке присвоить полям NULL-значение необходимо отменить операцию.

drop trigger if exists shop.check_names_tr_bi;
create trigger shop.check_names_tr_bi
before insert on shop.products
FOR EACH ROW
BEGIN
   IF nullif(new.name, '') is null and nullif(new.description, '') is null THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Хотя бы однго из полей name или description должно быть заполнено';
   END IF;
END;

drop trigger if exists shop.check_names_tr_bu;
create trigger shop.check_names_tr_bu
before update
on shop.products
FOR EACH ROW
BEGIN
   IF nullif(new.name, '') is null and nullif(new.description, '') is null THEN
       set new.name = old.name;
       set new.description = old.description;
   END IF;
END;

insert into shop.products (name, description)
values (null, null);

select name, description from shop.products where id = 1;

update shop.products
set name = null,
    description = null
where id = 1;

select name, description from shop.products where id = 1;







DROP TABLE shop.users;
DROP TABLE shop.catalogs;
DROP TABLE shop.products;
DROP TABLE sample.users;
