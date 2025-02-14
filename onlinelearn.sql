Online Learning Platform

create database learndb;
use learndb;
create table course (course_id int,
title varchar(50),
description varchar(70)
);
insert into  course values (101,"computersciene","basic of computer work with excel"),
(102,"web development","advancce of the develop of the web"),
(103,"data science using algorithm","basic of the algorithms using  in the python "),
(104,"powerbi","advance of the  using  power bi");

select*from course;

create table instructor (id int,
instuctor_name varchar(50),
expertise varchar(50)
);

insert into instructor values(234,"nila","Python,tally"),
(235,"bala","web developer"),
(789,"kalai","app developer"),
(678,"mala","backend developer");

select*from instructor;

create table student (stud_id int,
stud_name  varchar(30),
emailid varchar(50)
);

insert into student values (11,"priya","epriya3456@gmail.com"),
(12,"oviya","oviya3456@gmail.com"),
(13,"meena","meenu4567@gmail.com");

select*from student;

create table enrollments (student_id int,
course_id int,
enrollment_date date
);

insert into enrollments values (11,101,"2024-04-10"),
(12,103,"2024-05-03"),
(13,104,"2024-04-20");

select*from enrollments;
#count the number of students enrolled
select count(student_id) as totalenrollstudent from enrollments; 
