/*PIVOT*/

select 
[Bikes],[Clothing],[Accessories],[Components]
from 
(select 
ProductCategoryName = D.Name,
A.LineTotal

from AdventureWorks2022.Sales.SalesOrderDetail A
	join  AdventureWorks2022.Production.Product B
		on A.ProductID = B.ProductID
	join AdventureWorks2022.Production.ProductSubcategory C
		on B.ProductSubcategoryID = C.ProductSubcategoryID
	join AdventureWorks2022.Production.ProductCategory D
		on C.ProductCategoryID = D.ProductCategoryID
) A

Pivot (
sum(LineTotal) 
for ProductCategoryName in ([Bikes],[Clothing],[Accessories],[Components]) 
) B




select 
*
from 
(select 
	ProductCategoryName = D.Name,
	A.LineTotal,
	A.OrderQty

from AdventureWorks2022.Sales.SalesOrderDetail A
	join  AdventureWorks2022.Production.Product B
		on A.ProductID = B.ProductID
	join AdventureWorks2022.Production.ProductSubcategory C
		on B.ProductSubcategoryID = C.ProductSubcategoryID
	join AdventureWorks2022.Production.ProductCategory D
		on C.ProductCategoryID = D.ProductCategoryID
) A

Pivot (
sum(LineTotal) 
for ProductCategoryName in ([Bikes],[Clothing],[Accessories],[Components])
) B
order by OrderQty