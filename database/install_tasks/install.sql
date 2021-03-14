create schema vk
CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Данные пользователей для авторизации';

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

CREATE TABLE vk.friend_request
(
    from_user_id int unsigned NOT NULL,
    to_user_id   int unsigned NOT NULL,
    status       tinyint(1)   NOT NULL DEFAULT '0' COMMENT '-1 - отказ\n0 - запрос\n1 - дружба',
    created_at   datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at   datetime              DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (from_user_id, to_user_id),
    KEY fk_friend_request_user1_idx (from_user_id),
    KEY fk_friend_request_user2_idx (to_user_id),
    CONSTRAINT fk_friend_request_user1 FOREIGN KEY (from_user_id) REFERENCES vk.user (id),
    CONSTRAINT fk_friend_request_user2 FOREIGN KEY (to_user_id) REFERENCES vk.user (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Запрос в друзья';

CREATE TABLE vk.message (
    id int unsigned NOT NULL AUTO_INCREMENT,
    from_user_id int unsigned NOT NULL,
    to_user_id int unsigned NOT NULL,
    text text COLLATE utf8mb4_unicode_ci,
    created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    deleted_at datetime DEFAULT NULL,
    PRIMARY KEY (id),
    KEY fk_message_user1_idx (from_user_id),
    KEY fk_message_user2_idx (to_user_id),
    CONSTRAINT fk_message_user1 FOREIGN KEY (from_user_id) REFERENCES vk.user (id),
    CONSTRAINT fk_message_user2 FOREIGN KEY (to_user_id) REFERENCES vk.user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Сообщения';

CREATE TABLE vk.community (
    id int unsigned NOT NULL AUTO_INCREMENT,
    name varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
    description varchar(245) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    admin_id int unsigned NOT NULL,
    PRIMARY KEY (id),
    KEY fk_community_user1_idx (admin_id),
    CONSTRAINT fk_community_user1 FOREIGN KEY (admin_id) REFERENCES vk.user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Сообщества';

CREATE TABLE vk.user_community (
    community_id int unsigned NOT NULL,
    user_id int unsigned NOT NULL,
    PRIMARY KEY (community_id,user_id),
    KEY fk_user_community_community1_idx (community_id),
    KEY fk_user_community_user1_idx (user_id),
    CONSTRAINT fk_user_community_community1 FOREIGN KEY (community_id) REFERENCES vk.community (id),
    CONSTRAINT fk_user_community_user1 FOREIGN KEY (user_id) REFERENCES vk.user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Подписчики сообщества';

CREATE TABLE vk.media_type (
    id int unsigned NOT NULL AUTO_INCREMENT,
    name varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Типы медиа файлов';

CREATE TABLE vk.media (
    id int unsigned NOT NULL AUTO_INCREMENT,
    media_type_id int unsigned NOT NULL,
    user_id int unsigned NOT NULL,
    url varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '\\files\\2020\\01\\file.jpg',
    data blob,
    metadata json DEFAULT NULL,
    created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY fk_media_media_type1_idx (media_type_id),
    KEY fk_media_user1_idx (user_id),
    CONSTRAINT fk_media_media_type1 FOREIGN KEY (media_type_id) REFERENCES vk.media_type (id),
    CONSTRAINT fk_media_user1 FOREIGN KEY (user_id) REFERENCES vk.user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Медиа файлы';

CREATE TABLE vk.post (
    id int unsigned NOT NULL AUTO_INCREMENT,
    user_id int unsigned NOT NULL,
    community_id int unsigned DEFAULT NULL,
    post_id int unsigned DEFAULT NULL,
    text text COLLATE utf8mb4_unicode_ci,
    media_id int unsigned DEFAULT NULL,
    created_at datetime DEFAULT NULL,
    PRIMARY KEY (id),
    KEY fk_post_user1_idx (user_id),
    KEY fk_post_community1_idx (community_id),
    KEY fk_post_media1_idx (media_id),
    KEY fk_post_post1_idx (post_id),
    CONSTRAINT fk_post_community1 FOREIGN KEY (community_id) REFERENCES vk.community (id),
    CONSTRAINT fk_post_media1 FOREIGN KEY (media_id) REFERENCES vk.media (id),
    CONSTRAINT fk_post_post1 FOREIGN KEY (post_id) REFERENCES vk.post (id),
    CONSTRAINT fk_post_user1 FOREIGN KEY (user_id) REFERENCES vk.user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Публикация';

CREATE TABLE vk.content_type (
    id smallint unsigned NOT NULL AUTO_INCREMENT,
    name varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Типы контента';

CREATE TABLE vk.content (
    id int unsigned NOT NULL AUTO_INCREMENT,
    content_type_id smallint unsigned not null,
    PRIMARY KEY (id),
    CONSTRAINT fk_content_type FOREIGN KEY (content_type_id) REFERENCES vk.content_type (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Контент';

CREATE TABLE vk.user_like (
    user_id int unsigned NOT NULL,
    content_id int unsigned not null,
    created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, content_id),
    CONSTRAINT fk_user_like_user FOREIGN KEY (user_id) REFERENCES vk.user (id),
    CONSTRAINT fk_user_like_content FOREIGN KEY (content_id) REFERENCES vk.content (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Лайки пользователей';

alter table vk.user add column content_id int unsigned not null references vk.content(id);
alter table vk.media add column content_id int unsigned not null references vk.content(id);
alter table vk.post add column content_id int unsigned not null references vk.content(id);



