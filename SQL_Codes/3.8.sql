SELECT CONCAT(Researchers.first_name, ' ' , Researchers.last_name) AS Researcher_Name, COUNT(working.project_id) AS Total_Projects
FROM Researchers
INNER JOIN Working ON Researchers.researcher_id = Working.researcher_id
INNER JOIN Projects ON Working.project_id = Projects.project_id
LEFT JOIN Deliverables ON Projects.project_id = Deliverables.project_id 
WHERE deliverables.date IS NULL
GROUP BY Researcher_Name
HAVING Total_Projects >= 5;
