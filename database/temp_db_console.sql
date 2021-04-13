# Практическое задание по теме “Оптимизация запросов”

# 1. Создайте таблицу logs типа Archive.
#     Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается
#         время и дата создания записи,
#         название таблицы,
#         идентификатор первичного ключа и
#         содержимое поля name.

DROP schema if exists shop;
create schema shop;

drop table if exists shop.logs;
create table shop.logs (

    created_at datetime default now(),
    table_name varchar(45),
    table_fk_id bigint,
    logged_name varchar(45)

) ENGINE=Archive DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS shop.users;
CREATE TABLE shop.users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';


drop trigger if exists shop.user_creation;
create trigger shop.user_creation
after insert on shop.users
FOR EACH ROW
BEGIN
   insert into shop.logs (table_name, table_fk_id, logged_name)
   values ('users', new.id, new.name);
END;


DROP TABLE IF EXISTS shop.catalogs;
CREATE TABLE shop.catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';


drop trigger if exists shop.catalogs_creation;
create trigger shop.catalogs_creation
after insert on shop.catalogs
FOR EACH ROW
BEGIN
   insert into shop.logs (table_name, table_fk_id, logged_name)
   values ('catalogs', new.id, new.name);
END;


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


drop trigger if exists shop.products_creation;
create trigger shop.products_creation
after insert on shop.products
FOR EACH ROW
BEGIN
   insert into shop.logs (table_name, table_fk_id, logged_name)
   values ('products', new.id, new.name);
END;


INSERT INTO shop.users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');


INSERT INTO shop.catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');


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


select * from shop.logs;



DROP TABLE shop.users;
DROP TABLE shop.catalogs;
DROP TABLE shop.products;
DROP TABLE shop.logs;


[
  {
      "name" : 'Процессоры',
      "products": [
          {
              "name" : "Intel Core i3-8100"
              "description" : "Процессор для настольных персональных компьютеров, основанных на платформе Intel."
              "price" : 7890.00
          },
          {
              "name" : "Intel Core i5-7400"
              "description" : "Процессор для настольных персональных компьютеров, основанных на платформе Intel."
              "price" : 12700.00
          },
          {
              "name" : "AMD FX-8320E"
              "description" : "Процессор для настольных персональных компьютеров, основанных на платформе AMD."
              "price" : 4780.00
          },
          {
              "name" : "AMD FX-8320"
              "description" : "Процессор для настольных персональных компьютеров, основанных на платформе AMD."
              "price" : 7120.00
          }
      ]
  },
  {
      "name" : 'Материнские платы'
      "products": [
        {
            "name" : "Gigabyte H310M S2H"
            "description" : "Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX"
            "price" : 4790.00
        },
        {
            "name" : "MSI B250M GAMING PRO"
            "description" : "Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX"
            "price" : 4790.00
        },
        {
            "name" : "ASUS ROG MAXIMUS X HERO"
            "description" : "Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX"
            "price" : 19310.00
        }
      ]
  },
  {
    "name" : 'Видеокарты'
    "products": []
  },
  {
    "name" : 'Жесткие диски'
    "products": []
  },
  {
    "name" : 'Оперативная память'
    "products": []
  }
]
