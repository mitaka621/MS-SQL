select distinct FirstLetter
from(
select SUBSTRING(FirstName, 1, 1) as FirstLetter
from WizzardDeposits
where DepositGroup ='Troll Chest') as mainqury
order by FirstLetter