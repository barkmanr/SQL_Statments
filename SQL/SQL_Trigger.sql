/* using triggers to modify data when entered into table */ 

USE section7;
Drop table if EXISTS MyEmployees;
drop table if EXISTS Myjobs;

SELECT * into MyEmployees from hr.dbo.Employees;
Select * into MyJobs from hr.dbo.Jobs;

/* part 1 */

create or alter TRIGGER verifyEmployees On MyEmployees
after insert as if not EXISTS (select 1 from MyJobs j inner join inserted e on e.salary >= j.min_salary and e.salary <= j.max_salary and e.job_Id = j.job_Id)
BEGIN RAISERROR('the salary is not in the allowd range',16,1); End;

INSERT INTO MyEmployees (Employee_ID, First_name, Last_Name, Email, Hire_date, Salary, Job_ID)
VALUES (540,'Kal' , 'Smile', 'kal@mail.com', '2021-04-06', 8000, 'AC_MGR');

INSERT INTO S7U22.MyEmployees (Employee_ID, First_name, Last_Name, Email, Hire_date, Salary, Job_ID)
VALUES (540,'Kal' , 'Smile', 'kal@mail.com', '2021-04-06', 9000, 'AC_MGR');

/* part 2 */

CREATE TABLE AuditEmp (dmlDate DateTime, Comments VARCHAR(80));

CREATE OR ALTER TRIGGER s7u22.auditEmployees ON S7U22.MyEmployees
AFTER INSERT AS DECLARE @numRows INT; SET @numRows = (SELECT COUNT(*) FROM inserted);
INSERT INTO AuditEmp VALUES (SYSDATETIME(), CAST(@numRows AS varchar) + ' row(s) inserted');

INSERT INTO s7u22.MyEmployees (Employee_ID, First_name, Last_Name, Email, Hire_date, Salary, Job_ID)
VALUES (543,'Kal' , 'Smile', 'kal@mail.com', '2021-04-06', 9000, 'AC_MGR');

SELECT * FROM AuditEmp

/* part 3 */

CREATE OR ALTER TRIGGER insertMyJobs
ON MyJobs INSTEAD OF INSERT
AS INSERT INTO MyJobs
SELECT UPPER(Job_ID),Job_title, min_salary, max_Salary
FROM inserted 

INSERT INTO MyJobs VALUES('st_t', 'Student Tutor',100, 1000);

SELECT * FROM MyJobs ORDER BY min_Salary;

