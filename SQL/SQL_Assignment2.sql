--Merging multiple tables to get an Average price in 'orderprod' where the partclass is 'SP' in the part table going through the salesorder table to conect them all 
USE section7;

SELECT AVG (orderprice) AS Average FROM orderprod
INNER JOIN salesorder ON orderprod.orderno = salesorder.orderno
INNER JOIN part ON orderprod.partno = part.partno
WHERE partclass = 'SP'
AND orderdate >= '2012-05-01' AND orderdate <='2015-09-30';
