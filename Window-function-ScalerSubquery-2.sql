/* scaler sub-query part-2*/

select 
	BusinessEntityID,
	JobTitle,
	VacationHours,
	MaxVacationHours = (select max(VacationHours) from AdventureWorks2022.HumanResources.Employee),
	MaxPerVacationHours = VacationHours*100/(select max(VacationHours) from AdventureWorks2022.HumanResources.Employee)
from AdventureWorks2022.HumanResources.Employee
where  VacationHours*100/(select max(VacationHours) from AdventureWorks2022.HumanResources.Employee) >= 80
order by VacationHours desc;