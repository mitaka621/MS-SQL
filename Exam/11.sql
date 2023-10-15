create function udf_RoomsWithTourists(@name nvarchar(50))
returns int
begin
	return (
		select Sum(AdultsCount+ChildrenCount)
		from Bookings as b
		join Rooms as r on b.RoomId=r.Id
		where r.Type=@name
		group by r.Type
	)
end