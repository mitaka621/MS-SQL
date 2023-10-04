select top 5	
		CountryName,

		case
		when PeakName is null then '(no highest peak)'
		else PeakName
		end as [Highest Peak Name],
		
		case
		when PeakName is null then 0
		else Elevation
		end as [Highest Peak Elevation],
		
		case
		when PeakName is null then '(no mountain)'
		else MountainRange
		end as [Mountain]
from
	(select *, DENSE_RANK() over (partition by CountryName order by Elevation desc) as [rank]
	from
		(select CountryName,PeakName, Elevation, MountainRange
		from Countries as c
			left join MountainsCountries as mc on c.CountryCode=mc.CountryCode
			left join Mountains as m on mc.MountainId=m.Id
			left join Peaks as p on m.Id=p.MountainId) as mainQuery) as SubQuery
where [rank]=1
order by CountryName, [Highest Peak Name]
