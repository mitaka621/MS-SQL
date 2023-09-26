create view V_EmployeesHiredAfter2000 as
select FirstName, LastName
from Employees
where DATEPART(year, HireDate)>2000

