select * from(select DepositGroup, Sum(DepositAmount) as TotalSum
from WizzardDeposits
where MagicWandCreator='Ollivander family'
group by DepositGroup) as mainQuery
where TotalSum<150000
order by TotalSum desc