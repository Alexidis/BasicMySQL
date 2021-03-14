-- DROP TABLE vk.post;
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

alter table vk.post add column content_id int unsigned not null references vk.content(id);
