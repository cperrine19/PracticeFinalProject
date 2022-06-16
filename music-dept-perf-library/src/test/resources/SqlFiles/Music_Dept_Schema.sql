CREATE SCHEMA IF NOT EXISTS music_dept_perf_library;
USE music_dept_perf_library;

DROP TABLE IF EXISTS performances;
DROP TABLE IF EXISTS song_title_type;
DROP TABLE IF EXISTS composer;
DROP TABLE IF EXISTS performer;
DROP TABLE IF EXISTS song_type;
DROP TABLE IF EXISTS composer_song_title;
DROP TABLE IF EXISTS song_title;

CREATE TABLE composer (
idcomposer int NOT NULL AUTO_INCREMENT,
first_name varchar(45),
last_name varchar(45) NOT NULL,
PRIMARY KEY (idcomposer)
);
CREATE TABLE song_type (
idsong_type int NOT NULL AUTO_INCREMENT, 
performance_type VARCHAR(45),
PRIMARY KEY (idsong_type)
);

CREATE TABLE performer (
idperformer int NOT NULL AUTO_INCREMENT, 
artist_name VARCHAR(45),
PRIMARY KEY (idperformer)
);

CREATE TABLE song_title(
idsong_title int NOT NULL AUTO_INCREMENT, 
title VARCHAR(45), 
idcomposer int NOT NULL, 
PRIMARY KEY (idsong_title),
foreign key (idcomposer) REFERENCES composer (idcomposer)
);

CREATE TABLE composer_song_title(
idsong_title int NOT NULL,
idcomposer int NOT NULL, 
FOREIGN KEY (idsong_title) REFERENCES song_title (idsong_title),
FOREIGN KEY (idcomposer) REFERENCES composer (idcomposer)
);

CREATE TABLE song_title_type(
idsong_title int NOT NULL,
idsong_type int NOT NULL, 
idcomposer int NOT NULL, 
FOREIGN KEY (idsong_title) REFERENCES song_title (idsong_title), 
FOREIGN KEY (idsong_type) REFERENCES song_type (idsong_type), 
FOREIGN KEY (idcomposer) REFERENCES composer (idcomposer)
);

CREATE TABLE performances (
idperformances int NOT NULL AUTO_INCREMENT,
date DATETIME,
idperformer int NOT NULL, 
idsong_title int NOT NULL, 
idsong_type int NOT NULL, 
idcomposer int NOT NULL,
PRIMARY KEY (idperformances),
FOREIGN KEY (idsong_title) REFERENCES song_title (idsong_title),
FOREIGN KEY (idsong_type) REFERENCES song_type (idsong_type), 
FOREIGN KEY (idcomposer) REFERENCES composer (idcomposer)
);
