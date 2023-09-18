create view V_EmployeeNameJobTitle
as
select concat(FirstName,' ', MiddleName,' ', LastName) as [Full Name],
JobTitle
from Employees