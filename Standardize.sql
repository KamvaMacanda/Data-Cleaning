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
 
SELECT `date` 
FROM layoffs_staging_2 ;  
 
 UPDATE layoffs_staging_2 
 SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y') ;

ALTER TABLE layoffs_staging_2 
MODIFY COLUMN `date` DATE ; 
 
 -- Looking for empty values 
 SELECT * 
 FROM layoffs_staging_2 
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL ; 

SELECT *
FROM layoffs_staging_2 
WHERE industry IS NULL 
OR industry = '' ; 

SELECT * 
FROM layoffs_staging_2
WHERE company = 'Airbnb' ;  

SELECT * 
FROM layoffs_staging_2 t1
JOIN layoffs_staging_2 t2 
		ON t1.company = t2.company 
        WHERE (t1.industry IS NULL OR t1.industry= '')  
AND t1.location IS NOT NULL  










 