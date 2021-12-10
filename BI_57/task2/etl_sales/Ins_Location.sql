/* Dim_Location*/
INSERT INTO Dim_Location
(LocationKey, Country, Region, TaxRate, ShipCoeff)
SELECT C.CountryID, C.Country, C.Region, C.TaxRate, C.ShipCoeff
FROM TB_Country as C