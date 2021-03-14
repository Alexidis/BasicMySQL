-- DROP TABLE vk.user;
CREATE TABLE vk.user (
    id int unsigned NOT NULL AUTO_INCREMENT,
    email varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
    phone bigint NOT NULL,
    password_hash char(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at datetime DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY email_UNIQUE (email),
    UNIQUE KEY phone_UNIQUE (phone)
)
ENGINE=InnoDB DEFAULT
CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci
COMMENT='Комментарий таблицы';

alter table vk.user add column content_id int unsigned not null references vk.content(id);
