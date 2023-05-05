USE belajar_database;

DESC barang;
DESC users;

SELECT * FROM barang;
SELECT * FROM users;

CREATE TABLE wishlist (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_barang INT(10) NOT NULL,
    description TEXT,
    CONSTRAINT fk_wishlist_barang
        FOREIGN KEY(id_barang) REFERENCES barang(id)
) ENGINE = INNODB;

DESC wishlist;

ALTER TABLE wishlist
    ADD CONSTRAINT fk_wishlist_barang
        FOREIGN KEY(id_barang) REFERENCES barang(id)
            ON DELETE CASCADE ON UPDATE CASCADE;

SELECT barang.id, barang.nama, wishlist.description FROM barang JOIN wishlist ON (wishlist.id_barang = barang.id);

ALTER TABLE wishlist ADD COLUMN id_users INT;

ALTER TABLE wishlist ADD CONSTRAINT fk_wishlist_users FOREIGN KEY(id_users) REFERENCES users(id);

SELECT users.username, barang.nama, wishlist.id_users, wishlist.id_barang FROM wishlist 
JOIN users ON (users.id = wishlist.id_users) 
JOIN barang ON (barang.id = wishlist.id_barang);