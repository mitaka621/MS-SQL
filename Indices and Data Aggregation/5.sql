select DepositGroup, Sum(DepositAmount) as TotalSum
from WizzardDeposits
group by DepositGroup