select distinct DepartmentID, Salary as ThirdHighestSalary
from
	(select DepartmentID, Salary, DENSE_RANK() over (partition by DepartmentID order by salary desc) as rank
	from Employees) as main
where rank=3
