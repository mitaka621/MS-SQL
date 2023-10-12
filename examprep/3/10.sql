select distinct Substring(t.Name, CHARINDEX(' ', t.Name), Len(t.Name)- CHARINDEX(' ', t.Name)+1) as LastName, Nationality, Age, PhoneNumber
from Tourists as t
join SitesTourists st on t.Id=st.TouristId
join Sites as s on st.SiteId=s.Id
join Categories as c on s.CategoryId=c.Id
where c.Name='History and archaeology'
order by LastName