create procedure usp_GetTownsStartingWith 
@TownName nvarchar(255)
as
	select [Name]
	from Towns
	where [Name] like @TownName+'%'