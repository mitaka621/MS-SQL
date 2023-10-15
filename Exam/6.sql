select subQuery.Id, Name
from 
	(select h.Id, h.Name, Count(*) as bookings
	from Hotels as h
	join Bookings as b on h.Id=b.HotelId
	group by h.Id, h.Name) as subQuery
join HotelsRooms as hr on subQuery.Id=hr.HotelId
join Rooms as r on hr.RoomId=r.Id
where r.Type='VIP Apartment'
order by bookings desc


