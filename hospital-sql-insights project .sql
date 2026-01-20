SELECT * FROM HospitalData


------ Total Number of Patients 

select SUM(Patients_Count) As Total_Num_Patient FROM HospitalData


------Average Number of Doctors per Hospital

select Hospital_Name, AVG((Doctors_Count)) As Avg_Doctors FROM HospitalData
group by Hospital_Name

-----Top 3 Departments with the Highest Number of Patients 

select TOP 3 Department,COUNT(patients_count) As TotalPatients FROM HospitalData
group by Department
order by TotalPatients DESC

-------Hospital with the Maximum Medical Expenses 

select top 1 Hospital_Name,cast(MAX(medical_expenses) as decimal(10,2)) as Maximum_medical_expenses from HospitalData
group by Hospital_Name
order by Maximum_medical_expenses DESC

-------Daily Average Medical Expenses

select Hospital_Name ,cast (AVG(Medical_Expenses) as decimal(10,2)) as daily_avg_medical_Expenses from HospitalData 
group by Hospital_Name
order by daily_avg_medical_Expenses


------Longest Hospital Stay 

select top 1  DATEDIFF(DAY,Admission_date,Discharge_date) as longest_hospital_stay_in_days from HospitalData 
order by longest_hospital_stay_in_days desc


------Total Patients Treated Per City 

select Location ,count(*) as total_patient_treated_per_location from HospitalData group by Location

------ Average Length of Stay Per Department 

select Department,AVG(DATEDIFF(DAY, Admission_Date, Discharge_Date)) AS Avg_lengh_stay_per_dept
from HospitalData
group by Department
order by Avg_lengh_stay_per_dept 


------- Identify the Department with the Lowest Number of Patients 

select Department ,MIN(Patients_Count) as dept_with_lowest_num_patient from HospitalData
group by Department
order by dept_with_lowest_num_patient 

--------Monthly Medical Expenses Report 

select FORMAT(Admission_Date,'yyyy-MM') AS EachMonth,
       cast(SUM(Medical_Expenses) as decimal(10,2)) AS TotaleachMonthExpenses
from HospitalData
group by FORMAT(Admission_Date,'yyyy-MM')



