/* scaler sub-query */

select 
	ProductID,
	Name,
	StandardCost,
	ListPrice,
	AvgListPrice = avg(ListPrice) over(),   -- using simple widow function 
	AvgListPrice2 = (select avg(ListPrice) from AdventureWorks2022.Production.Product), -- using the scaler sub-query
	AvgListPriceDiff = ListPrice - (select avg(ListPrice) from AdventureWorks2022.Production.Product)

from AdventureWorks2022.Production.Product
where ListPrice > (select avg(ListPrice) from AdventureWorks2022.Production.Product)
order by ListPrice;
