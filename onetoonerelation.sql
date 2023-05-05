USE belajar_database;

CREATE TABLE dompet(
    id INT NOT NULL AUTO_INCREMENT,
    id_users INT NOT NULL,
    balance INT NOT NULL DEFAULT 0,
    PRIMARY KEY(id),
    UNIQUE KEY fk_id_users_unique(id_users),
    CONSTRAINT fk_dompet_users
        FOREIGN KEY(id_users) REFERENCES users(id)
            ON DELETE CASCADE ON UPDATE CASCADE
);

DESC dompet;

SELECT users.username, dompet.id_users, dompet.balance FROM dompet JOIN users ON(users.id = dompet.id_users);