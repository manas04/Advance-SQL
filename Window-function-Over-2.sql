select Person.[FirstName], Person.[LastName], Employee.[JobTitle], 
EmployeePayHistory.[Rate],
[AverageRate] = AVG(EmployeePayHistory.[Rate]) over(),
[MaximumRate] = MAX(EmployeePayHistory.[Rate]) over(),
[DiffFromAvgRate] = EmployeePayHistory.[Rate] - AVG(EmployeePayHistory.[Rate]) over(),
[PercentofMaxRate] = EmployeePayHistory.[Rate] * 100 / MAX(EmployeePayHistory.[Rate]) over()

from 
[AdventureWorks2022].[Person].[Person] as "Person"
inner join [AdventureWorks2022].[HumanResources].[Employee] as "Employee" 
on Person.[BusinessEntityID] = Employee.[BusinessEntityID]
inner join [AdventureWorks2022].[HumanResources].[EmployeePayHistory] as "EmployeePayHistory"
on Person.[BusinessEntityID] = EmployeePayHistory.[BusinessEntityID];