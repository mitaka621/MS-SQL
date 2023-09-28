select FirstName,LastName,HireDate, d.[Name]
from Employees as e
	join Departments as d on e.DepartmentID=d.DepartmentID
where HireDate>'1.1.1999' and d.[Name] in('Sales', 'Finance')
order by HireDate