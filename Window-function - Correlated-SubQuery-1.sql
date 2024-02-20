/*CORRELATED SUBQUERY PART - 1 */

select
	SalesOrderID,
	OrderDate,
	SubTotal,
	TaxAmt,
	Freight,
	TotalDue,
	MultiOrderCnt = (
						select 
						count(*)
						from AdventureWorks2022.Sales.SalesOrderDetail B
						where A.SalesOrderID = B.SalesOrderID and B.OrderQty > 1
					)



from AdventureWorks2022.Sales.SalesOrderHeader A



/*
select 
	SalesOrderId,
	OrderQty
from AdventureWorks2022.Sales.SalesOrderDetail
where OrderQty>1
order by OrderQty;
*/