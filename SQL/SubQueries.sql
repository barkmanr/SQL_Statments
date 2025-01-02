/* Uses Sub Queries to select data that matches data from anatoher table */

USE HR
GO

SELECT First_name, last_name FROM EMPLOYEES Where JOB_ID = (SELECT JOB_ID FROM JOBS WHERE JOB_TITLE = 'Accountant')

SELECT JOb_title From Jobs where JOB_ID IN (select JOB_ID from EMPLOYEES where SALARY > 11000)
