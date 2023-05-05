USE belajar_database;

SELECT * FROM barang WHERE harga > (SELECT AVG(harga) FROM barang);
