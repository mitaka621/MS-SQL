select DepositGroup, IsDepositExpired, avg(DepositInterest) as AverageInterest
from WizzardDeposits
where DepositStartDate>'1985-01-01'
group by DepositGroup, IsDepositExpired
order by DepositGroup desc, IsDepositExpired