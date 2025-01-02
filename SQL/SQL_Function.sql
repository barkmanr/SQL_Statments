--SQL Functions
USE section7;

CREATE OR ALTER FUNCTION multiplyNumbers(@num1 as int,@num2 as int)
returns INT
AS
BEGIN
RETURN @num1*@num2
END

SELECT s7u22.multiplyNumbers(10,20)
