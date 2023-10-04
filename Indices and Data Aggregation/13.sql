use SoftUni

select d.DepartmentID, sum(Salary) as TotalSalary
from Departments as d
join Employees as e on d.DepartmentID=e.DepartmentID
group by d.DepartmentID