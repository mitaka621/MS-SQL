select p.Id, p.Name, Price, c.Name as CategoryName
from Products as p
join Categories as c on p.CategoryId=c.Id
where c.Name='ADR' or c.Name='Others'
order by Price desc