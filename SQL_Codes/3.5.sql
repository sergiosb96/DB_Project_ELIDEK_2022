select t.name AS field_1 ,s.name AS field_2, COUNT(*) AS times
from (select projects.project_id,name 
    from projects,science_field
    where projects.project_id= science_field.project_id) as T,
    (select projects.project_id,name 
    from projects,science_field
    where projects.project_id= science_field.project_id) as S
where T.project_id=S.project_id and T.name<>S.name
group by s.name, t.name
order by count(*) desc
limit 3;

