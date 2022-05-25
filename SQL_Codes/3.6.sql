
SELECT first_name, last_name, COUNT(project_id)
FROM Researchers
JOIN Working
 ON Researchers.researcher_id = Working.researcher_id
WHERE birth_date > DATE_SUB(NOW(), INTERVAL 40 year)
 AND ending_date > NOW()
ORDER BY COUNT(project_id) DESC;
