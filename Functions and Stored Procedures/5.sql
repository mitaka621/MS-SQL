create function ufn_GetSalaryLevel(@salary DECIMAL(18,4))
returns varchar(30)
as
begin
	if @salary<30000
	return 'Low'
	else if @salary between 30000  and 50000 
	return 'Average'

	return 'High'
end

select FirstName, Salary, dbo.ufn_GetSalaryLevel(Salary) from Employees