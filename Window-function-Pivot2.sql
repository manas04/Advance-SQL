/* PIVOT-2 */
select 
	[Employee Gender] = [Gender],[Sales Representative], [Buyer], [Janitor]
from 
(select 
	JobTitle, VacationHours, Gender
from AdventureWorks2022.HumanResources.Employee) A

Pivot(
Avg(VacationHours)
for JobTitle in ([Sales Representative], [Buyer], [Janitor])
) B