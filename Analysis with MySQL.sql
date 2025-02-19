CREATE DATABASE FT_RPC1;

USE FT_RPC1;
 
-- Table Name : lung_cancer_data;

-- Basic Level

-- 1. Retrieve all records for individuals diagnosed with lung cancer.
SELECT * 
FROM lung_cancer_data
WHERE lung_cancer_diagnosis="Yes";

-- 2. Count the number of smokers and non-smokers.
SELECT smoker,
       COUNT(DISTINCT id) AS patients_Count
FROM lung_cancer_data
GROUP BY smoker;

-- 3. List all unique cancer stages present in the dataset.
SELECT DISTINCT cancer_stage
FROM lung_cancer_data;

-- 4. Retrieve the average number of cigarettes smoked per day by smokers.
SELECT AVG(cigarettes_per_day) AS avg_cigarettes_smoked
FROM lung_cancer_data
WHERE smoker="Yes";

-- 5. Count the number of people exposed to high air pollution.
SELECT COUNT(DISTINCT id) AS patients_count
FROM lung_cancer_data
WHERE air_pollution_exposure="High";

-- 6. Find the top 5 countries with the highest lung cancer deaths.
SELECT DISTINCT country,
       annual_lung_cancer_deaths
FROM lung_cancer_data
ORDER BY annual_lung_cancer_deaths DESC
LIMIT 5;

-- 7. Count the number of people diagnosed with lung cancer by gender.
SELECT gender,
       COUNT(DISTINCT id) AS cancer_patients
FROM lung_cancer_data
WHERE lung_cancer_diagnosis="Yes"
GROUP BY gender;

-- 8. Retrieve records of individuals older than 60 who are diagnosed with lung cancer.
SELECT *
FROM lung_cancer_data
WHERE age>60 AND lung_cancer_diagnosis="Yes";

-- Intermediate Level

-- 1. Find the percentage of smokers who developed lung cancer.
WITH CTE AS(
SELECT 
    COUNT(DISTINCT CASE WHEN lung_cancer_diagnosis = 'Yes' AND smoker = 'Yes' THEN ID END) AS smoker_lung_cancer_patients,
    COUNT(DISTINCT CASE WHEN smoker = 'Yes' THEN ID END) AS total_smokers
FROM lung_cancer_data)
SELECT smoker_lung_cancer_patients,
       total_smokers,
       CONCAT(ROUND(smoker_lung_cancer_patients/total_smokers*100,2),"%") AS lung_cancer_smoker_percentage
FROM CTE;

-- 2. Calculate the average survival years based on cancer stages.
SELECT cancer_stage,
       ROUND(AVG(survival_years),0) AS avg_survival_years
FROM lung_cancer_data
WHERE lung_cancer_diagnosis="Yes"
GROUP BY cancer_stage;

-- 3. Count the number of lung cancer patients based on passive smoking.
SELECT passive_smoker,
       COUNT(DISTINCT ID) AS cancer_patients_count
FROM lung_cancer_data
WHERE lung_cancer_diagnosis="Yes"
GROUP BY passive_smoker;

-- 4. Find the country with the highest lung cancer prevalence rate.
SELECT country,
       CONCAT(ROUND(AVG(lung_cancer_prevalence_rate),4),"%") AS lung_cancer_prevalence_rate
FROM lung_cancer_data
GROUP BY country
ORDER BY lung_cancer_prevalence_rate DESC
LIMIT 1;

-- 5.Identify the smoking years impact on lung cancer.
SELECT 
    years_of_smoking,
    COUNT(CASE WHEN lung_cancer_diagnosis="Yes" THEN 1 END) AS cancer_cases,
    COUNT(DISTINCT id) AS total_cases,
    CONCAT(ROUND((COUNT(CASE WHEN lung_cancer_diagnosis ="Yes" THEN 1 END)*100/COUNT(DISTINCT id)),2),"%") AS cancer_cases_percentage
FROM lung_cancer_data
WHERE smoker = "Yes"
GROUP BY years_of_smoking
ORDER BY years_of_smoking;

-- 6. Determine the mortality rate for patients with and without early detection.
SELECT early_detection,
       ROUND(AVG(mortality_rate),2) AS mortality_rate
FROM lung_cancer_data
WHERE lung_cancer_diagnosis="Yes"
GROUP BY early_detection;

-- 7. Group the lung cancer prevalence rate by developed vs. developing countries.
SELECT developed_or_developing,
       CONCAT(ROUND(AVG(lung_cancer_prevalence_rate),4),"%") AS lung_cancer_prevalence_rate
FROM lung_cancer_data
GROUP BY developed_or_developing;


-- Advanced Level
-- 1. Identify the correlation between lung cancer prevalence and air pollution levels.
SELECT air_pollution_exposure,
       ROUND(AVG(lung_cancer_prevalence_rate),3) AS lung_cancer_prevalence_rate
FROM lung_cancer_data
GROUP BY Air_Pollution_Exposure;

-- 2. Find the average age of lung cancer patients for each country.
SELECT country,
       ROUND(AVG(age),0) AS avg_age
FROM lung_cancer_data
WHERE lung_cancer_diagnosis="Yes"
GROUP BY country;


-- 3. Calculate the risk factor of lung cancer by smoker status, passive smoking, and family history.
SELECT smoker,
       passive_smoker,
       family_history,
       COUNT(CASE WHEN lung_cancer_diagnosis="Yes" THEN 1 END) AS cancer_patients,
	   COUNT(DISTINCT id) total_patients,
       CONCAT(ROUND(COUNT(CASE WHEN lung_cancer_diagnosis="Yes" THEN 1 END)/COUNT(DISTINCT id)*100,2),"%") AS cancer_risk_pct
FROM lung_cancer_data
GROUP BY smoker,passive_smoker,family_history;

-- 4. Rank countries based on their mortality rate.
SELECT country,
       CONCAT(ROUND(AVG(mortality_rate),2),"%") AS mortality_rate,
       DENSE_RANK() OVER(ORDER BY ROUND(AVG(mortality_rate),2) DESC) AS drnk
FROM lung_cancer_data
GROUP BY 1;


-- 5. Determine if treatment type has a significant impact on survival years.
SELECT treatment_type,
       COUNT(DISTINCT id) AS total_patients,
       ROUND(AVG(survival_years),0) AS avg_survival_years
FROM lung_cancer_data
WHERE lung_cancer_diagnosis="Yes"
GROUP BY treatment_type;


-- 6. Compare lung cancer prevalence in men vs. women across countries.
SELECT country,
       gender,
       CONCAT(ROUND(AVG(lung_cancer_prevalence_rate),2),"%") lung_cancer_prevalence_rate
FROM lung_cancer_data
GROUP BY country,gender;


-- 7. Find how occupational exposure, smoking, and air pollution collectively impact lung cancer rates.
SELECT occupational_exposure,
       smoker,
       air_pollution_exposure,
       COUNT(CASE WHEN lung_cancer_diagnosis="Yes" THEN 1 END) AS cancer_patients,
       COUNT(DISTINCT id) AS total_patients,
       CONCAT(ROUND(COUNT(CASE WHEN lung_cancer_diagnosis="Yes" THEN 1 END)/COUNT(DISTINCT id)*100,2),"%") AS cancer_rate_pct
FROM lung_cancer_data
GROUP BY occupational_exposure,smoker,air_pollution_exposure;


-- 8. Analyze the impact of early detection on survival years.
SELECT 
    early_detection, 
    ROUND(AVG(survival_years),0) AS Avg_Survival_Years
FROM lung_cancer_data
WHERE lung_cancer_diagnosis ="Yes"
GROUP BY early_detection;





