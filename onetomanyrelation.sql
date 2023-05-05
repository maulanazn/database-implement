USE belajar_database;

DESC barang;

CREATE TABLE categories (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE barang 
    ADD COLUMN id_category INT(100);

ALTER TABLE barang 
    DROP COLUMN id_category;

ALTER TABLE barang
    ADD CONSTRAINT fk_barang_category
        FOREIGN KEY(id_category) REFERENCES categories(id)
            ON DELETE CASCADE ON UPDATE CASCADE;

SELECT barang.nama AS "Barang", categories.name AS "Kategori" FROM categories JOIN barang ON (barang.id_category = categories.id);
