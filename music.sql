
DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;


CREATE TABLE artists (
id SERIAL8 primary key,
name varchar(255)
);

CREATE TABLE albums (
id SERIAL8 primary key,
title varchar(255),
genre varchar(255),
artist_id INT8 references artists(id)
);