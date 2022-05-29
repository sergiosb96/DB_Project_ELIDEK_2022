SELECT first_name, last_name, COUNT(Projects.project_id) AS Total_Projects
FROM Researchers
 JOIN Working
  ON Researchers.researcher_id = Working.researcher_id
 INNER JOIN  Projects 
  ON Working.project_id = Projects.project_id
WHERE birth_date > DATE_SUB(NOW(), INTERVAL 40 year)
 AND NOW() BETWEEN starting_date AND ending_date
ORDER BY COUNT(Projects.project_id) DESC;
