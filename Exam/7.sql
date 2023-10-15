select t.Id, t.Name, t.PhoneNumber
from Tourists as t
left join Bookings as b on b.TouristId=t.Id
where b.Id is null
order by t.Name