-- DROP TABLE vk.friend_request;
CREATE TABLE vk.friend_request (
    from_user_id int unsigned NOT NULL,
    to_user_id int unsigned NOT NULL,
    status tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1 - отказ\n0 - запрос\n1 - дружба',
    created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (from_user_id,to_user_id),
    KEY fk_friend_request_user1_idx (from_user_id),
    KEY fk_friend_request_user2_idx (to_user_id),
    CONSTRAINT fk_friend_request_user1 FOREIGN KEY (from_user_id) REFERENCES vk.user (id),
    CONSTRAINT fk_friend_request_user2 FOREIGN KEY (to_user_id) REFERENCES vk.user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Запрос в друзья';
