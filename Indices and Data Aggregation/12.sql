select Sum([Difference])
from
	(select *,[Host Wizard Deposit]-[Guest Wizard Deposit] as [Difference]
	from
		(select FirstName as [Host Wizard], DepositAmount as [Host Wizard Deposit],
			LEAD(FirstName,1) OVER (
				ORDER BY Id
			) as [Guest Wizard],

			LEAD(DepositAmount,1) OVER (
				ORDER BY Id
			) as [Guest Wizard Deposit]
		from WizzardDeposits) as mainQury
	where [Guest Wizard Deposit] is not null) as seQuery