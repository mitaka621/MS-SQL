update Invoices
set DueDate='2023-04-01'
where DATEPART(MONTH, IssueDate)=11 and DATEPART(YEAR, IssueDate)=2022


update Clients
set AddressId=3
where Name like '%CO%'


