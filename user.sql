USE belajar_database;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY email_unique(email)
);

SELECT * FROM users;
SELECT * FROM barang;

ALTER TABLE users ADD COLUMN phonenumber INT(100), 
ADD COLUMN created_at DATETIME, 
ADD COLUMN updated_at TIMESTAMP;
ALTER TABLE users ADD CONSTRAINT username_unique UNIQUE(username);
ALTER TABLE users ADD CONSTRAINT phonenumber_unique UNIQUE(phonenumber);
ALTER TABLE users DROP CONSTRAINT username_unique;
ALTER TABLE barang ADD CONSTRAINT harga_cek CHECK(harga >= 1000);
ALTER TABLE barang ADD FULLTEXT cari_barang(nama);

DESC barang;

SELECT * FROM barang WHERE MATCH(nama) AGAINST('bakso' WITH QUERY EXPANSION);