  -- Exploring the clean dataset 
      SELECT * 
      FROM ai_student_impact_staging ; 
       
       -- searching for max values 
      SELECT  MAX(Skill_Retention_Score)  , MAX(Perceived_AI_Dependency)  
      , MAX(Anxiety_Level_During_Exams)  , MAX(Tool_Diversity) 
      FROM ai_student_impact_staging ; 
      
      
      -- Searching for students with the most Ai dependency  
     SELECT * 
      FROM ai_student_impact_staging 
      WHERE Tool_Diversity=  5 ; 
      
      
      
		