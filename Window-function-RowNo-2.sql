-- Ranking all records all of the records by ListPrice
SELECT 
A.Name as "ProductName", A.ListPrice,
B.Name as "ProductSubCategory",
C.Name as "ProductCategory",
PriceRank = ROW_NUMBER() over(order by A.[ListPrice] desc)



from AdventureWorks2022.Production.Product as "A"
	join AdventureWorks2022.Production.ProductSubcategory as "B"
		on A.ProductSubcategoryID = B.ProductSubcategoryID
	join AdventureWorks2022.Production.ProductCategory as "C"
		on B.ProductCategoryID = C.ProductCategoryID;


	
-- Ranking Different Products within Product Categories
SELECT 
A.Name as "ProductName", A.ListPrice,
B.Name as "ProductSubCategory",
C.Name as "ProductCategory",
PriceRank = ROW_NUMBER() over(order by A.[ListPrice] desc),
[CategoryPriceRank] = ROW_NUMBER() Over(Partition By C.Name Order By [ListPrice] DESC)



from AdventureWorks2022.Production.Product as "A"
	join AdventureWorks2022.Production.ProductSubcategory as "B"
		on A.ProductSubcategoryID = B.ProductSubcategoryID
	join AdventureWorks2022.Production.ProductCategory as "C"
		on B.ProductCategoryID = C.ProductCategoryID;



-- Selecting Top 5 categories from different Products
SELECT 
A.Name as "ProductName", A.ListPrice,
B.Name as "ProductSubCategory",
C.Name as "ProductCategory",
PriceRank = ROW_NUMBER() over(order by A.[ListPrice] desc),
[CategoryPriceRank] = ROW_NUMBER() Over(Partition By C.Name Order By A.[ListPrice] DESC),
[Top 5 Price In categories] = 
case
	when row_number()  Over(Partition By C.Name Order By [ListPrice] DESC) <=5 then 'Yes'
	else 'No'
end 



from AdventureWorks2022.Production.Product as "A"
	join AdventureWorks2022.Production.ProductSubcategory as "B"
		on A.ProductSubcategoryID = B.ProductSubcategoryID
	join AdventureWorks2022.Production.ProductCategory as "C"
		on B.ProductCategoryID = C.ProductCategoryID;