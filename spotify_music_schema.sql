USE spotify_db;

CREATE TABLE artist (
    id VARCHAR(100) PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    social_media TEXT,
    biography TEXT NOT NULL
);

CREATE TABLE concert (
    id VARCHAR(100) PRIMARY KEY NOT NULL,
    location POINT NOT NULL,
    event_at DATETIME,
    url VARCHAR(255) NOT NULL,
    longitude POINT,
    latitude POINT
);

INSERT INTO artist VALUES ('AR1', 'Ed Sheeran', 'instagram: https://www.instagram.com/edsheeran', 'Iam Singer'),
('AR2', 'Coldplay', 'instagram: https://www.instagram.com/coldplay', 'Cold like your ice'),
('AR3', 'One Republic', 'instagram: https://www.instagram.com/One1', 'I have your violin, take it');

INSERT INTO concert VALUES 
('CR1', ST_GeomFromText('POINT(12 11)', 2323), CURRENT_DATE, 'https://laskdjf.ticker', ST_GeomFromText('POINT(12 11)', 2323), ST_GeomFromText('POINT(12 11)', 2323));

CREATE TABLE song (
    id VARCHAR(100) NOT NULL,
    title VARCHAR(255) NOT NULL,
    duration INT NOT NULL
);

INSERT INTO song VALUES 
('SO1', 'Supermarket Flower', 12232),
('SO2', 'Shape of Me', 989);

CREATE TABLE song_artist(
    id_artist VARCHAR(100) NOT NULL,
    id_song VARCHAR(100) NOT NULL,
    artist VARCHAR(100) NOT NULL,
    song VARCHAR(255) NOT NULL,
    CONSTRAINT fk_song_artist_artist
    FOREIGN KEY (id_artist) REFERENCES artist(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_song_artist_song
    FOREIGN KEY (id_song) REFERENCES song(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO song_artist VALUES 
('AR1', 'SO1', (SELECT name FROM artist WHERE artist.id = 'AR1'), (SELECT title FROM song WHERE id = 'SO1')),
('AR1', 'SO2', (SELECT name FROM artist WHERE artist.id = 'AR1'), (SELECT title FROM song WHERE id = 'SO2'));

SELECT id_artist, artist, song FROM song_artist;

CREATE TABLE album (
    id VARCHAR(100) NOT NULL,
    imageUrl VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    release DATETIME DEFAULT CURRENT_DATE
);