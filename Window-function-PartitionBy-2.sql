-- Calculating Average Price by Partion by
select 
A.Name as "ProductName",
A.ListPrice,
B.Name as "ProductSubcategory",
C.Name as "ProductCategory",
[AvgPriceByCategory] = AVG([ListPrice]) over(partition by C.Name), -- Adding another column which will give Average Price of each category
[AvgPriceByCategoryAndSubCategory] = AVG([ListPrice]) over(partition by C.Name,B.Name), -- Average Price of each category and sub category
[ProductVsCategoryDelta] = [ListPrice] - AVG([ListPrice]) Over(partition by C.Name)

from 
AdventureWorks2022.Production.Product as "A" 
join AdventureWorks2022.Production.ProductSubcategory as "B"
on A.ProductSubcategoryID = B.ProductSubcategoryID

join AdventureWorks2022.Production.ProductCategory as "C"
on B.ProductCategoryID = C.ProductCategoryID;


