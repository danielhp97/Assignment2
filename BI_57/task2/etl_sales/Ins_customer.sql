INSERT INTO Dim_Customer
(CustomerKey, AccountNumber, FullName, Gender, Age)
SELECT C.CustomerID, C.CustomerID, CONCAT(P.FirstName,P.MiddleName,P.LastName), P.Gender, TIMESTAMPDIFF(year,P.BirthDate,STR_TO_DATE('13-09-2021','%d-%m-%Y'))
FROM TB_Customer as C
INNER JOIN TB_Person as P on C.PersonID=P.PersonID