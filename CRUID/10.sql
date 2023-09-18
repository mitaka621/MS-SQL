select CONCAT_WS(' ', FirstName, MiddleName, LastName) as [Full Name]
from Employees
where Salary IN(25000, 14000, 12500 , 23600)