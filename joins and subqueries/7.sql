select top 5 e.EmployeeID, FirstName, p.[Name] as [ProjectName]
from Employees as e
	join EmployeesProjects as ep on e.EmployeeID=ep.EmployeeID
	join Projects as p on ep.ProjectID=p.ProjectID
where p.StartDate>'2002.08.13' and p.EndDate is null
order by EmployeeID