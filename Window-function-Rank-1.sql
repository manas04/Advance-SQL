-- Selecting records with Rank and Dense_Rank funciton.
SELECT
[SalesOrderID],
[SalesOrderDetailID],
[LineTotal],
Ranking = ROW_NUMBER() OVER(PARTITION BY [SalesOrderID] Order By [LineTotal] DESC), -- Ranking with Row_Number() function (It maintains sequential order)
RankingWithRank = Rank() OVER(PARTITION BY [SalesOrderID] Order By [LineTotal] DESC), -- Ranking with Rank() function(It skips certian ranks)
RankingWithDense_Rank = Dense_Rank() OVER(PARTITION BY [SalesOrderID] Order By [LineTotal] DESC) 

from 
AdventureWorks2022.Sales.SalesOrderDetail

order by
[SalesOrderID], [LineTotal] DESC