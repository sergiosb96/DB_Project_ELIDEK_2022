SELECT CONCAT(Researchers.first_name, ' ' , Researchers.last_name) AS Full_Name, COUNT(Projects.project_id) AS Total_Projects
FROM Researchers
 JOIN Working
  ON Researchers.researcher_id = Working.researcher_id
 INNER JOIN  Projects 
  ON Working.project_id = Projects.project_id
WHERE birth_date > DATE_SUB(NOW(), INTERVAL 40 year)
 AND CURDATE() BETWEEN starting_date AND ending_date
GROUP BY Full_Name
ORDER BY COUNT(Projects.project_id) DESC;
