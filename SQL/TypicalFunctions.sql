/* Typical Functions To alter Data */

USE HR
GO

SELECT MAX(salary) AS maxSalary FROM EMPLOYEES
SELECT CONCAT('if','you','save')
SELECT REPLACE('Marah Hussein','M','F')
SELECT RTRIM('Farah Hussein          ')
SELECT UPPER('farah hussein')
SELECT SUBSTRING('farah hussein',1,5)
SELECT ROUND(5.1265,2)
SELECT CEILING(5.1245) 
SELECT FLOOR(5.1245)