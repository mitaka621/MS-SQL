select Name, AnimalType, Convert(varchar,BirthDate ,104) as BirthDate
from Animals as a
join AnimalTypes as a2 on a.AnimalTypeId=a2.Id
order by Name