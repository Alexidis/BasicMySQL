-- DROP TABLE vk.content;
CREATE TABLE vk.content (
    id int unsigned NOT NULL AUTO_INCREMENT,
    content_type_id smallint unsigned not null,
    PRIMARY KEY (id),
    CONSTRAINT fk_content_type FOREIGN KEY (content_type_id) REFERENCES vk.content_type (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Контент';
