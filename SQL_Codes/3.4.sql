SELECT A.name, A.Year AS Year_1, B.year AS Year_2, A.total_projects AS Annual_Projects
FROM 
   (SELECT organizations.organization_id, organizations.name AS Name, count(*) AS total_projects, year(starting_date) AS Year
    FROM organizations
    INNER JOIN projects ON organizations.organization_id = projects.organization_id
    GROUP BY organization_id, year) AS A,
   (SELECT organizations.organization_id, organizations.name AS Name, count(*) AS total_projects, year(starting_date) AS Year
    FROM organizations
 	  INNER JOIN projects ON organizations.organization_id = projects.organization_id
    GROUP BY organization_id, year) AS B
WHERE A.organization_id = B.organization_id AND B.Year=A.Year+1 AND A.total_projects=B.total_projects 
GROUP BY A.name;
