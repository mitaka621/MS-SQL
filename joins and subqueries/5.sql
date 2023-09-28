select top 3 e.EmployeeID, FirstName
from Employees as e
	full join EmployeesProjects as p on e.EmployeeID=p.EmployeeID
where p.ProjectID is null
order by e.EmployeeID