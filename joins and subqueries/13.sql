select m.CountryCode, count(MountainId)
from MountainsCountries as m
	join Countries as c on m.CountryCode=c.CountryCode
where c.CountryName in ('United States', 'Russia','Bulgaria')
group by m.CountryCode