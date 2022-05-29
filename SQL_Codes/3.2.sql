-- Projects Per Researcher --

CREATE VIEW Researcher_Project AS 
 SELECT  
first_name, last_name, gender, birth_date, email,
title AS Working_On
FROM Researchers
INNER JOIN Projects ON Researchers.researcher_id = Projects.researcher_id; 

-- Projects Per Organisation --

CREATE VIEW Organizations_Projects AS 
 SELECT  
Organizations.name as 'Name', Organizations.abbreviation AS 'Abbreviation', organizations_phonenumber.number AS 'Phone Numbers',
Projects.Title as 'Projects', Science_field.name AS 'Science Field'
FROM Organizations
INNER JOIN Projects ON Organizations.organization_id = Projects.organization_id
INNER JOIN organizations_phonenumber ON  Organizations.organization_id = organizations_phonenumber.organization_id
INNER JOIN science_field ON Projects.project_id = science_field.project_id;
