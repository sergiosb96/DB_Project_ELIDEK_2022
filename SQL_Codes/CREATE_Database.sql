SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+02:00";

CREATE DATABASE IF NOT EXISTS `elidek` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `elidek`;


CREATE TABLE Staff
(
  staff_id VARCHAR(20) NOT NULL,
  first_name VARCHAR(250) NOT NULL,
  last_name VARCHAR(250) NOT NULL,
  email VARCHAR(250) NOT NULL,
  department VARCHAR(250) NOT NULL,
  PRIMARY KEY (staff_id)
);

CREATE TABLE Program
(
  program_id VARCHAR(20) NOT NULL,
  Name VARCHAR(250) NOT NULL,
  Department VARCHAR(250) NOT NULL,
  PRIMARY KEY (program_id)
);

CREATE TABLE Researchers
(
  researcher_id VARCHAR(20) NOT NULL,
  first_name VARCHAR(250) NOT NULL,
  last_name VARCHAR(250) NOT NULL,
  gender VARCHAR(250) NOT NULL,
  birth_date DATE NOT NULL,
  email VARCHAR(250) NOT NULL,
  PRIMARY KEY (researcher_id)
);

CREATE TABLE Researcher_Phonenumber
(
  number INT NOT NULL,
  researcher_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (number, researcher_id),
  FOREIGN KEY (researcher_id) REFERENCES Researchers(researcher_id)
);

CREATE TABLE Organizations
(
  organization_id VARCHAR(20) NOT NULL,
  name VARCHAR(250) NOT NULL,
  abbreviation VARCHAR(20) NOT NULL,
  street VARCHAR(250) NOT NULL,
  number INT NOT NULL,
  postal_code INT NOT NULL,
  city VARCHAR(250) NOT NULL,
  PRIMARY KEY (organization_id)
);

CREATE TABLE Oganizations_Phonenumber
(
  number INT NOT NULL,
  organization_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (number, organization_id),
  FOREIGN KEY (organization_id) REFERENCES Organizations(organization_id)
);

CREATE TABLE Universities
(
  public_budget FLOAT NOT NULL,
  organization_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (organization_id),
  FOREIGN KEY (organization_id) REFERENCES Organizations(organization_id)
);

CREATE TABLE Research_Laboratories
(
  public_budget FLOAT NOT NULL,
  private_budget FLOAT NOT NULL,
  organization_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (organization_id),
  FOREIGN KEY (organization_id) REFERENCES Organizations(organization_id)
);

CREATE TABLE Companies
(
  private_budget FLOAT NOT NULL,
  organization_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (organization_id),
  FOREIGN KEY (organization_id) REFERENCES Organizations(organization_id)
);

CREATE TABLE Projects
(
  project_id VARCHAR(20) NOT NULL,
  title VARCHAR(250) NOT NULL,
  summary VARCHAR(500) NOT NULL,
  starting_date VARCHAR(250) NOT NULL,
  ending_date DATE NOT NULL,
  funding FLOAT NOT NULL,
  duration INT NOT NULL,
  staff_id VARCHAR(20) NOT NULL,
  program_id VARCHAR(20) NOT NULL,
  organization_id VARCHAR(20) NOT NULL,
  researcher_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (project_id),
  FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
  FOREIGN KEY (program_id) REFERENCES Program(program_id),
  FOREIGN KEY (organization_id) REFERENCES Organizations(organization_id),
  FOREIGN KEY (researcher_id) REFERENCES Researchers(researcher_id)
);

CREATE TABLE Science_Field
(
  name VARCHAR(20) NOT NULL,
  project_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (name, project_id),
  FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

CREATE TABLE Working_Relationship
(
  starting_date DATE NOT NULL,
  researcher_id VARCHAR(20) NOT NULL,
  organization_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (researcher_id, organization_id),
  FOREIGN KEY (researcher_id) REFERENCES Researchers(researcher_id),
  FOREIGN KEY (organization_id) REFERENCES Organizations(organization_id)
);

CREATE TABLE Working
(
  researcher_id VARCHAR(20) NOT NULL,
  project_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (researcher_id, project_id),
  FOREIGN KEY (researcher_id) REFERENCES Researchers(researcher_id),
  FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

CREATE TABLE Evaluating
(
  grade INT NOT NULL,
  date DATE NOT NULL,
  researcher_id VARCHAR(20) NOT NULL,
  project_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (researcher_id, project_id),
  FOREIGN KEY (researcher_id) REFERENCES Researchers(researcher_id),
  FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

CREATE TABLE Deliverables
(
  title VARCHAR(100) NOT NULL,
  summary VARCHAR(500) NOT NULL,
  date DATE NOT NULL,
  project_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (title, date, project_id),
  FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);