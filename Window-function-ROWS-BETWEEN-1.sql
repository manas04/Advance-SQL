
-- Rolling three day total using ROWS-Between window function (2 preceding and current row)

select OrderDate, TotalDue,
	SalesLast3Days = sum(TotalDue) over(order by orderDate rows between 2 preceding and current row)

from 

(SELECT OrderDate, 
		TotalDue = Sum(TotalDue)
from AdventureWorks2022.Sales.SalesOrderHeader
where year(orderDate) = 2014
group by OrderDate) X
order by OrderDate
	

-- Rolling three day total using ROWS-Between window function (3 preceding and 1 preceeding)

select OrderDate, TotalDue,
	SalesLast3Days = sum(TotalDue) over(order by orderDate rows between 3 preceding and 1 preceding)

from 

(SELECT OrderDate, 
		TotalDue = Sum(TotalDue)
from AdventureWorks2022.Sales.SalesOrderHeader
where year(orderDate) = 2014
group by OrderDate) X
order by OrderDate


-- Rolling three day total using ROWS-Between window function (1 preceding and 1 following)

select OrderDate, TotalDue,
	SalesLast3Days = sum(TotalDue) over(order by orderDate rows between 1 preceding and 1 following)

from 

(SELECT OrderDate, 
		TotalDue = Sum(TotalDue)
from AdventureWorks2022.Sales.SalesOrderHeader
where year(orderDate) = 2014
group by OrderDate) X
order by OrderDate



-- Rolling three day total using ROWS-Between window function (current and 2 following)

select OrderDate, TotalDue,
	AvgSalesLast3Days = avg(TotalDue) over(order by orderDate rows between 2 preceding and current row)

from 

(SELECT OrderDate, 
		TotalDue = Sum(TotalDue)
from AdventureWorks2022.Sales.SalesOrderHeader
where year(orderDate) = 2014
group by OrderDate) X
order by OrderDate

