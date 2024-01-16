-- Sum of line totals by sales order ID using window function
SELECT
[SalesOrderID],
[SalesOrderDetailID],
[LineTotal],
ProductIDLineTotal = SUM([LineTotal]) OVER (PARTITION BY SalesOrderID),
Ranking = ROW_NUMBER() OVER (PARTITION BY SalesOrderID ORDER BY [LineTotal] DESC) --We are ranking within the partition or within the group using ROW_Number 

FROM 
AdventureWorks2022.Sales.SalesOrderDetail

ORDER BY SalesOrderID;

-- By aggregate query
select 
[SalesOrderID], 
[LineTotal] = Sum([LineTotal])

from AdventureWorks2022.Sales.SalesOrderDetail

group by [SalesOrderID]


--Without using partition by or forming groups,  just  ranking the rows 
SELECT
[SalesOrderID],
[SalesOrderDetailID],
[LineTotal],
ProductIDLineTotal = SUM([LineTotal]) OVER (PARTITION BY SalesOrderID),
Ranking = ROW_NUMBER() OVER (ORDER BY [LineTotal]) --We are ranking within the partition or within the group using ROW_Number 

FROM 
AdventureWorks2022.Sales.SalesOrderDetail

ORDER BY Ranking;