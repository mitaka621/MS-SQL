create procedure usp_SearchByCountry(@country nvarchar(255))
as
	select v.Name as Vendor, NumberVAT as VAT, a.StreetName+' '+cast(a.StreetNumber as nvarchar(50)) as [Street Info], a.City+' '+cast(a.PostCode as nvarchar(50)) as [City Info]
	from Vendors as v
	join Addresses as a on v.AddressId=a.Id
	join Countries as c on a.CountryId=c.Id
	where c.Name=@country
	order by v.Name, City