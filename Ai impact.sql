-- Exploratory Data Analysis

 SELECT * 
 FROM ai_student_impact ;  
 
 
 -- Creating duplicate table for staging  , insert data set to dup 
 CREATE TABLE ai_student_impact_staging 
 LIKE ai_student_impact; 
  
  
  SELECT * 
 FROM ai_student_impact_staging ;   
  
  INSERT  ai_student_impact_staging  
  SELECT * 
  FROM ai_student_impact ; 
  
  -- Remove duplicates 
  
   SELECT *  ,
   ROW_NUMBER () OVER (
   PARTITION BY Student_ID ,Major_Category , Year_Of_Study , Pre_Semester_GPA , Weekly_GenAI_Hours, Primary_Use_Case ,
   Prompt_Engineering_Skill , Tool_Diversity , Paid_Subscription , Traditional_Study_Hours , Perceived_AI_Dependency , 
   Institutional_Policy , Anxiety_Level_During_Exams , Post_Semester_GPA , Skill_Retention_Score , Burnout_Risk_Level) AS id_num
  FROM ai_student_impact_staging;  
   
   -- View any  duplicates
   WITH duplicate_cte  AS (  
	SELECT *  ,
   ROW_NUMBER () OVER (
   PARTITION BY Student_ID ,Major_Category , Year_Of_Study , Pre_Semester_GPA , Weekly_GenAI_Hours, Primary_Use_Case ,
   Prompt_Engineering_Skill , Tool_Diversity , Paid_Subscription , Traditional_Study_Hours , Perceived_AI_Dependency , 
   Institutional_Policy , Anxiety_Level_During_Exams , Post_Semester_GPA , Skill_Retention_Score , Burnout_Risk_Level) AS id_num
  FROM ai_student_impact_staging 
   )   
   
   --  use cte  to dipsplay duplicate values 
   SELECT * 
   FROM duplicate_cte  
   WHERE id_num > 1 ;   
   
   -- no duplicates due to Unique Student ID  
      
    
     
    
    
   
 
 
 
   
   
   
   
   

  
  
  
  
  
  
  
  
  