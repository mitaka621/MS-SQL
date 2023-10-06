create procedure usp_EmployeesBySalaryLevel
@LevelOfSalary varchar(30)
as
	select FirstName, LastName
	from Employees
	where dbo.ufn_GetSalaryLevel(Salary)=@LevelOfSalary
	