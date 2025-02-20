-- Lung_Cancer_Dataset

SELECT TOP 10 *
FROM Lung_Cancer_Analysis..lung_cancer_Dataset

-- Basic Level

-- 1. Retrieve all records for individuals diagnosed with lung cancer.

SELECT *
FROM Lung_Cancer_Analysis..lung_cancer_Dataset
WHERE Lung_Cancer_Diagnosis = 'Yes'


-- 2. Count the number of smokers and non-smokers.

SELECT Smoker,COUNT(*) as Count_people
FROM Lung_Cancer_Analysis..lung_cancer_Dataset
GROUP BY SMOKER

-- 3. List all unique cancer stages present in the dataset.

SELECT DISTINCT Cancer_Stage
FROM lung_cancer_Dataset

-- 4. Retrieve the average number of cigarettes smoked per day by smokers.

SELECT AVG(Cigarettes_per_Day) as Avg_Cigarettes_per_day
FROM lung_cancer_Dataset

-- 5. Count the number of people exposed to high air pollution.

SELECT COUNT(*) AS High_Air_Pollution_Exposed
FROM lung_cancer_Dataset
WHERE Air_Pollution_Exposure = 'High'

-- 6. Find the top 5 countries with the highest lung cancer deaths.

SELECT TOP(5) Country,SUM(Annual_Lung_Cancer_Deaths) as Total_Deaths
FROM lung_cancer_Dataset
GROUP BY Country
ORDER BY Total_Deaths DESC

-- 7. Count the number of people diagnosed with lung cancer by gender.

SELECT Gender, COUNT(*) as Cancer_Cases
FROM lung_cancer_Dataset
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Gender

-- 8. Retrieve records of individuals older than 60 who are diagnosed with lung cancer.

SELECT *
FROM lung_cancer_Dataset
WHERE Age > 60 
AND Lung_Cancer_Diagnosis = 'Yes'


-- Intermediate Level

-- 1. Find the percentage of smokers who developed lung cancer.

SELECT 
    (SUM(CASE WHEN Smoker = 'Yes' AND Lung_Cancer_Diagnosis = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS Smoker_Cancer_Percentage
FROM lung_cancer_Dataset;

-- 2. Calculate the average survival years based on cancer stages.

SELECT Cancer_Stage, AVG(Survival_Years) AS Avg_Survival_Years
FROM lung_cancer_Dataset
GROUP BY Cancer_Stage

-- 3. Count the number of lung cancer patients based on passive smoking.

SELECT Passive_Smoker, COUNT(*) as Cancer_Cases
FROM lung_cancer_Dataset
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Passive_Smoker

-- 4. Find the country with the highest lung cancer prevalence rate.

SELECT Country, MAX(Lung_Cancer_Prevalence_Rate) as Max_Prevalence
FROM lung_cancer_Dataset
GROUP BY Country

-- 5. Identify the smoking years' impact on lung cancer.

SELECT Years_of_Smoking, COUNT(*) as Cancer_Cases
FROM lung_cancer_Dataset
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Years_of_Smoking
Order by Years_of_Smoking

-- 6. Determine the mortality rate for patients with and without early detection.

SELECT Early_Detection, AVG(Mortality_Rate) AS Avg_Mortality_Rate
FROM lung_cancer_Dataset
GROUP BY Early_Detection

-- 7. Group the lung cancer prevalence rate by developed vs. developing countries.

SELECT Developed_or_Developing, AVG(Lung_Cancer_Prevalence_Rate) AS Avg_Prevalence
FROM lung_cancer_Dataset
GROUP BY Developed_or_Developing


-- Advanced Level

-- 1. Identify the correlation between lung cancer prevalence and air pollution levels.

SELECT Air_Pollution_Exposure, AVG(Lung_Cancer_Prevalence_Rate) AS Avg_Cancer_Prevalence
FROM lung_cancer_Dataset
GROUP BY Air_Pollution_Exposure
ORDER BY Avg_Cancer_Prevalence DESC

-- 2. Find the average age of lung cancer patients for each country.

SELECT Country, AVG(AGE) AS Avg_Age
FROM lung_cancer_Dataset
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Country
ORDER BY Avg_Age DESC

-- 3. Calculate the risk factor of lung cancer by smoker status, passive smoking, and family history.

SELECT Smoker, Passive_Smoker, Family_History, COUNT(*) AS Cancer_Cases
FROM lung_cancer_Dataset
WHERE Lung_Cancer_Diagnosis ='Yes'
GROUP BY Smoker, Passive_Smoker, Family_History
ORDER BY Cancer_Cases DESC

-- 4. Rank countries based on their mortality rate.

SELECT Country, AVG(Mortality_Rate) AS Avg_Mortality_Rate,
RANK() OVER(ORDER BY AVG(Mortality_Rate) DESC) AS Mortality_Rank
FROM lung_cancer_Dataset
GROUP BY Country

-- 5. Determine if treatment type has a significant impact on survival years.

SELECT Treatment_Type, AVG(Survival_Years) as Avg_Survival_Years
FROM lung_cancer_Dataset
WHERE Lung_Cancer_Diagnosis = 'YES'
GROUP BY Treatment_Type
ORDER BY Avg_Survival_Years DESC

-- 6. Compare lung cancer prevalence in men vs. women across countries.

SELECT Country, Gender, AVG(Lung_Cancer_Prevalence_Rate) AS Avg_Prevalence
FROM lung_cancer_Dataset
GROUP BY Country, Gender
ORDER BY Country, Avg_Prevalence DESC

-- 7. Find how occupational exposure, smoking, and air pollution collectively impact lung cancer rates.

SELECT Occupational_Exposure, Smoker, Air_Pollution_Exposure,
COUNT(*) AS Cancer_Cases
FROM lung_cancer_Dataset
WHERE Lung_Cancer_Diagnosis = 'YES'
GROUP BY Occupational_Exposure, Smoker, Air_Pollution_Exposure
ORDER BY Cancer_Cases DESC

-- 8. Analyze the impact of early detection on survival years.

SELECT Early_Detection, ROUND(AVG(Survival_Years),2) AS Avg_Survival_Years
FROM lung_cancer_Dataset
GROUP BY Early_Detection
ORDER BY Avg_Survival_Years DESC