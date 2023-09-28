select CountryName, Elevation, [Length]
		from Countries as c
			join MountainsCountries as m on c.CountryCode=m.CountryCode
			join Mountains as m2 on m.MountainId=m.MountainId
			join Peaks as p on m2.Id=p.MountainId
			join CountriesRivers as c2 on c.CountryCode=c2.CountryCode
			join Rivers as r on c2.RiverId=r.Id
where Elevation =6962