-- Cleaning data and then exploring it 
SELECT * 
FROM layoffs ; 
 
 -- Ceating duplicate table to clean data from 
 CREATE TABLE layoffs_staging  
 LIKE layoffs; 
 
 INSERT layoffs_staging  
 SELECT * 
 FROM layoffs ; 
 
 