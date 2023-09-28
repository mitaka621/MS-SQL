select top 5 CountryName,RiverName
from CountriesRivers as c
	join Rivers as r on c.RiverId=r.Id
	right join Countries on c.CountryCode=Countries.CountryCode
	join Continents on Countries.ContinentCode=Continents.ContinentCode
where ContinentName='Africa'
order by CountryName
