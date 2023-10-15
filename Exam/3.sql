update Bookings
set DepartureDate=DATEADD(DAY, 1, DepartureDate)
where DATEPART(YEAR, ArrivalDate)=2023 and DATEPART(MONTH, ArrivalDate)=12

update Tourists
set Email=null
where Name like '%MA%'