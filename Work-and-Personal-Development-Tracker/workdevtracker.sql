CREATE DATABASE `workdevtracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
CREATE TABLE `companions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `dates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `daywork` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task` varchar(255) NOT NULL,
  `task_description` mediumtext,
  `new_things` varchar(255) DEFAULT NULL,
  `new_things_description` mediumtext,
  `companion_id` int DEFAULT NULL,
  `date_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companion_id_idx` (`companion_id`),
  KEY `date_id_idx` (`date_id`),
  CONSTRAINT `companion_id` FOREIGN KEY (`companion_id`) REFERENCES `companions` (`id`),
  CONSTRAINT `date_id` FOREIGN KEY (`date_id`) REFERENCES `dates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The table contains every day''s work, skills gained and also things learnt';

CREATE TABLE `skills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `skill` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id_idx` (`task_id`),
  CONSTRAINT `task_id` FOREIGN KEY (`task_id`) REFERENCES `daywork` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
