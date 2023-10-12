select s.Name as Site, l.Name as Location, s.Establishment, c.Name as  Category
from Sites as s
join Locations as l on s.LocationId=l.Id
join Categories as c on s.CategoryId=c.Id
order by c.Name desc, l.Name, s.Name