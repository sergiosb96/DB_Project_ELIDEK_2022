select title,starting_date,ending_date,name,last_name,first_name
from (select projects.project_id,title,starting_date,ending_date,name
	from projects,science_field
    where projects.project_id=science_field.project_id)as T, 
    (select first_name,last_name,project_id
    from researchers,working
    where researchers.researcher_id=working.project_id)as S
    
where T.project_ID=S.project_ID and curdate()<ending_date and curdate()>starting_date
order by name;
