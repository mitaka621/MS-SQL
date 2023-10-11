create function udf_ProductWithClients(@name nvarchar(100))
returns int
as
begin
	declare @count int 
	=(select count(*) from Clients as c
	join ProductsClients as pc on c.Id=pc.ClientId
	join Products as p on pc.ProductId=p.Id
	where p.Name=@name)
	return @count
end

SELECT dbo.udf_ProductWithClients('DAF FILTER HU12103X')