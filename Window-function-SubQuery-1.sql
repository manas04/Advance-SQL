-- Introduction to Subqueries ()

select 
	SalesOrderID,
	SalesOrderDetailID,
	LineTotal,
	LineTotalRanking = Row_Number() Over(Partition by SalesOrderID order by LineTotal)
from AdventureWorks2022.Sales.SalesOrderDetail


-- We can only apply window functions in select and order by clause, to condition Window functions we need to use subqueries 
select *

from			-- outer shell 

(
select 
	SalesOrderID,
	SalesOrderDetailID,					-- Subquery Part (It will create an imaginery table)
	LineTotal,							-- Subquery is executed first 
	LineTotalRanking = Row_Number() Over(Partition by SalesOrderID order by LineTotal)
from AdventureWorks2022.Sales.SalesOrderDetail
) A
where LineTotalRanking = 1;
