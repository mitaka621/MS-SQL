select Name, DATEPART(YEAR, BirthDate) as BirthYear, AnimalType
from Animals as a
join AnimalTypes ant on a.AnimalTypeId=ant.Id
where OwnerId is null and 2022-DATEPART(YEAR, BirthDate)<5 and AnimalType<>'Birds'
order by Name