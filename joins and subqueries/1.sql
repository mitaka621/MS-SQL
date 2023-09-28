use SoftUni

select top 5 EmployeeID, JobTitle, e.AddressID, a.AddressText
from Employees as e join Addresses as a on e.AddressID=a.AddressID
order by AddressID