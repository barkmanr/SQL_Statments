--Using temp tables

use section7;

With EmpRanks(Employee_ID, FIRST_NAME,LAST_NAME,salary,rnk) as 
(select Employee_id, first_name,last_name,salary, DENSE_RANK() over (order by salary desc) as rnk from employees)

SELECT * from EmpRanks where rnk  = 2;

