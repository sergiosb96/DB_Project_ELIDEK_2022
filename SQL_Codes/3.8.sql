SELECT first_name, last_name, COUNT(project_id)
 FROM Researchers
  JOIN Projects
  ON Researchers.researcher_id = Projects.researcher_id
 WHERE EXISTS 
  (SELECT Projects.title FROM Projects JOIN Deliverables ON Projects.project_id = Deliverables.project_id 
   AND deliverables.date IS NULL)
 AND COUNT(project_id) >= 5;


