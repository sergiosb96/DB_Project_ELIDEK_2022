-- Projects Per Researcher --

CREATE VIEW Researcher_Project AS 
 SELECT  
first_name, last_name, gender, birth_date, email,
title AS Working_On
FROM Researchers
INNER JOIN Projects ON Researchers.researcher_id = Projects.researcher_id; 

-- Phone Numbers Per Organisation --

CREATE VIEW Organizations_PhoneNumber AS 
 SELECT  
Organizations.name as 'Name', Organizations.abbreviation AS 'Abbreviation', organizations_phonenumber.number AS 'Phone Numbers'
FROM Organizations
INNER JOIN organizations_phonenumber ON  Organizations.organization_id = organizations_phonenumber.organization_id;
