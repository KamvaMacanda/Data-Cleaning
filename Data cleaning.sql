-- Cleaning data and then exploring it 
SELECT * 
FROM layoffs ; 
 
 -- Ceating duplicate table to clean data from 
 CREATE TABLE layoffs_staging  
 LIKE layoffs; 
 
 INSERT layoffs_staging  
 SELECT * 
 FROM layoffs ; 
  
 SELECT *  ,
 ROW_NUMBER () OVER (PARTITION BY company , industry , total_laid_off , percentage_laid_off, `date`)AS ID_num
 FROM layoffs_staging ;  
 
 
 WITH duplicate_valuesCTE AS  
 ( 
  SELECT *  ,
 ROW_NUMBER() OVER(PARTITION BY company , industry , total_laid_off , percentage_laid_off, `date`)AS ID_num
 FROM layoffs_staging 
 )

SELECT * 
FROM duplicate_valuesCTE 
WHERE ID_num >1 ; 
 
 