/* ROWS-BETWEEN WINDOW FUNCTION */

SELECT OrderDate,
	OrderMonth,
	OrderYear,
	subTotal,
	Rolling3MonthTotal = sum(subTotal) over(order by OrderYear, OrderMonth Rows between 2 preceding and current row),
	MovingAvg6Month = AVG(subTotal) over(order by OrderYear, OrderMonth ROWS BETWEEN 6 preceding and 1 preceding),
	MovingAvgNext2Months = avg(subTotal) over(order by OrderYear, OrderMonth ROWS BETWEEN current row and 2 following) 
from 

(
select
	OrderDate,
	OrderMonth = month(OrderDate),
	OrderYear = year(OrderDate),
	subTotal = sum(subTotal)
from AdventureWorks2022.Purchasing.PurchaseOrderHeader
group by OrderDate
) X
order by OrderYear, OrderMonth