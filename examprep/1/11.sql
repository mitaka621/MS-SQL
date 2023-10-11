create function udf_CreatorWithBoardgames(@name nvarchar(100)) 
returns int
as
begin
	declare @ans int =
	(select count(*)
	from Creators as c
	join CreatorsBoardgames as cb on c.Id=cb.CreatorId
	where FirstName=@name
	)
	return @ans
end
