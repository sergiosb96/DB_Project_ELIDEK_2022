CREATE TABLE staff
(
  staff_id INT NOT NULL,
  first_name VARCHAR(250) NOT NULL,
  last_name VARCHAR(250) NOT NULL,
  email VARCHAR(250) NOT NULL,
  department VARCHAR(250) NOT NULL,
  PRIMARY KEY (staff_id)
);

SHOW CHARSET;
LOAD DATA LOW_PRIORITY LOCAL INFILE 'F:\\OneDrive\\Desktop\\Mock_Data\\staff.csv' REPLACE INTO TABLE `elidek`.`staff` CHARACTER SET utf8 FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' ESCAPED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (`staff_id`, `first_name`, `last_name`, `email`, `department`);
/* 20 rows imported in 0,016 seconds. */
SHOW WARNINGS;
SELECT * FROM `elidek`.`staff` LIMIT 1000;