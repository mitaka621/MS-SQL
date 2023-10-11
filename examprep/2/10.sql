select c.Name as Client, floor(avg(Price)) as [Average Price]
from Clients as c
join ProductsClients as pc on c.Id=pc.ClientId
join Products as p on pc.ProductId=p.Id
join Vendors as v on p.VendorId=v.Id
where v.NumberVAT like '%FR%'
group by c.Name
order by avg(Price), c.Name desc