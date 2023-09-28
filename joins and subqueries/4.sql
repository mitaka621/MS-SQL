select top 5 EmployeeID, FirstName, Salary, d.[Name]
from Employees as e
	join Departments as d on e.DepartmentID=d.DepartmentID
where Salary>15000
order by e.DepartmentID