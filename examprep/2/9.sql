select c.Name, Max(Price) as Price, NumberVAT as [VAT Number]
from Clients as c
join ProductsClients as pc on c.Id=pc.ClientId
join Products as p on pc.ProductId=p.Id
where c.Name not like '%KG'
group by c.Name, NumberVAT
order by Max(Price) desc