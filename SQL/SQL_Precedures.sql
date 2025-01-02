use section7;

CREATE OR ALTER PROCEDURE What_DB_is_this AS SELECT DB_NAME() AS ThisDB;

EXEC What_DB_is_this;

CREATE or alter PROCEDURE based @program varchar(30) as Select "program based on" =@program;

exec based @program='compuer';

