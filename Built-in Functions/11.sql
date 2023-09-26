select * from
(select EmployeeID, FirstName, LastName, Salary,[Rank]=
DENSE_RANK() over (partition by Salary order by EmployeeID)
from Employees
where Salary between 10000 and 50000) as [sub]
where [sub].[Rank]=2
order by Salary desc
