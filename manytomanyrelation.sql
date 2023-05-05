USE belajar_database;

DESC barang;
DESC orders;
DESC orders_detail;

CREATE TABLE orders (
    id INT NOT NULL AUTO_INCREMENT,
    total INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE orders_detail (
    id_barang INT(100) NOT NULL,
    id_order INT(100) NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(id_barang, id_order)
);

ALTER TABLE orders_detail
    ADD CONSTRAINT fk_orders_detail_barang
        FOREIGN KEY(id_barang) REFERENCES barang(id);

ALTER TABLE orders_detail
    ADD CONSTRAINT fk_orders_detail_orders
        FOREIGN KEY(id_order) REFERENCES orders(id);
    
SELECT barang.nama, barang.harga, orders.order_date, orders.total FROM orders_detail 
JOIN barang ON (barang.id = orders_detail.id_barang) 
JOIN orders ON (orders.id = orders_detail.id_order);