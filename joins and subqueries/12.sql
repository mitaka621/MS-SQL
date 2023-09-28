select mc.CountryCode,m.MountainRange,PeakName, Elevation
from Peaks as p
	join Mountains as m on p.MountainId=m.Id
	join MountainsCountries as mc on m.id=mc.MountainId
where mc.CountryCode='BG' and Elevation>2835
order by Elevation desc
