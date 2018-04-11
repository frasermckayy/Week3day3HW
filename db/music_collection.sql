DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
id SERIAL PRIMARY KEY,
name VARCHAR (255),
genre VARCHAR (255),
age INT
);

CREATE TABLE albums(
id SERIAL PRIMARY KEY,
album_name VARCHAR,
song_title VARCHAR,
artist_id INT REFERENCES artists(id)
);
