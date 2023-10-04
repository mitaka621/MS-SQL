select top 10 FirstName, LastName, DepartmentID
from Employees as e
where Salary> (select avg(Salary)
	from Employees as e2
	where e.DepartmentID=e2.DepartmentID)
order by DepartmentID