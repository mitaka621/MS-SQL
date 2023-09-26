select Username, IpAddress
from Users
where IpAddress like '___.1%.%.___'
order by Username