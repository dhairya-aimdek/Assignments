CREATE DATABASE employers


USE employers


CREATE TABLE employee(
emp_id INT PRIMARY KEY IDENTITY(1,1),
emp_name VARCHAR(250),
emp_age INT,
emp_salary FLOAT
);


INSERT INTO employee VALUES ('Harry S','20','2500'),
			    ('Axar M','32','6543.23'),
		            ('Firoz A','26','5233.23'),
			    ('Krutarth G','43','2433');


SELECT * FROM employee;

--AGGREGATE FUNCTION

--MAX
SELECT MAX(emp_age) AS 'MAX AGE' FROM employee;
SELECT emp_name,emp_salary FROM employee WHERE emp_salary = (SELECT MAX(emp_salary) FROM employee);

--MIN
SELECT MIN(emp_age) AS 'MIN AGE' FROM employee;
SELECT emp_name,emp_salary FROM employee WHERE emp_salary = (SELECT MIN(emp_salary) FROM employee);

--AVERAGE
SELECT AVG(emp_age) AS 'AVG AGE' FROM employee;
SELECT AVG(emp_salary) AS 'AVG SALARY' FROM employee;

--SUM
SELECT SUM(emp_age) AS 'SUM AGE' FROM employee;
SELECT SUM(emp_salary) AS 'SUM SALARY' FROM employee;

--COUNT
SELECT COUNT(*) AS 'TOTAL EMPLOYEE' FROM employee;

-- OTHER FUNCTIONS

--LTRIM
SELECT LTRIM('     Dhairya') AS LeftTrimmedString;

--RTRIM
SELECT RTRIM('Dhairya     ') AS RightTrimmedString;

--TRIM
SELECT TRIM('     Dhairya     ') AS TrimmedString;

--CEIL
SELECT CEILING(55.2);

--FLOOR
SELECT FLOOR(55.2);

--ABSOLUTE VALUE
SELECT ABS(-15);

--ROUND
SELECT ROUND(235.415, 2);

--SQUARE ROOT
SELECT SQRT(121);

--REPLACE
SELECT REPLACE('Dhxiryx', 'x', 'a');

--REVERSE
SELECT REVERSE('Dhairya');

--UPPER
SELECT UPPER('Dhairya');

--LOWER
SELECT LOWER('Dhairya');

--PI
SELECT PI();

