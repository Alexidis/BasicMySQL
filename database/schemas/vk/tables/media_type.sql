-- DROP TABLE vk.media_type;
CREATE TABLE vk.media_type (
    id int unsigned NOT NULL AUTO_INCREMENT,
    name varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Типы медиа файлов';
