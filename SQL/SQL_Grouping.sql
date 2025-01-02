--Getting the count of employees with a high salary by grouping them by thier department
USE HR
GO


select * From EMPLOYEES where Salary > 12000
select department_id, count(*) as 'number of employees' from EMPLOYEES where SALARY > 12000
group by DEPARTMENT_ID


