USE spotify_db;

CREATE TABLE user (
    id VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    birthday DATE,
    PRIMARY KEY(id)
);

CREATE TABLE podcast(
    id VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    about TEXT,
    image VARCHAR(255),
    user_id VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_user_podcast
    FOREIGN KEY(user_id) REFERENCES user(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `user` VALUES('A1', 'maulanazn@gmail.com', 'maulanazn', CURRENT_DATE),
('P1', 'Maulanazn Podcast', 'Technical Talk', 'https://blabla.sdfdsa/mangga.png', 'A1'),
('P2', 'FatihKP', 'Nyantai', 'https://blabla.sdfdsa/mangga.png', 'A1');

SELECT * FROM podcast 
JOIN user ON (user.id = podcast.user_id);

CREATE TABLE episode(
    id VARCHAR(255) NOT NULL,
    id_podcast VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    published_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    duration INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_podcast_episode
    FOREIGN KEY (id_podcast) REFERENCES podcast(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO episode VALUES
('EP4', 'P1', 'Bicara Tentang Lebah', 'Apa lebah terbesar di dunia?', CURRENT_TIMESTAMP, 600),
('EP5', 'P1', 'Bicara Tentang Kucing', 'Kucing si hewan jahil', CURRENT_TIMESTAMP, 600);

INSERT INTO episode VALUES
('EP1', 'P2', 'Ke indrokilo', 'Jalan-jalan', CURRENT_TIMESTAMP, 600),
('EP2', 'P2', 'Kesan dan Pesan untuk Presiden amerika', 'Presiden amerika itu teroris', CURRENT_TIMESTAMP, 600);

SELECT * FROM episode;

CREATE TABLE podcast_genre (
    id VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    podcast_id VARCHAR(255) NOT NULL,
    PRIMARY KEY(id, podcast_id),
    CONSTRAINT fk_podcast_genre_podcast
    FOREIGN KEY(podcast_id) REFERENCES podcast(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

DESC podcast_genre;

INSERT INTO podcast_genre VALUES
('PG1', 'Serious Shit', 'https://picsum/sdfsdf.png', 'P1');

SELECT * FROM episode WHERE podcast_id = 'P1';

SELECT podcast_genre.name AS genre, podcast.name AS podcast FROM podcast_genre
JOIN podcast ON (podcast.id = podcast_genre.podcast_id) WHERE podcast.id = 'P1' GROUP BY podcast_genre.id;

SELECT podcast.name AS podcast, COUNT(episode.id) AS episode FROM podcast 
JOIN episode ON (episode.id_podcast = podcast.id) WHERE episode.id_podcast = 'P1' AND podcast.user_id = 'A1';

SELECT user.id AS Account, COUNT(podcast.id) AS Podcast FROM `user` 
JOIN podcast ON (podcast.user_id = user.id)
WHERE podcast.user_id = 'A1';