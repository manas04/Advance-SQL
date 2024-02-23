
/* EXISTS AND JOINS IN SQL*/

select * from AdventureWorks2022.Sales.SalesOrderHeader where SalesOrderID = 43683;

select * from AdventureWorks2022.Sales.SalesOrderDetail where SalesOrderID = 43683;

-- There is one to many relationship between the above two tables 

-- USing Joins 
-- Output return by join conatins duplicate value where the LineTotal > 10000, but we only want the unique values from the SalesOrderHeader Table 

select 
	A.SalesOrderID,
	A.OrderDate,
	A.TotalDue,
	B.SalesOrderDetailID,
	B.LineTotal

from AdventureWorks2022.Sales.SalesOrderHeader A

join AdventureWorks2022.Sales.SalesOrderDetail B
on A.SalesOrderID = B.SalesOrderID

where B.LineTotal>10000
order by 1;


-- Using Exists 

select 
	A.SalesOrderID,
	A.OrderDate,
	A.TotalDue
from AdventureWorks2022.Sales.SalesOrderHeader A

where exists (select 1 from AdventureWorks2022.Sales.SalesOrderDetail B
			   where B.LineTotal>10000 and A.SalesOrderID = B.SalesOrderID)
order by 1 -- Order the result by SalesOrderId