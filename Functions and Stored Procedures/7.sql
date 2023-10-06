create function ufn_IsWordComprised(@setOfLetters nvarchar(100), @word nvarchar(100))
returns bit
as
begin
	declare @i int=1
	while @i<=LEN(@word)
	begin
		declare @ch nvarchar(1)= SUBSTRING(@word, @i, 1)
		if CHARINDEX(@ch, @setOfLetters)=0
			return 0
		else
			set @i+=1
	end
	return 1
end

select dbo.ufn_IsWordComprised('oistmiahf','Sofia')