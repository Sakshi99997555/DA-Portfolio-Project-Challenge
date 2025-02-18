SELECT * FROM lung_cancer_data WHERE Lung_Cancer_Diagnosis = 'Yes';

SELECT Smoker, COUNT(*) FROM lung_cancer_data GROUP BY Smoker;

SELECT DISTINCT Cancer_Stage FROM lung_cancer_data;

SELECT AVG(Cigarettes_per_Day) FROM lung_cancer_data WHERE Smoker = 'Yes';

SELECT COUNT(*) FROM lung_cancer_data WHERE Air_Pollution_Exposure = 'High';

SELECT Country, SUM(Annual_Lung_Cancer_Deaths) AS Total_Deaths 
   FROM lung_cancer_data GROUP BY Country ORDER BY Total_Deaths DESC LIMIT 5;

SELECT Gender, COUNT(*) FROM lung_cancer_data WHERE Lung_Cancer_Diagnosis = 'Yes' GROUP BY Gender;

SELECT * FROM lung_cancer_data WHERE Age > 60 AND Lung_Cancer_Diagnosis = 'Yes';
