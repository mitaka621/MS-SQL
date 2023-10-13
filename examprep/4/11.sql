create function udf_GetVolunteersCountFromADepartment (@VolunteersDepartment varchar(100))
returns int
begin
	return (select count(*)
	from Volunteers as v
	join VolunteersDepartments as vd on v.DepartmentId=vd.Id
	where vd.DepartmentName=@VolunteersDepartment)
end

SELECT dbo.udf_GetVolunteersCountFromADepartment ('Zoo events')