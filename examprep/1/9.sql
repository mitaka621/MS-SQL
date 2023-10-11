select FullName, Email, Rating from (select CONCAT_WS(' ', FirstName, LastName) as  FullName, Email, DENSE_RANK() over (partition by Email order by rating desc)as rang, Rating
	
from Creators as c
join CreatorsBoardgames as cb on c.Id=cb.CreatorId
join Boardgames as b on cb.BoardgameId=b.Id
where Email like '%.com') as query
where rang=1
order by FullName

