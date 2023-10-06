create procedure usp_GetEmployeesSalaryAboveNumber
@salaryLevel decimal(18,4)
as
	select FirstName, LastName
	from Employees
	where Salary>=@salaryLevel
