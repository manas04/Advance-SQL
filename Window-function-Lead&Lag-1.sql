-- Lead and Lag window function by selecting Total due of previous and next transaction
SELECT 
[SalesOrderID],
[OrderDate],
[CustomerID],
[TotalDue],
[Next Total Due] = Lead([TotalDue],1) OVER(ORDER BY [SalesOrderID]), --Lead by 1 row 
[Previous Total Due] = Lag([TotalDue],1) Over(order by [SalesOrderID]) -- Lag by 1 row 
from 
AdventureWorks2022.Sales.SalesOrderHeader

order by
[SalesOrderID]


SELECT 
[SalesOrderID],
[OrderDate],
[CustomerID],
[TotalDue],
[Next Total Due] = Lead([TotalDue],2) OVER(ORDER BY [SalesOrderID]), --Lead by 2 rows 
[Previous Total Due] = Lag([TotalDue],2) Over(order by [SalesOrderID]) -- Lag by 2 rows 
from 
AdventureWorks2022.Sales.SalesOrderHeader

order by
[SalesOrderID]


-- Use of Lead and Lag using Partition By function 

SELECT 
[SalesOrderID],
[OrderDate],
[CustomerID],
[TotalDue],
[Next Total Due] = Lead([TotalDue],1) OVER(PARTITION BY [CustomerID] ORDER BY [SalesOrderID]), --Lead by 1 row 
[Previous Total Due] = Lag([TotalDue],1) Over(PARTITION BY [CustomerID] ORDER BY [SalesOrderID]) -- Lag by 1 row 

FROM
AdventureWorks2022.Sales.SalesOrderHeader

ORDER BY

[CustomerID],[SalesOrderID]