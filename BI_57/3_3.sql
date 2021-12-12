with table_secondary as
    (
        SELECT Cu.FullName as fullname, sum(Fact.OrderLineProfit) as profit
        FROM Fact_InternetSales as Fact
        LEFT JOIN Dim_Customer as Cu on Fact.CustomerKey=Cu.CustomerKey
        LEFT JOIN Dim_Date as D on Fact.OrderDateKey=D.DateKey
        WHERE D.MonthNumberOfYear >0 AND D.MonthNumberOfYear<=6 AND D.CalendarYear=2021
        GROUP BY 1 ORDER BY 2 DESC
    )

SELECT ROW_NUMBER() OVER(ORDER BY t.profit desc) as "rnk", t.fullname as "cust_name", t.profit as "profit"
FROM table_secondary as t
LIMIT 15
