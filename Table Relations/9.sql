use Geography

select MountainRange, PeakName, Elevation
from Peaks as p
join Mountains as m on (p.MountainId=m.Id)
where MountainRange='Rila'
order by Elevation desc