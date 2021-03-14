-- DROP TABLE vk.message;
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
