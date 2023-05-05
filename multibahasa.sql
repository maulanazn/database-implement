CREATE DATABASE multibahasa;

use multibahasa;

CREATE TABLE categories(
    id VARCHAR(100),
    position INT,
    PRIMARY KEY(id)
);

DESC categories;

INSERT INTO categories VALUES
('FOOD', 1),
('GADGET', 2),
('FASHION', 3);

SELECT * FROM categories ORDER BY position;

CREATE TABlE CategoriesTranslations(
    category_id VARCHAR(100) NOT NULL,
    language VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    PRIMARY KEY(category_id, language)
);

DESC CategoriesTranslations;

ALTER TABLE `CategoriesTranslations`
ADD CONSTRAINT fk_categories_translations
FOREIGN KEY(category_id) REFERENCES categories(id);

SELECT * FROM categories c JOIN `CategoriesTranslations` ct ON (ct.category_id = c.id) WHERE (ct.language = 'en_US');

INSERT INTO `CategoriesTranslations` VALUES
    ('FOOD', 'in_ID', 'Makanan' ,'Deskripsi Makanan'),
    ('GADGET', 'in_ID', 'Gawai' ,'Deskripsi Gawai'),
    ('FASHION', 'in_ID', 'Gaya' ,'Deskripsi Pakaian'),
    ('FOOD', 'en_US', 'Food' ,'Description of Food'),
    ('GADGET', 'en_US', 'Gadget' ,'Description of Gadget'),
    ('FASHION', 'en_US', 'Fashion' ,'Description of Fashion');