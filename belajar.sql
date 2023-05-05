-- Active: 1683209641719@@127.0.0.1@3306@belajar_database
SHOW DATABASES;

USE belajar_database;
SELECT * FROM barang;
DESC barang;
INSERT INTO barang 
    VALUES (null, "Bakso Ayam", 10000, 500, CURRENT_DATE, CURRENT_TIMESTAMP),
            (null, "Bakso Sapi", 15000, 200, CURRENT_DATE, CURRENT_TIMESTAMP),
            (null, "Bakso Kalkun", 25000, 100, CURRENT_DATE, CURRENT_TIMESTAMP);
SELECT nama, harga, quantity as "stok" FROM barang WHERE (quantity > 80 OR nama LIKE '%n') AND harga > 12000;
SELECT nama, harga, quantity as "stok" FROM barang WHERE harga BETWEEN 12000 AND 30000;
SELECT nama, harga, quantity as "stok" FROM barang ORDER BY harga ASC, quantity DESC;
SELECT DISTINCT UPPER(nama) as "Kolom nama", LENGTH(nama) as "Besar value nama" FROM barang WHERE harga >= 10000 LIMIT 4;
ALTER TABLE barang ADD COLUMN created_at DATETIME AFTER quantity;
ALTER TABLE barang ADD COLUMN updated_at TIMESTAMP AFTER created_at;
SELECT id, nama, EXTRACT (MONTH FROM created_at) as 'Month' FROM barang;
SELECT id, nama, harga, MONTH(updated_at) as "Month" FROM barang;
SELECT id, nama, 
    CASE harga
        WHEN 10000 THEN "Murmer kakak"
        WHEN 25000 THEN "Mahal Njing"
        ELSE "Lah!?"
        END AS "Harga"
FROM barang;

SELECT id, 
    nama,
    harga,
    IF (harga > 10000, 'Mahal Bangett',
        IF (harga < 20000, 'Murah Banget', 'Diborong, gratis kak')
        ) AS 'Mahal?'
FROM barang;

SELECT id, nama, IFNULL(harga, "Gratis") FROM barang;

SELECT nama, MAX(quantity) AS Stok FROM barang GROUP BY nama HAVING Stok > 120;

SHOW TABLES;