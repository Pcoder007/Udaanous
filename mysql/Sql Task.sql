create database sql_task;
drop database sql_task;
use sql_task;
drop table students;
create table students(Student_Name varchar(10), Roll_number int not null, subject varchar(10), grade varchar(3), primary key(Student_Name), unique(Roll_Number));
insert into students values('Piyush', 1 , 'Maths', 'A'),
								 ('Tushar', 2 , 'Economics', 'B'),
                                 ('Sunil', 3, 'Science', 'B'),
                                 ('Utkarsha', 4, 'History', 'B'),
                                 ('Arjun', 5, 'Geography', 'A'),
                                 ('Vinit', 6, 'Biology', 'A'),
                                 ('Shubham', 7, 'Stats', 'B');
desc students;
select * from students;
update students 
set Roll_Number=10 
where Student_Name='Tushar';
truncate table students;
delete from students 
where Student_Name='Piyush';
select * from students;
alter table students drop primary key;
desc students;
alter table students add Marks int;
desc students;
select * from students;
update students
set Marks=76
where Roll_Number=3;
select * from students;
update students
set marks=79
where roll_number=4;
select * from students;
update students
set marks=87
where roll_number = 5;
select * from students;
update students 
set marks=86
where roll_number = 6;
select * from students;
update students
set marks=76
where roll_number = 7;
select * from students;
update students
set marks=89
where roll_number=10;
select * from  students;
create table Staff(Staff_Name varchar(10), age int, Roll_Number int);
show tables;
desc staff;
create table staff(Staff_Name varchar(10), age int, Roll_Number int, primary key(Roll_Number));
drop table staff;
create table staff(Staff_Name varchar(10), age int, Roll_Number int, primary key(Roll_Number));
desc staff;
alter table Staff
add constraint Roll_Number foreign key(Roll_number) references staff(Roll_Number);
INSERT INTO staff (Staff_Name, Age, Roll_Number)
VALUES 
('Riya', 29, 3),
('Karan', 42, 4),
('Sneha', 31, 5),
('Vikram', 38, 6),
('Neha', 33, 7),
('Raj', 45, 10);
desc staff;
select * from staff;
alter table Staff
add constraint Roll_Number foreign key(Roll_number) references staff(Roll_Number);
ALTER TABLE students
ADD CONSTRAINT fk_roll_number FOREIGN KEY (Roll_Number) REFERENCES staff(Roll_Number);
select * from students;
select * from staff;
desc staff;
desc students;
alter table students 
add constraint Student_Name primary key(Student_Name);
desc students;
alter table students 
rename column Student_Name to Students_Name;
select * from students;
desc students;
create index std_Subjects on students(subject);
show index from students;
select * from students where subject="biology";
explain select * from students where subject="biology";
create unique index std_subjects on students(subject);
drop index std_subjects on students;
create unique index std_Subjects on students(subject);
show index from students;
use my_database;
select * from courses_data;
select * from enrollments_data;
select ed.enrollment_ID, ed.student_Id, ed.Semester  from courses_data as cd
left join enrollments_data as ed
on cd.Course_ID=ed.Course_ID
where enrollment_ID is null;
select ed.enrollment_ID, ed.student_Id, ed.Semester  from courses_data as cd
left join enrollments_data as ed
on cd.Course_ID=ed.Course_ID
where enrollment_ID is not null;