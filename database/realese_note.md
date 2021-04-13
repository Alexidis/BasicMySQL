***
### Практическое задание по теме “Оптимизация запросов”
### Задание 1
1. Задание в файле \database\temp_db_console.sql.

### Практическое задание по теме “NoSQL”

### Задание 1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.

```
> set ip:192.168.0.0 1
OK
> incr ip:192.168.0.0
(integer) 2
> incr ip:192.168.0.0
(integer) 3
> set ip:192.168.0.1 1
OK
> incr ip:192.168.0.1
(integer) 2
> get ip:192.168.0.0
"3"
> get ip:192.168.0.1
"2"
```

### Задание 2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса пользователя по его имени.
```
> set name e@mail.ru
> 
OK
> set e@mail.ru name
OK
> get name
"e@mail.ru"
> get e@mail.ru
"name"
```

### Задание 3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.

Созданая структура

```
[
  {
    "name": "Процессоры",
    "products": [
      {
        "name": "Intel Core i3-8100",
        "description": "Процессор для настольных персональных компьютеров, основанных на платформе Intel.",
        "price": 7890.00
      },
      {
        "name": "Intel Core i5-7400",
        "description": "Процессор для настольных персональных компьютеров, основанных на платформе Intel.",
        "price": 12700.00
      },
      {
        "name": "AMD FX-8320E",
        "description": "Процессор для настольных персональных компьютеров, основанных на платформе AMD.",
        "price": 4780.00
      },
      {
        "name": "AMD FX-8320",
        "description": "Процессор для настольных персональных компьютеров, основанных на платформе AMD.",
        "price": 7120.00
      }
    ]
  },
  {
    "name": "Материнские платы",
    "products": [
      {
        "name": "Gigabyte H310M S2H",
        "description": "Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX",
        "price": 4790.00
      },
      {
        "name": "MSI B250M GAMING PRO",
        "description": "Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX",
        "price": 4790.00
      },
      {
        "name": "ASUS ROG MAXIMUS X HERO",
        "description": "Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX",
        "price": 19310.00
      }
    ]
  },
  {
    "name": "Видеокарты",
    "products": []
  },
  {
    "name": "Жесткие диски",
    "products": []
  },
  {
    "name": "Оперативная память",
    "products": []
  }
]
```

Объект в монге
```
[
  {
    "_id": ObjectId("5a934e000102030405000000"),
    "name": "Процессоры",
    "products": [
      {
        "description": "Процессор для настольных персональных компьютеров, основанных на платформе Intel.",
        "name": "Intel Core i3-8100",
        "price": 7890
      },
      {
        "description": "Процессор для настольных персональных компьютеров, основанных на платформе Intel.",
        "name": "Intel Core i5-7400",
        "price": 12700
      },
      {
        "description": "Процессор для настольных персональных компьютеров, основанных на платформе AMD.",
        "name": "AMD FX-8320E",
        "price": 4780
      },
      {
        "description": "Процессор для настольных персональных компьютеров, основанных на платформе AMD.",
        "name": "AMD FX-8320",
        "price": 7120
      }
    ]
  },
  {
    "_id": ObjectId("5a934e000102030405000001"),
    "name": "Материнские платы",
    "products": [
      {
        "description": "Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX",
        "name": "Gigabyte H310M S2H",
        "price": 4790
      },
      {
        "description": "Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX",
        "name": "MSI B250M GAMING PRO",
        "price": 4790
      },
      {
        "description": "Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX",
        "name": "ASUS ROG MAXIMUS X HERO",
        "price": 19310
      }
    ]
  },
  {
    "_id": ObjectId("5a934e000102030405000002"),
    "name": "Видеокарты",
    "products": []
  },
  {
    "_id": ObjectId("5a934e000102030405000003"),
    "name": "Жесткие диски",
    "products": []
  },
  {
    "_id": ObjectId("5a934e000102030405000004"),
    "name": "Оперативная память",
    "products": []
  }
]
```
