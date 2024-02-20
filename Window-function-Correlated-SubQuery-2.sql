/*CORRELATED SUBQUERY PART - 2 */

select	
	PurchaseOrderID,
	VendorID,
	OrderDate,
	TotalDue,
	NonRejectedItems = (select
						count(*)
						from AdventureWorks2022.Purchasing.PurchaseOrderDetail B
						where A.PurchaseOrderID = B.PurchaseOrderID 
						and B.RejectedQty = 0)

from AdventureWorks2022.Purchasing.PurchaseOrderHeader A

select	
	PurchaseOrderID,
	VendorID,
	OrderDate,
	TotalDue,
	MostExpensiveItem = (select
						max(UnitPrice)
						from AdventureWorks2022.Purchasing.PurchaseOrderDetail B
						where A.PurchaseOrderID = B.PurchaseOrderID )

from AdventureWorks2022.Purchasing.PurchaseOrderHeader A





-- Subquery
/*
select 
	PurchaseOrderId,
	count(*)
from AdventureWorks2022.Purchasing.PurchaseOrderDetail
where PurchaseOrderID=1
*/
