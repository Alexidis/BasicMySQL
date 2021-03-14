-- DROP TABLE vk.media;
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

alter table vk.media add column content_id int unsigned not null references vk.content(id);
