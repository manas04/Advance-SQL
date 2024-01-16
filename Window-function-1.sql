-- 1. All rows
SELECT 
*
FROM [AdventureWorks2022].[Sales].[SalesOrderHeader];




--2.) Count of all rows
SELECT 
TotalSales = SUM([TotalDue]),
SalesPersonID
FROM [AdventureWorks2022].[Sales].[SalesOrderHeader]
group by SalesPersonID;

--3.) Sales Person YTD Sales using Window function
SELECT [BusinessEntityID], 
[TerritoryID],[SalesQuota],[Bonus],[CommissionPct]
,[SalesYTD] 
,[Total YTD Sales] = SUM([SalesYTD]) OVER()

FROM
[AdventureWorks2022].[Sales].[SalesPerson]

--4.) YTD Sales by Aggregate query

SELECT SUM([SalesYTD])
from 
[AdventureWorks2022].[Sales].[SalesPerson];


-- 5.) Max YTD sales using Max function
SELECT [BusinessEntityID], 
[TerritoryID],[SalesQuota],[Bonus],[CommissionPct]
,[SalesYTD] 
,[Total YTD Sales] = SUM([SalesYTD]) OVER()
,[Max YTD Sales] = Max([SalesYTD]) Over()
,[% Best Sales] = [SalesYTD]/Max([SalesYTD]) Over()

FROM
[AdventureWorks2022].[Sales].[SalesPerson]


--6.) Max YTD Sales using Aggregate function
select max([SalesYTD]) from [AdventureWorks2022].[Sales].[SalesPerson];