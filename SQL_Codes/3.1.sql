SELECT  DISTINCT Program.Name
FROM Program;

SELECT DISTINCT Projects.title, CONCAT(Researchers.first_name, ' ' , Researchers.last_name) AS Researcher
FROM Projects
INNER JOIN Working ON Projects.project_id = Working.project_id
INNER JOIN Researchers ON Researchers.researcher_id = Working.researcher_id;

SELECT DISTINCT CONCAT(Researchers.first_name, ' ' , Researchers.last_name) AS Full_Name, 
projects.title AS Working_On,
starting_date AS Working_Since, 
duration AS Project_Duration_In_Days, 
CONCAT(Staff.first_name, ' ', Staff.last_name) AS Funded_By
FROM Researchers
INNER JOIN Working ON Researchers.researcher_id = Working.researcher_id
INNER JOIN Projects ON Working.project_id = Projects.project_id 
INNER JOIN Staff ON Projects.staff_id = Staff.staff_id;