USE spotify_db;

CREATE TABLE artist (
    id VARCHAR(100) PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    social_media TEXT,
    biography TEXT NOT NULL
);

DESC artist;

CREATE TABLE concert (
    id VARCHAR(100) PRIMARY KEY NOT NULL,
    location POINT NOT NULL,
    event_at DATETIME,
    url VARCHAR(255) NOT NULL,
    longitude POINT,
    latitude POINT
);

CREATE TABLE artist_concert (
    id_artist VARCHAR(100) NOT NULL,
    id_concert VARCHAR(100) NOT NULL
);

ALTER TABLE artist_concert
ADD CONSTRAINT fk_artist_concert_artist
FOREIGN KEY (id_artist) REFERENCES artist (id)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE artist_concert
ADD CONSTRAINT fk_artist_concert_concert
FOREIGN KEY (id_concert) REFERENCES concert (id)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE artist_concert
ADD COLUMN concert_name VARCHAR(255) NOT NULL,
ADD COLUMN artists VARCHAR(255) NOT NULL;

DESC artist_concert;
DESC concert;

INSERT INTO artist VALUES ('AR1', 'Ed Sheeran', 'instagram: https://www.instagram.com/edsheeran', 'Iam Singer');
INSERT INTO artist VALUES ('AR2', 'Coldplay', 'instagram: https://www.instagram.com/coldplay', 'Cold like your ice');
INSERT INTO artist VALUES ('AR3', 'One Republic', 'instagram: https://www.instagram.com/One1', 'I have your violin, take it');

INSERT INTO concert VALUES ('CR1', ST_GeomFromText('POINT(12 11)', 2323), CURRENT_DATE, 'https://laskdjf.ticker', ST_GeomFromText('POINT(12 11)', 2323), ST_GeomFromText('POINT(12 11)', 2323));

INSERT INTO artist_concert VALUES ('AR1', 'CR1', 'Jakarta Fest', 'lkjasdf');

SELECT * FROM artist_concert;