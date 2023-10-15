select FORMAT (ArrivalDate, 'yyyy-MM-dd' ) as ArrivalDate, AdultsCount, ChildrenCount
from Bookings as b
join Rooms as r on b.RoomId=r.Id
order by Price desc, b.ArrivalDate