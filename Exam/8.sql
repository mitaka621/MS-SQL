select top 10 h.Name as HotelName, d.Name as DestinationName, c.Name as CountryName
from Bookings as b
join Hotels as h on b.HotelId=h.Id
join Destinations as d on h.DestinationId=d.Id
join Countries as c on d.CountryId=c.Id
where b.ArrivalDate<'2023-12-31' and HotelId%2<>0
order by CountryName, ArrivalDate
