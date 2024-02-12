

-- 1. Example using first value clause where I created FirstHireVacationHours of each job title

select 
	BusinessEntityID as 'EmployeeID',
	JobTitle,
	HireDate,
	VacationHours,
	FirstHireVacationHours = first_value(VacationHours) over(partition by JobTitle order by HireDate)
from 
AdventureWorks2022.HumanResources.Employee
order by JobTitle, HireDate


-- 2. Leveraging First_Value() function to get highest and lowest price of product in a given window from Product and ProductListPriceHistory tables
select 
	p.ProductID,
	p.Name,
	pl.ListPrice,
	pl.ModifiedDate,
	HighestPrice = First_Value(pl.ListPrice) over(partition by p.productID order by pl.ListPrice desc), -- First_Value window function to get highest price in the window
	LowestPrice = First_Value(pl.ListPrice) over(partition by p.productID order by pl.ListPrice asc) -- First_Vlue window function to get lowest price in the window 

from
AdventureWorks2022.Production.Product as p
join AdventureWorks2022.Production.ProductListPriceHistory as pl
on p.ProductID = pl.ProductID
order by p.ProductID, pl.ModifiedDate