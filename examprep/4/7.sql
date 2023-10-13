select top 5 o.Name as Owner, COUNT(a.Id) as CountOfAnimals
from Owners as o
join Animals as a on o.Id=a.OwnerId
group by o.Name
order by CountOfAnimals desc, o.Name