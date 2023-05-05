CREATE DATABASE motel;

USE motel;

CREATE TABLE guestbooks (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    PRIMARY KEY(id)
);

ALTER TABLE guestbooks
    ADD FULLTEXT(email, title);

CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    FULLTEXT(fullname, email),
    PRIMARY KEY(id)
);

CREATE TABLE customers_record(
    id_guestbooks INT NOT NULL,
    id_customers INT NOT NULL,
    total INT NOT NULL,
    PRIMARY KEY(id_guestbooks, id_customers),
    CONSTRAINT fk_customers_record_guestbooks
        FOREIGN KEY(id_guestbooks) REFERENCES guestbooks(id),
    CONSTRAINT fk_customers_record_customers
        FOREIGN KEY(id_customers) REFERENCES customers(id)
);

START TRANSACTION;

INSERT INTO customers VALUES
(null, "Fatih Kurniawan", "fatihkk@example.org"),
(null, "Ronald", "ronald_dj@example.org"),
(null, "Agit Super", "agitss@example.org");
LOCK TABLE customers WRITE;

COMMIT;

START TRANSACTION;

INSERT INTO guestbooks VALUES
(null, (SELECT email FROM customers WHERE id = 4), "Menginap", "kamar NO 10"),
(null, (SELECT email FROM customers WHERE id = 5), "Menginap", "kamar NO 12"),
(null, (SELECT email FROM customers WHERE id = 6), "Menginap", "kamar NO 6");
LOCK TABLE guestbooks WRITE;
COMMIT;


SELECT email FROM guestbooks
UNION
SELECT fullname FROM customers;

SELECT customers.id, guestbooks.title, guestbooks.content FROM customers_record 
RIGHT JOIN customers ON (customers.id = customers_record.id_customers) 
RIGHT JOIN guestbooks ON (guestbooks.id = customers_record.id_guestbooks);