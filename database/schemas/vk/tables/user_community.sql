-- DROP TABLE vk.user_community;
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
