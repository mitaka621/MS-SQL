select b.Id, b.Name, YearPublished, c.Name as CategoryName
from Boardgames as b
join Categories as c on b.CategoryId=c.Id
where c.Name='Strategy Games' or c.Name='Wargames'
order by YearPublished desc