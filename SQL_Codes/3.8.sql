SELECT first_name, last_name, COUNT(project_id) AS Total_Projects
FROM Researchers
JOIN Working
  ON Researchers.researcher_id = Working.researcher_id
WHERE EXISTS 
   (SELECT Projects.title FROM Projects LEFT JOIN Deliverables ON Projects.project_id = Deliverables.project_id 
   AND deliverables.date IS NULL)
HAVING COUNT(project_id) >= 5 ;
