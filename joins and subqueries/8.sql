select top 5 e.EmployeeID, FirstName,
case 
	when DATEPART(year,p.StartDate)>=2005
	then null
	else p.[Name]
end as ProjectName
from Employees as e
	join EmployeesProjects as ep on e.EmployeeID=ep.EmployeeID
	join Projects as p on ep.ProjectID=p.ProjectID
where e.EmployeeID=24