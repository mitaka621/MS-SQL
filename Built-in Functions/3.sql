select FirstName
from Employees
where DepartmentID in(3,10) and
datepart(year,HireDate) between 1995 and 2005