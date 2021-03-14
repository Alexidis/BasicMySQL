-- DROP TABLE vk.profile;
CREATE TABLE vk.profile (
    user_id int unsigned NOT NULL,
    firstname varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
    lastname varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
    gender enum('m','f','x') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'x',
    birthday date NOT NULL,
    address varchar(245) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (user_id),
    CONSTRAINT fk_profile_user FOREIGN KEY (user_id) REFERENCES vk.user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Профили пользователей';
