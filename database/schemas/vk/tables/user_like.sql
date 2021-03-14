-- DROP TABLE vk.user_like;
CREATE TABLE vk.user_like (
    user_id int unsigned NOT NULL,
    content_id int unsigned not null,
    created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, content_id),
    CONSTRAINT fk_user_like_user FOREIGN KEY (user_id) REFERENCES vk.user (id),
    CONSTRAINT fk_user_like_content FOREIGN KEY (content_id) REFERENCES vk.content (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Лайки пользователей';

