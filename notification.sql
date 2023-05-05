-- Active: 1683209383704@@127.0.0.1@3306@mysql_notification_db
USE mysql_notification_db;

CREATE TABLE user (
    id VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

SHOW TABLES;

ALTER TABLE user
ADD UNIQUE KEY id_unique(id);

INSERT INTO user VALUES
('N002', 'dimas_bjv'),
('N003', 'fatihk');

SELECT * FROM user;
DESC user;

CREATE TABLE notification (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    detail TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    user_id VARCHAR(100)
);

DROP TABLE notification;

ALTER TABLE notification
ADD CONSTRAINT fk_notification_user 
FOREIGN KEY(user_id) REFERENCES user(id)
ON DELETE CASCADE ON UPDATE CASCADE;

DESC notification;

INSERT INTO notification VALUES
(null, 'Contoh Promo', 'Detai Promo', CURRENT_TIMESTAMP, 'N002'),
(null, 'Contoh Pembayaran', 'Detai Pembayaran', CURRENT_TIMESTAMP, 'N003');

SELECT * FROM notification 
WHERE (user_id = 'N003' OR user_id IS NULL) 
ORDER BY created_at DESC;

CREATE TABLE category (
    id VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE notification
ADD COLUMN category_id VARCHAR(100);

DESC notification;

ALTER TABLE notification
ADD CONSTRAINT fk_notification_category
FOREIGN KEY(category_id) REFERENCES category(id);

SELECT * FROM notification;

INSERT INTO category 
VALUES('INFO', 'Info'),('PROMO', 'Promo');

SELECT * FROM category;

UPDATE notification
SET category_id = 'INFO'
WHERE id = 2;

UPDATE notification
SET category_id = 'PROMO'
WHERE id = 3;

UPDATE notification
SET category_id = 'INFO'
WHERE id = 4;

SELECT * FROM notification;

SELECT * FROM notification 
WHERE (user_id = 'N003' OR user_id IS NULL) 
ORDER BY created_at DESC;

SELECT * FROM notification n
JOIN category c ON (c.id = n.category_id)
WHERE (n.user_id = 'N003' OR n.user_id IS NULL)
ORDER BY n.created_at DESC;

SELECT * FROM notification n
JOIN category c ON (c.id = n.category_id)
WHERE (n.user_id = 'N002' OR n.user_id IS NULL AND c.id = 'PROMO')
ORDER BY n.created_at DESC;

CREATE TABLE NotificationRead(
    id INT NOT NULL AUTO_INCREMENT,
    is_read BOOLEAN NOT NULL,
    notification_id INT NOT NULL,
    user_id VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE `NotificationRead`
ADD CONSTRAINT fk_notification_read_notification
FOREIGN KEY(notification_id) REFERENCES notification(id);

ALTER TABLE `NotificationRead`
ADD CONSTRAINT fk_notification_read_user
FOREIGN KEY(user_id) REFERENCES user(id);

DESC NotificationRead;

SELECT * FROM notification;

INSERT INTO `NotificationRead` VALUES
(null, true, 3, 'N002'),
(null, true, 4, 'N003');

SELECT * FROM `NotificationRead`;

SELECT * FROM notification n
JOIN category c ON (c.id = n.category_id)
LEFT JOIN `NotificationRead` nr ON (nr.notification_id = n.id)
WHERE (n.user_id = 'N002' OR n.user_id IS NULL) AND 
    (nr.user_id = 'N002' OR nr.user_id IS NULL)
ORDER BY n.created_at DESC;

SELECT COUNT(*) FROM notification n
JOIN category c ON (c.id = n.category_id)
LEFT JOIN `NotificationRead` nr ON (nr.notification_id = n.id)
WHERE (n.user_id = 'N001' OR n.user_id IS NULL) AND 
    (nr.user_id = 'N001' OR nr.user_id IS NULL)
ORDER BY n.created_at DESC;
