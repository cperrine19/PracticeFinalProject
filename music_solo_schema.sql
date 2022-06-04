DROP TABLE IF EXISTS composer;
DROP TABLE IF EXISTS song;
DROP TABLE IF EXISTS song_type;

CREATE TABLE `composer` (
  `idcomposer` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idcomposer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `song` (
  `idsong` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `idcomposer` int NOT NULL,
  `idsong_type` int NOT NULL,
  PRIMARY KEY (`idsong`),
  KEY `idcomposer_idx` (`idcomposer`),
  KEY `type_idx` (`idsong_type`),
  CONSTRAINT `idcomposer` FOREIGN KEY (`idcomposer`) REFERENCES `composer` (`idcomposer`),
  CONSTRAINT `idsong_type` FOREIGN KEY (`idsong`) REFERENCES `song_type` (`idsong_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `song_type` (
  `idsong_type` int NOT NULL AUTO_INCREMENT,
  `performance_type` varchar(45) NOT NULL,
  PRIMARY KEY (`idsong_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
