
select A.name,B.name,count(A.name) as times
from	(select projects.project_id,name
		from projects,science_field
		where projects.project_id=science_field.project_id)as A,
		(select projects.project_id,name
		from projects,science_field
		where projects.project_id=science_field.project_id)as B
where A.project_id=B.project_id and A.name<>B.name
group by A.name