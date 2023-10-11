select c.Id, c.Name as  Client, CONCAT_WS(', ', StreetName+' '+CAST(StreetNumber as nvarchar(20)), City, CAST(PostCode as nvarchar(20)), c2.Name) as Address
from Clients as c
left join ProductsClients as p on c.Id=p.ClientId
join Addresses as a on c.AddressId=a.Id
join Countries as c2 on a.CountryId=c2.Id
where p.ProductId is null