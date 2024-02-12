-- Ranking all records within each group of sales order Ids

SELECT 
SalesOrderID,
SalesOrderDetailID,
LineTotal,
Ranking = ROW_NUMBER() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal Desc),
HighestTotal = FIRST_VALUE(LineTotal) OVER(PARTITION BY SalesOrderID ORDER BY LineTotal Desc),
LowestTotal = FIRST_VALUE(LineTotal) OVER(PARTITION BY SalesOrderID ORDER BY LineTotal)
from 
AdventureWorks2022.Sales.SalesOrderDetail

Order by SalesOrderID, LineTotal Desc;

-- Customer Orders by Date
SELECT 
	CustomerID,
	OrderDate,
	TotalDue,
	FirstOrderAmount = FIRST_VALUE(TotalDue) Over(Partition by CustomerID order by orderDate),
	HighestOrderAmount = FIRST_VALUE(TotalDue) over(partition by CustomerID order by orderDate desc) 
FROM 
AdventureWorks2022.Sales.SalesOrderHeader
Order By CustomerID, OrderDate