
SELECT first_name, last_name, COUNT(project_id)
FROM Researchers
JOIN Projects
 ON Researchers.researcher_id = Projects.researcher_id
WHERE birth_date > DATE_SUB(NOW(), INTERVAL 40 year)
ORDER BY COUNT(project_id) DESC;
