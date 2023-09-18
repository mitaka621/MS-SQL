select * from Countries

select CountryName, CountryCode, 
[Currency] = case
when CurrencyCode='EUR' then 'Euro' else 'Not Euro' 
end
from Countries
order by CountryName