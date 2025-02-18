SELECT Air_Pollution_Exposure, AVG(Lung_Cancer_Prevalence_Rate) 
FROM lung_cancer_data GROUP BY Air_Pollution_Exposure;

SELECT Country, AVG(Age) FROM lung_cancer_data 
WHERE Lung_Cancer_Diagnosis = 'Yes' GROUP BY Country;

SELECT Smoker, Passive_Smoker, Family_History, AVG(Lung_Cancer_Prevalence_Rate) AS Risk_Factor 
FROM lung_cancer_data GROUP BY Smoker, Passive_Smoker, Family_History;

SELECT Country, AVG(Mortality_Rate) FROM lung_cancer_data 
GROUP BY Country ORDER BY AVG(Mortality_Rate) DESC;

SELECT Treatment_Type, AVG(Survival_Years) 
FROM lung_cancer_data GROUP BY Treatment_Type;

SELECT Gender, AVG(Lung_Cancer_Prevalence_Rate) 
FROM lung_cancer_data GROUP BY Gender;

SELECT Occupational_Exposure, Smoker, Air_Pollution_Exposure, AVG(Lung_Cancer_Prevalence_Rate) 
FROM lung_cancer_data GROUP BY Occupational_Exposure, Smoker, Air_Pollution_Exposure;

SELECT Early_Detection, AVG(Survival_Years) 
FROM lung_cancer_data GROUP BY Early_Detection;
