select Username, SUBSTRING(Email, CHARINDEX('@', Email)+1,len(Email)) as [Email Provider]
from [Users]
order by [Email Provider], Username