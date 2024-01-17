-- Rank(), Dense_Rank(), ROw_Number() function and their usecases
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
[CategoryPriceRank] = ROW_NUMBER() Over(Partition By C.Name Order By [ListPrice] DESC),
[Category Price Rank With Rank] = RANK() Over(Partition By C.Name Order By [ListPrice] DESC),
[Category Price Rank With Dense Rank] = DENSE_RANK() Over(Partition By C.Name Order By [ListPrice] DESC)



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
[Category Price Rank With Dense Rank] = DENSE_RANK() Over(Partition By C.Name Order By [ListPrice] DESC),
[Top 5 Price In categories] = 
case
	when Dense_Rank()  Over(Partition By C.Name Order By [ListPrice] DESC) <=5 then 'Yes'
	else 'No'
end 



from AdventureWorks2022.Production.Product as "A"
	join AdventureWorks2022.Production.ProductSubcategory as "B"
		on A.ProductSubcategoryID = B.ProductSubcategoryID
	join AdventureWorks2022.Production.ProductCategory as "C"
		on B.ProductCategoryID = C.ProductCategoryID;