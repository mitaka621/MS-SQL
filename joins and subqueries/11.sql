select MinAverageSalary=min(e.Average)
from (select avg(Salary) as Average
from Employees
group by DepartmentID)as e;

