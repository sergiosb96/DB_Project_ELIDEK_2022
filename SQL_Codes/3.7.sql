select first_name as researcher_first_name,last_name as researcher_last_name,name as organization_name,total_funding
from (select name,organizations.organization_id
		from organizations,companies
        where organizations.organization_id=companies.organization_id)as S,
	  (select first_name,last_name,projects.staff_id,projects.organization_id,title,project_ID,sum(funding) as total_funding
        from projects,staff
        where staff.staff_id=projects.staff_id
        group by projects.organization_id,projects.staff_id)as T
where S.organization_id=T.organization_id
order by total_funding desc
limit 5;
