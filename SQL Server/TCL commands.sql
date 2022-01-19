CREATE DATABASE school;


USE school;


create table school(
school_id int primary key,
address_city varchar(20) not null
);


insert into school values(1, 'Jaipur');
insert into school values(2, 'Ahmedabad');
insert into school values(3, 'Bihar');
insert into school values(4, 'Mumbai');
insert into school values(5, 'Chennai');
insert into school values(6, 'Pune');
insert into school values(7, 'Visakhapatnam');


SELECT * FROM dbo.school;

BEGIN TRANSACTION
INSERT INTO dbo.school values (8,'Bengaluru')
INSERT INTO dbo.school values (9,'Udaipur')
IF(@@ERROR > 0)
BEGIN
	ROLLBACK TRANSACTION
END
BEGIN
	COMMIT TRANSACTION
END
