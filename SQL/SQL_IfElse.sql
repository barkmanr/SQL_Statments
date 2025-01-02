-- Simple use of IF, ELSE IF, & ELSE
use section7

DECLARE @MaxValue INT; DECLARE @MyVal INT; SELECT @MaxValue = MAX(SALARY) FROM EMPLOYEES; Set @MyVal=24000;

if @MaxValue > @MyVal
 BEGIN
 Select * from EMPLOYEES Where salary > @MyVal order by salary; 
 End;

ELSE IF @MaxValue = @MyVal
BEGIN
Select * from EMPLOYEES Where salary = @MyVal order by salary;
print 'yay';
END;

 Else 
 BEGIN
 Print'the value is out of bounds.'; 
 PRINT'test';
 END