-- --------------------------------------------------------
-- Διακομιστής:                  localhost
-- Έκδοση διακομιστή:            10.4.24-MariaDB - mariadb.org binary distribution
-- Λειτ. σύστημα διακομιστή:     Win64
-- HeidiSQL Έκδοση:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for elidek
CREATE DATABASE IF NOT EXISTS `elidek` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `elidek`;

SET FOREIGN_KEY_CHECKS=0;

-- Dumping structure for πίνακας elidek.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `private_budget` float NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`organization_id`),
  CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.deliverables
CREATE TABLE IF NOT EXISTS `deliverables` (
  `title` varchar(100) NOT NULL,
  `summary` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`title`,`date`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `deliverables_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.evaluating
CREATE TABLE IF NOT EXISTS `evaluating` (
  `grade` int(11) NOT NULL CHECK (`grade` >= 0 AND `grade` <= 10),
  `date` date NOT NULL,
  `researcher_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`researcher_id`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `evaluating_ibfk_1` FOREIGN KEY (`researcher_id`) REFERENCES `researchers` (`researcher_id`),
  CONSTRAINT `evaluating_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.organizations
CREATE TABLE IF NOT EXISTS `organizations` (
  `organization_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `abbreviation` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `number` int(11) NOT NULL,
  `postal_code` int(11) NOT NULL CHECK (`postal_code` >= 0 AND `postal_code` <= 99999),
  `city` varchar(50) NOT NULL,
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.organizations_phonenumber
CREATE TABLE IF NOT EXISTS `organizations_phonenumber` (
  `number` bigint(20) NOT NULL CHECK (`number` >= 0 AND `number` <= 9999999999),
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`number`,`organization_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `organizations_phonenumber_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.program
CREATE TABLE IF NOT EXISTS `program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Department` varchar(100) NOT NULL,
  PRIMARY KEY (`program_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `summary` varchar(500) NOT NULL,
  `starting_date` date NOT NULL,
  `ending_date` date NOT NULL,
  `funding` float NOT NULL CHECK (`funding` >= 100000 AND `funding` <= 1000000),
  `duration` int(11) NOT NULL CHECK (`duration` >= 0 AND `duration` <= 1461),
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.researchers
CREATE TABLE IF NOT EXISTS `researchers` (
  `researcher_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `email` varchar(250) NOT NULL CHECK (`email` LIKE '_%@_%._%'),
  PRIMARY KEY (`researcher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.researcher_phonenumber
CREATE TABLE IF NOT EXISTS `researcher_phonenumber` (
  `number` bigint(20) NOT NULL CHECK (`number` >= 0 AND `number` <= 9999999999),
  `researcher_id` int(11) NOT NULL,
  PRIMARY KEY (`number`,`researcher_id`),
  KEY `researcher_id` (`researcher_id`),
  CONSTRAINT `researcher_phonenumber_ibfk_1` FOREIGN KEY (`researcher_id`) REFERENCES `researchers` (`researcher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.research_laboratories
CREATE TABLE IF NOT EXISTS `research_laboratories` (
  `public_budget` float NOT NULL,
  `private_budget` float NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`organization_id`),
  CONSTRAINT `research_laboratories_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.science_field
CREATE TABLE IF NOT EXISTS `science_field` (
  `name` varchar(100) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`name`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `science_field_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL CHECK (`email` LIKE '_%@_%._%'),
  `department` varchar(100) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.universities
CREATE TABLE IF NOT EXISTS `universities` (
  `public_budget` float NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`organization_id`),
  CONSTRAINT `universities_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.working
CREATE TABLE IF NOT EXISTS `working` (
  `researcher_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`researcher_id`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `working_ibfk_1` FOREIGN KEY (`researcher_id`) REFERENCES `researchers` (`researcher_id`),
  CONSTRAINT `working_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for πίνακας elidek.working_relationship
CREATE TABLE IF NOT EXISTS `working_relationship` (
  `starting_date` date NOT NULL,
  `researcher_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`researcher_id`,`organization_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `working_relationship_ibfk_1` FOREIGN KEY (`researcher_id`) REFERENCES `researchers` (`researcher_id`),
  CONSTRAINT `working_relationship_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS=1;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
