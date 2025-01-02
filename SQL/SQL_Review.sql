--this is review for the midterm of the class

use section7

SELECT UPPER(first_name) as first_name, last_name FROM employees;

SELECT DISTINCT LTRIM(department_name) as department_names, LEN(DEPARTMENT_NAME) as 'Number of letters' from Departments

SELECT CONCAT(First_name, ' ',last_name, ' ' ,department_name) as 'Full name' from employees inner join Departments on 
Employees.DEPARTMENT_ID = Departments.DEPARTMENT_ID;

SELECT first_name, last_name from Employees where first_name like '%A' order by FIRST_NAME, LAST_NAME desc;

Select * from Employees where MONTH(HIRE_DATE) = 6 and YEAR(HIRE_DATE) = 2003

SELECT department_name, count(EMPLOYEE_ID) as 'number of employees' from Departments inner join Employees on Departments.DEPARTMENT_ID = Employees.DEPARTMENT_ID
group by (DEPARTMENT_NAME) order by COUNT(EMPLOYEE_ID);

SELECT distinct e1.first_name, e1.last_name, Department_name from Employees e1 inner join Employees e2 on e1.EMPLOYEE_ID = e2.MANAGER_ID 
inner join Departments d1 on e1.DEPARTMENT_ID = d1.DEPARTMENT_ID;

SELECT count(first_name) as 'how many names', FIRST_NAME from Employees GROUP BY FIRST_NAME having Count(FIRST_NAME) > 1;

SELECT * from Employees where EMPLOYEE_ID = (Select max(EMPLOYEE_ID) from Employees)

SELECT department_name, max(salary) as 'max salary' from Departments inner join Employees on 
Departments.DEPARTMENT_ID = Employees.DEPARTMENT_ID GROUP by DEPARTMENT_NAME

SELECT first_name, last_name, department_name, job_title from Employees inner join Departments 
on Employees.DEPARTMENT_ID = Departments.DEPARTMENT_ID inner join jobs on
Employees.JOB_ID = jobs.JOB_ID where DEPARTMENT_NAME = 'sales' or DEPARTMENT_NAME = 'finance';

SELECT Countries.country_id, country_name, city, street_address from Countries left join Locations 
on Countries.COUNTRY_ID = Locations.COUNTRY_ID where COUNTRY_NAME in ('Denmark', 'China', 'Italy');

Select Concat(e.first_name, ' ', e.last_name) as Employee , concat(m.first_name, ' ', m.last_name) as Manager 
FROM Employees e inner join Employees m on e.manager_ID = m.EMPLOYEE_ID;

SELECT country, region, SUM(sales) as SUM from sales group by rollup(country,region)

SELECT year(hire_date) as Year, MONTH(hire_date) as Month,COUNT(*) as Employees, avg(salary) 'Avg Salary' from Employees 
where YEAR(HIRE_DATE) BETWEEN 2001 and 2008 group by MONTH(HIRE_DATE),YEAR(HIRE_DATE) order by YEAR(HIRE_DATE), Month(HIRE_DATE)

SELECT first_name, last_name from Employees where DEPARTMENT_ID = 
(select DEPARTMENT_ID from Departments where DEPARTMENT_NAME = 'shipping')

SELECT first_name,last_name,salary from Employees where FIRST_NAME = 'bruce' and LAST_NAME = 'Ernst'
UNION ALL SELECT First_name, last_name, salary from Employees where EMPLOYEE_ID = 
(select MANAGER_ID from Employees where FIRST_NAME = 'bruce' and LAST_NAME = 'Ernst')
/*
CREATE CLUSTERED INDEX Index_Employee_Id on Worker(Id)
SELECT*from worker where id=8 */

SELECT first_Name, last_name, department_name, max(salary) over (PARTITION by department_name),
MIN(salary) over(PARTition by department_name), AVG(Salary) over (PARTITION by department_name), COUNT(employee_id)
over (PARTITION by department_name) FROM Employees inner join Departments on Departments.DEPARTMENT_ID = Employees.EMPLOYEE_ID;

SELECT first_name,last_name, salary, Rank()over(order by salary desc) as 'row number' from Employees;

select department_id, avg(salary), DENSE_RANK()over (ORDER by avg(salary) desc) from Employees GROUP by DEPARTMENT_ID

/*CREATE or alter view emp as SELECT*from Employees where DEPARTMENT_ID
= (select DEPARTMENT_ID from Departments where DEPARTMENT_NAME = 'finance')
*/
SELECT * from emp;




