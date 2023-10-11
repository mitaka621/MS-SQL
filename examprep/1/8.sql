select top 5 b.Name, Rating, c.Name as CategoryName
from Boardgames as b
join PlayersRanges as p on b.PlayersRangeId=p.Id
join Categories as c on b.CategoryId=c.Id
where (Rating>7 and b.Name like '%a%') or (Rating>7.5 and PlayersMin=2 and PlayersMax=5)
order by Name, Rating desc