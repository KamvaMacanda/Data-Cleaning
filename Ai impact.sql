-- Data cleaning 

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
   PARTITION BY Major_Category , Year_Of_Study , Pre_Semester_GPA , Pre_Semester_GPA , Primary_Use_Case ) AS id_num
  FROM ai_student_impact_staging;  
   
   -- View duplicate using cte 
   WITH duplicate_cte  AS (  
	SELECT *  ,
   ROW_NUMBER () OVER (
   PARTITION BY Major_Category , Year_Of_Study , Pre_Semester_GPA , Pre_Semester_GPA , Primary_Use_Case ) AS id_num
  FROM ai_student_impact_staging 
   )  
   SELECT * 
   FROM duplicate_cte  
   WHERE id_num > 1 ;
   
   

  
  
  
  
  
  
  
  
  