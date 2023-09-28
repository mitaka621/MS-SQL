use Geography

select COUNT(CountryName)
from Countries as c
	left join MountainsCountries as m on c.CountryCode=m.CountryCode
where m.CountryCode is null