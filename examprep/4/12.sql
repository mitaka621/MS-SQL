create procedure usp_AnimalsWithOwnersOrNot(@AnimalName varchar(100))
as
	select a.Name, case when o.Name is null then 'For adoption' else o.Name end as OwnersName
	from Animals as a
	left join Owners as o on a.OwnerId=o.Id
	where a.Name=@AnimalName

	EXEC usp_AnimalsWithOwnersOrNot 'Pumpkinseed Sunfish'