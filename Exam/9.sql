select h.Name, r.Price
from Tourists as t
join Bookings as b on t.Id=b.TouristId
join Rooms as r on b.RoomId=r.Id
join Hotels as h on b.HotelId=h.Id
where t.Name not like '%EZ'
order by r.Price desc