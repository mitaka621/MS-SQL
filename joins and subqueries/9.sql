select e1.EmployeeID, e1.FirstName, e1.ManagerID, e2.FirstName
from Employees as e1
	left join Employees as e2 on e1.ManagerID=e2.EmployeeID
where e1.ManagerID in(3,7)
order by e1.EmployeeID