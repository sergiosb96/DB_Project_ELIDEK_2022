CREATE DATABASE IF NOT EXISTS `elidek`;
USE `elidek`;


CREATE TABLE IF NOT EXISTS `companies` (
  `private_budget` float NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`organization_id`),
  CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `deliverables` (
  `title` varchar(100) NOT NULL,
  `summary` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`title`,`date`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `deliverables_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `evaluating` (
  `grade` int(11) NOT NULL CHECK (`grade` >= 0 and `grade` <= 10),
  `date` date NOT NULL,
  `researcher_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`researcher_id`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `evaluating_ibfk_1` FOREIGN KEY (`researcher_id`) REFERENCES `researchers` (`researcher_id`),
  CONSTRAINT `evaluating_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `organizations` (
  `organization_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `abbreviation` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `number` int(11) NOT NULL,
  `postal_code` int(11) NOT NULL CHECK (`postal_code` >= 0 and `postal_code` <= 99999),
  `city` varchar(50) NOT NULL,
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `organizations_phonenumber` (
  `number` bigint(20) NOT NULL CHECK (`number` >= 0 and `number` <= 9999999999),
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`number`,`organization_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `organizations_phonenumber_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Department` varchar(100) NOT NULL,
  PRIMARY KEY (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `summary` varchar(500) NOT NULL,
  `starting_date` date NOT NULL,
  `ending_date` date NOT NULL,
  `funding` float NOT NULL CHECK (`funding` >= 100000 and `funding` <= 1000000),
  `duration` int(11) NOT NULL CHECK (`duration` >= 0 and `duration` <= 1461),
  `staff_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `researcher_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `staff_id` (`staff_id`),
  KEY `program_id` (`program_id`),
  KEY `organization_id` (`organization_id`),
  KEY `researcher_id` (`researcher_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`),
  CONSTRAINT `projects_ibfk_4` FOREIGN KEY (`researcher_id`) REFERENCES `researchers` (`researcher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `researchers` (
  `researcher_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `email` varchar(250) NOT NULL CHECK (`email` like '_%@_%._%'),
  PRIMARY KEY (`researcher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `researcher_phonenumber` (
  `number` bigint(20) NOT NULL CHECK (`number` >= 0 and `number` <= 9999999999),
  `researcher_id` int(11) NOT NULL,
  PRIMARY KEY (`number`,`researcher_id`),
  KEY `researcher_id` (`researcher_id`),
  CONSTRAINT `researcher_phonenumber_ibfk_1` FOREIGN KEY (`researcher_id`) REFERENCES `researchers` (`researcher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `research_laboratories` (
  `public_budget` float NOT NULL,
  `private_budget` float NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`organization_id`),
  CONSTRAINT `research_laboratories_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `science_field` (
  `name` varchar(100) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`name`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `science_field_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL CHECK (`email` like '_%@_%._%'),
  `department` varchar(100) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `universities` (
  `public_budget` float NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`organization_id`),
  CONSTRAINT `universities_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `working` (
  `researcher_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`researcher_id`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `working_ibfk_1` FOREIGN KEY (`researcher_id`) REFERENCES `researchers` (`researcher_id`),
  CONSTRAINT `working_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `working_relationship` (
  `starting_date` date NOT NULL,
  `researcher_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`researcher_id`,`organization_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `working_relationship_ibfk_1` FOREIGN KEY (`researcher_id`) REFERENCES `researchers` (`researcher_id`),
  CONSTRAINT `working_relationship_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;