# 📌 Answers - SQL Queries

## 🔍 Introduction
This repository contains all the SQL queries answers.

---

## 🗂 Table Schema
```sql
CREATE TABLE lung_cancer_data (
    ID INT PRIMARY KEY,
    Country VARCHAR(255),
    Population_Size INT,
    Age INT,
    Gender VARCHAR(10),
    Smoker VARCHAR(3),
    Years_of_Smoking INT,
    Cigarettes_per_Day INT,
    Passive_Smoker VARCHAR(3),
    Family_History VARCHAR(3),
    Lung_Cancer_Diagnosis VARCHAR(3),
    Cancer_Stage VARCHAR(50),
    Survival_Years INT,
    Adenocarcinoma_Type VARCHAR(50),
    Air_Pollution_Exposure VARCHAR(10),
    Occupational_Exposure VARCHAR(3),
    Indoor_Pollution VARCHAR(3),
    Healthcare_Access VARCHAR(50),
    Early_Detection VARCHAR(3),
    Treatment_Type VARCHAR(50),
    Developed_or_Developing VARCHAR(50),
    Annual_Lung_Cancer_Deaths INT,
    Lung_Cancer_Prevalence_Rate FLOAT,
    Mortality_Rate FLOAT
);
```

---

## 📊 SQL Queries

### 🟢 Basic Level

#### 1️⃣ Retrieve all records for individuals diagnosed with lung cancer.
```sql
SELECT * FROM lung_cancer_data WHERE Lung_Cancer_Diagnosis = 'Yes';
```

#### 2️⃣ Count the number of smokers and non-smokers.
```sql
SELECT Smoker, COUNT(*) FROM lung_cancer_data GROUP BY Smoker;
```

#### 3️⃣ List all unique cancer stages present in the dataset.
```sql
SELECT DISTINCT Cancer_Stage FROM lung_cancer_data;
```

#### 4️⃣ Retrieve the average number of cigarettes smoked per day by smokers.
```sql
SELECT AVG(Cigarettes_per_Day) FROM lung_cancer_data WHERE Smoker = 'Yes';
```

#### 5️⃣ Count the number of people exposed to high air pollution.
```sql
SELECT COUNT(*) FROM lung_cancer_data WHERE Air_Pollution_Exposure = 'High';
```

#### 6️⃣ Find the top 5 countries with the highest lung cancer deaths.
```sql
SELECT Country, SUM(Annual_Lung_Cancer_Deaths) AS Total_Deaths
FROM lung_cancer_data
GROUP BY Country
ORDER BY Total_Deaths DESC
LIMIT 5;
```

#### 7️⃣ Count the number of people diagnosed with lung cancer by gender.
```sql
SELECT Gender, COUNT(*) FROM lung_cancer_data WHERE Lung_Cancer_Diagnosis = 'Yes' GROUP BY Gender;
```

#### 8️⃣ Retrieve records of individuals older than 60 who are diagnosed with lung cancer.
```sql
SELECT * FROM lung_cancer_data WHERE Age > 60 AND Lung_Cancer_Diagnosis = 'Yes';
```

---

### 🟡 Intermediate Level

#### 1️⃣ Find the percentage of smokers who developed lung cancer.
```sql
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM lung_cancer_data)) AS Percentage_Smokers_With_Lung_Cancer
FROM lung_cancer_data
WHERE Smoker = 'Yes' AND Lung_Cancer_Diagnosis = 'Yes';
```

#### 2️⃣ Calculate the average survival years based on cancer stages.
```sql
SELECT Cancer_Stage, AVG(Survival_Years) FROM lung_cancer_data GROUP BY Cancer_Stage;
```

#### 3️⃣ Count the number of lung cancer patients based on passive smoking.
```sql
SELECT Passive_Smoker, COUNT(*) FROM lung_cancer_data WHERE Lung_Cancer_Diagnosis = 'Yes' GROUP BY Passive_Smoker;
```

#### 4️⃣ Find the country with the highest lung cancer prevalence rate.
```sql
SELECT Country, Lung_Cancer_Prevalence_Rate FROM lung_cancer_data ORDER BY Lung_Cancer_Prevalence_Rate DESC LIMIT 1;
```

#### 5️⃣ Identify the smoking years' impact on lung cancer.
```sql
SELECT Years_of_Smoking, COUNT(*) FROM lung_cancer_data WHERE Lung_Cancer_Diagnosis = 'Yes' GROUP BY Years_of_Smoking ORDER BY COUNT(*) DESC;
```

#### 6️⃣ Determine the mortality rate for patients with and without early detection.
```sql
SELECT Early_Detection, AVG(Mortality_Rate) FROM lung_cancer_data GROUP BY Early_Detection;
```

#### 7️⃣ Group the lung cancer prevalence rate by developed vs. developing countries.
```sql
SELECT Developed_or_Developing, AVG(Lung_Cancer_Prevalence_Rate) FROM lung_cancer_data GROUP BY Developed_or_Developing;
```

---

### 🔴 Advanced Level

#### 1️⃣ Identify the correlation between lung cancer prevalence and air pollution levels.
```sql
SELECT Air_Pollution_Exposure, AVG(Lung_Cancer_Prevalence_Rate) FROM lung_cancer_data GROUP BY Air_Pollution_Exposure;
```

#### 2️⃣ Find the average age of lung cancer patients for each country.
```sql
SELECT Country, AVG(Age) FROM lung_cancer_data WHERE Lung_Cancer_Diagnosis = 'Yes' GROUP BY Country;
```

#### 3️⃣ Calculate the risk factor of lung cancer by smoker status, passive smoking, and family history.
```sql
SELECT Smoker, Passive_Smoker, Family_History, AVG(Lung_Cancer_Prevalence_Rate) AS Risk_Factor FROM lung_cancer_data GROUP BY Smoker, Passive_Smoker, Family_History;
```

#### 4️⃣ Rank countries based on their mortality rate.
```sql
SELECT Country, AVG(Mortality_Rate) FROM lung_cancer_data GROUP BY Country ORDER BY AVG(Mortality_Rate) DESC;
```

#### 5️⃣ Determine if treatment type has a significant impact on survival years.
```sql
SELECT Treatment_Type, AVG(Survival_Years) FROM lung_cancer_data GROUP BY Treatment_Type;
```

#### 6️⃣ Compare lung cancer prevalence in men vs. women across countries.
```sql
SELECT Gender, AVG(Lung_Cancer_Prevalence_Rate) FROM lung_cancer_data GROUP BY Gender;
```

#### 7️⃣ Find how occupational exposure, smoking, and air pollution collectively impact lung cancer rates.
```sql
SELECT Occupational_Exposure, Smoker, Air_Pollution_Exposure, AVG(Lung_Cancer_Prevalence_Rate) FROM lung_cancer_data GROUP BY Occupational_Exposure, Smoker, Air_Pollution_Exposure;
```

#### 8️⃣ Analyze the impact of early detection on survival years.
```sql
SELECT Early_Detection, AVG(Survival_Years) FROM lung_cancer_data GROUP BY Early_Detection;
```
