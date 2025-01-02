/* Using Views to Get create new local tables*/

use section7

--part 1
CREATE OR ALTER VIEW aName AS SELECT*FROM ranks WHERE i_cost > 20

Select * from aName
select*from ranks


--part 2
CREATE OR ALTER VIEW PREFERRED AS SELECT FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMAIL, DEPARTMENT_NAME FROM EMPLOYEES e inner join 
departments d on e.department_ID = d.Department_ID WHERE salary > 1000 and DEPARTMENT_NAME='IT'

SELECT*from PREFERRED

