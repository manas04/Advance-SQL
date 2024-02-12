-- Query displaying the three most expensive order per VendorID

SELECT
	PurchaseOrderID,
	VendorID,
	OrderDate,
	TaxAmt,
	Freight,
	TotalDue

FROM

(
select
	PurchaseOrderID,
	VendorID,
	OrderDate,
	TaxAmt,
	Freight,
	TotalDue,
	Rank_Vendor = Row_number() over(partition by VendorID order by TotalDue desc)
from 
AdventureWorks2022.Purchasing.PurchaseOrderHeader

) A

where Rank_Vendor <= 3;





 -- use of Dense_Rank instead of Row_number to return same type of Total Due

SELECT
	PurchaseOrderID,
	VendorID,
	OrderDate,
	TaxAmt,
	Freight,
	TotalDue

FROM (
	SELECT 
		PurchaseOrderID,
		VendorID,
		OrderDate,
		TaxAmt,
		Freight,
		TotalDue,
		PurchaseOrderRank = DENSE_RANK() OVER(PARTITION BY VendorID ORDER BY TotalDue DESC)

	FROM AdventureWorks2022.Purchasing.PurchaseOrderHeader
) X

WHERE PurchaseOrderRank <= 3
