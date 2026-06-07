-- Standarding data , delete null values , trim spaces  
 SELECT  company , TRIM(company)  
 FROM layoffs_staging_2; 
 
 UPDATE layoffs_staging_2 
 SET company = TRIM(company);   
 
SELECT DISTINCT industry 
FROM layoffs_staging_2; 
  

UPDATE layoffs_staging_2 
SET industry = 'Crypto' 
WHERE industry LIKE 'Crypto%' ; 
 