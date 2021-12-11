/*Dim product*/
INSERT INTO Dim_Product
(ProductKey, ProductName, ProductModelName, ProductSubCategoryName, ProductTopCategoryName, StandardCost, ListPrice, StartDate, EndDate, ProductStatus)

SELECT P.ProductID
,P.ProductName
,PM.ProductModelName
,PS.Name
,PT.Name
,P.StandardCost
,P.ListPrice
,P.SellStartDate
,P.SellEndDate
,CASE
    WHEN P.SellEndDate is null THEN "Current"
    WHEN P.SellEndDate > STR_TO_DATE('2021-09-30','%Y-%m-%d') THEN "Current"
    ELSE "Discontinued"

END as ProductStatus

FROM TB_Product as P
INNER JOIN TB_ProductModel as PM on PM.ProductModelID = P.ProductModelID /* An InnerJoin as made because some products did not have an Model ID, so we coulndt get the model names*/
LEFT JOIN TB_ProductSubCategory as PS on PS.ProductSubCategoryID=P.ProductSubCategoryID
LEFT JOIN TB_ProductTopCategory as PT on PT.ProductTopCategory=PS.ProductTopCategoryID