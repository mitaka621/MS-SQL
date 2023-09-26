use Diablo

select top 50 [Name], FORMAT([Start], 'yyyy-MM-dd') [Start]
from Games
where DATEPART(year, Start) in(2011,2012)
order by [Start], [Name]