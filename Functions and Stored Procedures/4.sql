create procedure usp_GetEmployeesFromTown 
@TownName nvarchar(255)
as
	select FirstName, LastName
	from Towns as t
	join Addresses as a on t.TownID=a.TownID
	join Employees as e on a.AddressID=e.AddressID
	where [Name]=@TownName