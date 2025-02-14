 hospital management in sql 
use hospitaldb1;
create table patients(
id int,
name varchar(40),
age int,
gender varchar(40),
contact varchar(30)
);

insert into patients (id,name,age,gender,contact)values (101,"priya",20,"female","5678904321"),
(102,"uma",89,"female","5678934567"),
(103,"siva",45,"male","8906745367");
select*from patients;

 
 create table  doctor(id int,
 name varchar(90),
 specialzation varchar(40)
 );
 insert into doctor(id,name,specialzation)values(1,"yuva","eye"),
 (2,"kalai","skin"),
 (3,"java","child");
 
 select*from doctor;
 
 CREATE TABLE apptionment (
    id INT,
    patient_id INT,
    doctor_id INT,
    apptionment_date DATE,
    status VARCHAR(30)
);

 
 insert into apptionment(id,patient_id,doctor_id,apptionment_date,status)values(5,101,2,"2025-01-02","complete"),
 (3,102,1,"2025-08-02","cancel"),
 (4,103,3,"2025-01-02","complete");
 
 select*from apptionment ;
#count of all patients
select count(id) as patienttotals from patients;
#count of all apptionments
select count(id)as totalapptionment from apptionment;
# Find the maximum age of all patients
select max(age) as maxage from patients;
# Find the minimum  age of all patients
select min(age) as minage from patients;

