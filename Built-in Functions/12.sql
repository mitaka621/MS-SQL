use Geography
go

select CountryName, IsoCode
from Countries
where CountryName like '%A%%A%%A%'
order by IsoCode