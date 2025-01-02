USE SECTION7
GO

SELECT BusinessEntityID, PersonType,
NameStyle, Title,
FirstName, MiddleName, LastName, ModifiedDate
INTO Person
FROM AdventureWorks2019.Person.Person

SELECT *
INTO SalesOrderDetail
FROM AdventureWorks2019.Sales.SalesOrderDetail 

SELECT COUNT(*) FROM Person
SELECT COUNT(*) FROM SalesOrderDetail
