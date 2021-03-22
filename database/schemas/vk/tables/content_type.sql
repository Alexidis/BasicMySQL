-- DROP TABLE vk.content_type;
CREATE TABLE vk.content_type (
    id smallint unsigned NOT NULL AUTO_INCREMENT,
    name varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Типы контента';
