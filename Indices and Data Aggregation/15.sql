select * into EmployeesNew
from Employees
where Salary>30000


delete
from EmployeesNew
where ManagerID=42

update EmployeesNew
set Salary+=5000
where DepartmentID = 1

select DepartmentID, avg(Salary) as AverageSalary
from EmployeesNew
group by DepartmentID
