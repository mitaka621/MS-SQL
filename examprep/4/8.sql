select Concat_ws('-',o.Name, a.Name ) as OwnersAnimals, PhoneNumber, CageId
from Owners as o
join Animals as a on o.Id=a.OwnerId
join AnimalsCages as ac on a.Id=ac.AnimalId
join AnimalTypes as ant on a.AnimalTypeId=ant.Id
where ant.AnimalType='Mammals'
order by o.Name, a.Name desc