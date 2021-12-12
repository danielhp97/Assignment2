with table1 as
    (
        SELECT C.FullName as name, sum(F.OrderLineProfit) as prf
        FROM Fact_InternetSales as F
        LEFT JOIN Dim_Customer as C on F.CustomerKey=C.CustomerKey
        LEFT JOIN Dim_Date as D on F.OrderDateKey=D.DateKey
        WHERE D.MonthNumberOfYear >0 AND D.MonthNumberOfYear<=6 AND D.CalendarYear=2021
        GROUP BY 1 ORDER BY 2 DESC
    )

SELECT ROW_NUMBER() OVER(ORDER BY t.prf desc) as "rnk", t.name as "cust_name", t.prf as "profit"
FROM table1 as t
LIMIT 15