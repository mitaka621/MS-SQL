select h.Name as HotelName, Sum(DATEDIFF(DAY, ArrivalDate, DepartureDate)*r.Price) as HotelRevenue 
from Bookings as b
join Rooms as r on b.RoomId=r.Id
join Hotels as h on b.HotelId=h.Id
group by h.Name
order by HotelRevenue desc