select top 7 Number, Amount, c.Name as Client
from Invoices as i
join Clients as c on i.ClientId=c.Id
where IssueDate<'2023-01-01' and Currency='EUR' or Amount>500 and c.NumberVAT like 'DE%'
order by Number, Amount desc