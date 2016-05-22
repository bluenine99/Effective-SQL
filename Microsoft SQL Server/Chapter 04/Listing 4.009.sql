-- NOTE: Sample table Students does not exist.
SELECT Students.StudentID, Students.LastName, Students.FirstName, 
   YEAR(GETDATE()) - YEAR(Students.BirthDate) - 
    (CASE WHEN MONTH(Students.BirthDate) < MONTH(GETDATE()) 
    THEN 0 
    WHEN MONTH(Students.BirthDate) > MONTH(GETDATE()) 
    THEN 1 
    WHEN DAY(Students.BirthDate) > DAY(GETDATE()) 
    THEN 1  
    ELSE 0 END) AS Age
  FROM Students;
  
--Similar code using EmpDOB in the Employees table in SalesOrdersSample
-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example. 

USE SalesOrdersSample;
GO

SELECT Employees.EmployeeID, Employees.EmpLastName, Employees.EmpFirstName,
   (YEAR(GETDATE()) - YEAR(Employees.EmpDOB)) -
    (CASE WHEN MONTH(Employees.EmpDOB) < MONTH(GETDATE()) 
    THEN 0 
    WHEN MONTH(Employees.EmpDOB) > MONTH(GETDATE()) 
    THEN 1 
    WHEN DAY(Employees.EmpDOB) > DAY(GETDATE()) 
    THEN 1  
    ELSE 0 END) AS Age 
  FROM Employees;
