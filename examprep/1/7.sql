select Id, CONCAT_WS(' ',FirstName, LastName) as CreatorName, Email
from Creators as c
left join CreatorsBoardgames as cb on c.Id=cb.CreatorId
where cb.BoardgameId is null