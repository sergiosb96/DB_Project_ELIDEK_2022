-- age of researcher over 18

delimiter //
 CREATE TRIGGER ins_check_res_age BEFORE insert ON researchers
       FOR EACH ROW
       BEGIN
           IF TIMESTAMPDIFF(year,birth_date,curdate()) < 18 THEN
               signal sqlstate '45000'   
        set message_text = 'Researcher must be at least 18 years old';
           
           END IF;
       END;//
 delimiter ;
 
 -- --------------------------------------------------------------------------------------------------
 -- deliverable date between starting date και ending date tου projects
 
 
 delimiter //
 CREATE TRIGGER ins_check_del_date BEFORE insert ON deliverables
       FOR EACH ROW
       BEGIN
		  declare d_date date;
          declare D_starting_date date;
          declare D_ending_date date;
          select new.date,starting_date,ending_date
          into d_date,D_starting_date,D_ending_date
          from deliverables,projects where deliverables.project_id=projects.project_id;
           IF d_date < D_starting_date THEN
               signal sqlstate '45000'   
        set message_text = 'Deliverable date must not be before the starting date of the project';
           ELSEIF d_date > D_ending_date THEN
               signal sqlstate '45000'   
        set message_text = 'Deliverable date must not be after the ending date of the project';
           END IF;
		
       END;//
 delimiter ;
 
 
 -- -------------------------------------------------------
 
-- DROP TRIGGER IF EXISTS elidek.ins_check_del_date;
-- ------------------------------------------------------------
-- Έλεγχος του αν υπάρχει evaluation για τα projects
delimiter //
 CREATE TRIGGER ins_check_eval_existence_of_proj AFTER insert ON projects
       FOR EACH row
       BEGIN
		  declare d_eval_proj_id int;
          declare D_proj_proj_id int;
        select evaluating.project_id 
          into d_eval_proj_id
          from evaluating
        ;
		select new.projects.project_id
          into D_proj_proj_id
          from projects;
	
           IF D_proj_proj_id <> d_eval_proj_id THEN
               
        set message_text = 'Attention!Your project is not valid untill its evaluation is added';
           
           END IF;
		
       END;//
 delimiter ;
-- ---------------------------------------------------------------
