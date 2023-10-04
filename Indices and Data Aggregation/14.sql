select DepartmentID, min(Salary) as MinimumSalary
from Employees
where HireDate>'2000-01-01' and DepartmentID in (2,5,7)
group by DepartmentID