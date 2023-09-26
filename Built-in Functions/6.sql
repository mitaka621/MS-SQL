select *
from Towns
where left([Name],1)in ('M', 'K', 'B','E')
order by [Name]