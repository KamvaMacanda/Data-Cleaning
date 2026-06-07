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
 ROW_NUMBER() OVER(PARTITION BY company , industry , total_laid_off , percentage_laid_off, `date` , 
 stage  , country  , funds_raised_millions)AS ID_num
 FROM layoffs_staging 
 )

SELECT * 
FROM duplicate_valuesCTE 
WHERE ID_num >1 ; 
 
 SELECT * 
 FROM layoffs_staging  
 WHERE company = "Casper" ; 
 
 
 CREATE TABLE `layoffs_staging_2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL , 
   `ID_num` INT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

 SELECT * 
 FROM layoffs_staging_2 
 WHERE ID_num > 1 ; 

 INSERT INTO layoffs_staging_2 
SELECT * ,
 ROW_NUMBER() OVER(PARTITION BY company , industry , total_laid_off , percentage_laid_off, `date` , 
 stage  , country  , funds_raised_millions)AS ID_num
 FROM layoffs_staging; 
 
 
 -- Deleting all duplicate entries 
DELETE   
 FROM layoffs_staging_2  
 WHERE ID_num > 1 ;  
 
 SELECT * 
 FROM layoffs_staging_2 ; 
  
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 