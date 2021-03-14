-- DROP TABLE vk.community;
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
