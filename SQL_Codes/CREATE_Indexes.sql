CREATE INDEX idx_project_id ON projects(project_id);
CREATE INDEX idx_organization_id ON organizations(organization_id);
CREATE INDEX idx_researcher_id ON researchers(researcher_id);
CREATE INDEX res_name_idx on researchers (first_name,last_name);
CREATE INDEX work_res_id on working(researcher_id);
CREATE INDEX idx_project_staff_id ON projects(staff_id);
CREATE INDEX idx_project_title ON projects(title);
CREATE INDEX idx_project_Fund ON projects(funding);
