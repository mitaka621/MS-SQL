select Name, PhoneNumber, Substring(Address, CHARINDEX(', ', Address)+2, len(Address)-CHARINDEX(', ', Address)+1) as Address
from Volunteers as v
join VolunteersDepartments as vd on v.DepartmentId=vd.Id
where vd.DepartmentName='Education program assistant' and v.Address like '%Sofia%'
order by Name