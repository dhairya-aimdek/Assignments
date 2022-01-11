CREATE DATABASE student;


USE student;


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


Create table student(
s_id int primary key, 
s_name varchar(20) not null,
school_id int
foreign key (school_id) references school(school_id)
);


insert into student values(1, 'Dhairya', 4);
insert into student values(2, 'Jay' , 5);
insert into student values(3, 'Shrey', 1);
insert into student values(4, 'Ravi', 3);
insert into student values(5, 'Kishan', 2);
insert into student values(6, 'Naitik', 4);
insert into student values(7, 'Pratik', NULL);


create table marks(
marks_id int primary key,
s_id int not null,
score char(10), 
status varchar(20),
foreign key (s_id) references student(s_id)
);


insert into marks values(1001, 3, '23', 'fail');
insert into marks values(1002, 6, '95', 'pass');
insert into marks values(1003, 5, 'AB', 'Absent');
insert into marks values(1004, 1, '67', 'pass'); 
insert into marks values(1005, 4, '21', 'fail');
insert into marks values(1006, 2, '73', 'pass');
insert into marks values(1007, 7, NULL, NULL);


select * from school;
select * from student;
select * from marks;


-- INNER JOIN 

select st.s_name , m.score , m.status, s.address_city from school s 
inner join student st
on s.school_id=st.school_id
inner join marks m
on m.s_id=st.s_id
order by st.s_name;


--LEFT OUTER JOIN

select st.s_name , m.score , m.status, s.address_city from school s 
left join student st
on s.school_id=st.school_id
left join marks m
on m.s_id=st.s_id;


--RIGHT OUTER JOIN

select st.s_name , m.score , m.status, s.address_city from school s 
right join student st
on s.school_id=st.school_id
right join marks m
on m.s_id=st.s_id;


--PROCEDURES

--simple procedure
create procedure spGetStudents 
as
begin
select * from student;
end


exec spGetStudents;


--procedure with one input parameter

Create procedure spGetStudentsWOIP 
@status varchar(20) 
as
begin
select s.s_id,s.s_name,m.score,m.status from student s 
INNER JOIN marks m
on s.s_id=m.s_id
where m.status = @status;
end


exec spGetStudentsWOIP @status='fail';


--procedure with one input and one output parameter

Create procedure spGetStudentsWOIPOOP 
@status varchar(20) , @count int output
as
begin
select s.s_id,s.s_name,m.score,m.status from student s 
INNER JOIN marks m
on s.s_id=m.s_id
where m.status = @status;
select @count = @@ROWCOUNT;
end


declare @count int ,@status varchar(20) = 'pass';
exec spGetStudentsWOIPOOP @status,@count output;
select @count as 'Number of students'


--VIEW

create view StudentWithAllDetail 
as
select st.s_name , m.score , m.status, s.address_city from school s 
inner join student st
on s.school_id=st.school_id
inner join marks m
on m.s_id=st.s_id;


select * from StudentWithAllDetail order by s_name ;


--STORED PROCEDURE V/S VIEW
/*

A stored procedure uses parameters to do a function... whether it is updating and inserting data, or returning single values or data sets.

A view represents a virtual table. You can join multiple tables in a view and use the view to present the data as if the data were coming from a single table.

*/