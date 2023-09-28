select ContinentCode, CurrencyCode, frequency as CurrencyUsage  
from
	(select *,
	DENSE_RANK() over (partition by ContinentCode order by frequency desc) as CurrencyCount
	from
		(select ContinentCode,CurrencyCode, count(CurrencyCode)as frequency
		from Countries
		where CurrencyCode is not null
		group by ContinentCode, CurrencyCode) as coreQuery
	where frequency>1) as secQuery
where  CurrencyCount=1
order by ContinentCode