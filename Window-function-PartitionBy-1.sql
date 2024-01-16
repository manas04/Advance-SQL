--1. Sum of line totals group by Product ID and Order Quantity, in an aggregated query
select
[ProductID],
[OrderQty],
[LineTotal] =Sum([LineTotal])

from 
AdventureWorks2022.Sales.SalesOrderDetail

group by
[ProductID], [OrderQty]

Order by 1, 2;

--2. Sum of Line order using Over

select 
[ProductID],
[SalesOrderID],
[SalesorderDetailID],
[OrderQty],
[UnitPrice],
[UnitpriceDiscount],
[LineTotal],
ProductIDLineTotal = sum([LineTotal]) over(partition by [ProductID], [OrderQty])
 

from 
AdventureWorks2022.Sales.SalesOrderDetail

order by [ProductID], [OrderQty] desc;