select * from Countries

select top 30 CountryName, [Population]
from Countries
where ContinentCode='EU'
order by [Population] desc, CountryName