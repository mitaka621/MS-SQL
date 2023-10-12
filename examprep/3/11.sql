create function udf_GetTouristsCountOnATouristSite (@Site varchar(100))
returns int
begin
	declare @cnt int =
	(select Count(*) from Tourists as t
	join SitesTourists st on t.Id=st.TouristId
	join Sites as s on st.SiteId=s.Id 
	where s.Name=@Site)
	return @cnt
end

