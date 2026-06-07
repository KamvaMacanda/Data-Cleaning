-- Standarding data , delete null values , trim spaces  
 SELECT  company , TRIM(company)  
 FROM layoffs_staging_2; 
 
 UPDATE layoffs_staging_2 
 SET company = TRIM(company);   
 
 
 -- Updating all cypto / cryptocurrency  industry to be named crypto 
SELECT DISTINCT industry 
FROM layoffs_staging_2; 
  

UPDATE layoffs_staging_2 
SET industry = 'Crypto' 
WHERE industry LIKE 'Crypto%' ; 
 
 
 -- removing fullspots from the end of data 
SELECT  DISTINCT country ,  TRIM( TRAILING '.' FROM country) 
FROM layoffs_staging_2  
ORDER BY 1 ; 

UPDATE  layoffs_staging_2 
SET country = TRIM( TRAILING '.' FROM country)  
WHERE  country LIKE 'United States%' ; 
 
SELECT `date` ,
STR_TO_DATE  (`date` , '%d / %m / %Y' ) 
FROM layoffs_staging_2 ; 

 










 