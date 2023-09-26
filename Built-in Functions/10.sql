select EmployeeID, FirstName, LastName, Salary,[Rank]=
DENSE_RANK() over (partition by Salary order by EmployeeID)
from Employees
where Salary between 10000 and 50000
order by Salary desc