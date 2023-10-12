select  s.Name as  Site, l.Name as Location, Municipality, Province, Establishment
from Sites as s
join Locations as l on s.LocationId=l.Id
where (l.Name not like 'B%' and l.Name not like 'M%' and l.Name not like 'D%') and Establishment like '%BC'
order by s.Name