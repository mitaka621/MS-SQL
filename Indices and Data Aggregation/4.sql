select top 2 DepositGroup
from(
select DepositGroup, AVG(MagicWandSize) as AvgSize
from WizzardDeposits
group by DepositGroup) as mainQuery
order by AvgSize
