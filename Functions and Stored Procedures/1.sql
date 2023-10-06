create procedure usp_GetEmployeesSalaryAbove35000 
as
	select FirstName, LastName
	from Employees
	where Salary>35000