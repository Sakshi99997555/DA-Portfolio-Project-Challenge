SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM lung_cancer_data)) AS Percentage_Smokers_With_Lung_Cancer 
FROM lung_cancer_data WHERE Smoker = 'Yes' AND Lung_Cancer_Diagnosis = 'Yes';

SELECT Cancer_Stage, AVG(Survival_Years) FROM lung_cancer_data GROUP BY Cancer_Stage;

SELECT Passive_Smoker, COUNT(*) FROM lung_cancer_data WHERE Lung_Cancer_Diagnosis = 'Yes' GROUP BY Passive_Smoker;

SELECT Country, Lung_Cancer_Prevalence_Rate FROM lung_cancer_data 
ORDER BY Lung_Cancer_Prevalence_Rate DESC LIMIT 1;

SELECT Years_of_Smoking, COUNT(*) FROM lung_cancer_data 
WHERE Lung_Cancer_Diagnosis = 'Yes' GROUP BY Years_of_Smoking 
ORDER BY COUNT(*) DESC;

SELECT Early_Detection, AVG(Mortality_Rate) FROM lung_cancer_data GROUP BY Early_Detection;

SELECT Developed_or_Developing, AVG(Lung_Cancer_Prevalence_Rate) 
FROM lung_cancer_data GROUP BY Developed_or_Developing;
