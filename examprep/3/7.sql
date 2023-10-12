select Province, Municipality, l.Name as Location, Count(s.Id) as CountOfSites
from Locations as l
join Sites as s on s.LocationId=l.Id
where Province='Sofia'
group by l.Name, Province, Municipality
order by Count(s.Id) desc, l.Name