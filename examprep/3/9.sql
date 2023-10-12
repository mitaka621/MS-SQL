select distinct t.Name, Age, PhoneNumber, Nationality, case when b.Name is null then '(no bonus prize)' else b.Name end as Reward
from Tourists as t
left join TouristsBonusPrizes as tb on t.Id=tb.TouristId
left join BonusPrizes as b on tb.BonusPrizeId=b.Id
order by t.Name