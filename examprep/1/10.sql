select LastName, Ceiling(AVG(Rating)) as AverageRating, p.Name as PublisherName
	from Creators as c
	join CreatorsBoardgames as cb on c.Id=cb.CreatorId
	join Boardgames as b on cb.BoardgameId=b.Id
	join Publishers as p on b.PublisherId=p.Id
	where p.Name='Stonemaier Games'
group by LastName, p.Name
order by AVG(Rating) desc