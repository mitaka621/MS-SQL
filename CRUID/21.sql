UPDATE Employees
SET Salary = Salary+Salary * 0.12
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Departments
    WHERE [Name] IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services')
);	

select Salary
from Employees

UPDATE Employees
SET Salary = Salary-Salary * 0.12
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Departments
    WHERE [Name] IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services')
);	

select Salary
from Employees
