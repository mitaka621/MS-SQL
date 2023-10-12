create procedure usp_AnnualRewardLottery(@TouristName varchar(100))
as
	declare @id int=(select Id from Tourists where Name=@TouristName)
	declare @cnt int =
	(select Count(*) from Tourists as t
	join SitesTourists st on t.Id=st.TouristId
	join Sites as s on st.SiteId=s.Id
	where t.Name=@TouristName)

	if (select count(*) from BonusPrizes where Name in ('Gold badge', 'Silver badge', 'Bronze badge'))<>3
	insert into BonusPrizes(Name)
	values
	('Gold badge'),
	('Silver badge'),
	('Bronze badge')

	declare @id2 int=(case 
	when @cnt>=100 
		then (select id from BonusPrizes where Name='Gold badge')
	when @cnt>=50 
		then (select id from BonusPrizes where Name='Silver badge')
	when @cnt>= 25 
		then (select id from BonusPrizes where Name='Bronze badge')
	else null
	end)
	
	if @id2 is not null
	begin
		if (select count(*) from TouristsBonusPrizes where TouristId=@id) =1
			update TouristsBonusPrizes
			set BonusPrizeId=@id2
			where TouristId=@id
		else
			insert into TouristsBonusPrizes
			values
		(@id, @id2)
	end
	select t.Name, b.Name as Reward
	from Tourists as t
	left join TouristsBonusPrizes tb on t.Id=tb.TouristId
	left join BonusPrizes as b on tb.BonusPrizeId=b.Id
	where t.Name=@TouristName

	EXEC usp_AnnualRewardLottery 'Zac Walsh'