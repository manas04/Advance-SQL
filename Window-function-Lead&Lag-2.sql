-- Lag and Lead with complex joins and Parition by function  
SELECT 
A.[PurchaseOrderID],
A.[OrderDate],
A.[TotalDue],
B.[Name],
[PrevOrderFromvendorAmt] = Lag([TotalDue],1) over(partition by B.Name order by A.OrderDate),
[NextOrderByEmployeeVendor] = LEAD(B.Name,1 ) Over(partition by A.EmployeeID order by A.orderDate),
[Next2OrderByEmployeeVendor] = LEAD(B.Name,2) OVER(Partition by A.EmployeeID order by A.OrderDate)

from 
AdventureWorks2022.Purchasing.PurchaseOrderHeader as "A" 
join AdventureWorks2022.Purchasing.Vendor as "B"
	on B.BusinessEntityID = A.VendorID

where
A.[TotalDue] > 500 and Year(A.[OrderDate])>=2013


  ORDER BY 
  A.VendorID,
  A.[OrderDate]

