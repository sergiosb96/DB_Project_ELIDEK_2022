

select count(distinct t.name,s.name) as times,t.name,s.name
from (select projects.project_id,name 
	from projects,science_field
	where projects.project_id= science_field.project_id) as T,
	(select projects.project_id,name 
	from projects,science_field
	where projects.project_id= science_field.project_id) as S
where T.project_id=S.project_id and T.name<>S.name
group by s.name
order by times desc
limit 3;
