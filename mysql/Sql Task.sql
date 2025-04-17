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
select * from students;
select * from students where not Students_Name = "Arjun";
select * from students where students_name = "Shubham" or roll_number = "3";
select * from students where students_name = "sunil" and roll_number = "3";
select * from students where Students_Name like "_r%";
use my_database;
show tables;
select * from courses_data;
select * from courses_data where course_name in ("physics");
select * from courses_data where course_name not in ("economics");
select * from courses_data where course_id between 30 and 100 limit 20;
select * from student_information;
select first_name, last_name, gpa, department,
case when gpa >=3 then "good"
when gpa <=3 then "not good"
else "very bad"
end as performance
from student_information;
select trim(first_name) as first_name from student_information;
select lower(last_name) as Last_Name from student_information;
select upper(first_name) as First_Name from student_information;
select Department, char_length(department) as Lenght_Of_Department from student_information;
select *, replace(Department,"Science","Adv_science") as new_department
from student_information;
select *, concat(First_Name," ", Last_Name) as Full_Name from student_information;
select replace(First_Name, "Richard", "R i cha r d") from student_information;
select trim(First_Name) from student_information;
create table drop_idx_tab(Student_ID int, Student_Names varchar(30), age int);
desc drop_idx_tab;
insert into drop_idx_tab values(1, "Alex", 18), (2, "Akash", 27), (3,"Ramisha", 21);
select * from drop_idx_tab;
create index index_unique on drop_idx_tab(Student_ID);
show index from drop_idx_tab;
drop index index_unique on drop_idx_tab;
select * from student_information;
select avg(age) as Average_Age from student_information;
select min(age) as Minimum_age from student_information;
select age, age div 10 Divided_Value from student_information;
select * from student_information;
select department, count(Department) as count_of_department from student_information group by department;
select * from student_information;
select age, sum(age) as sum_of_gpa from student_information group by age;
select sum(age) as Sum_of_Age from student_information;
select age, abs(age) from student_information group by age;
create table negative_values (num int);
insert into negative_values (num) values 
(-17), (-26), (-32), (-43), (-56), (-60);
select * from negative_values;
select abs(num) from negative_values;
select max(num) from negative_values;
select * from student_information;
select max(age) from student_information;
select age, sqrt(age) from student_information;
select age, round(sqrt(age)) from student_information;
select age, log(age) from student_information;
select age, round(log(age)) from student_information;
select power(age, 2) from student_information;
CREATE TABLE exam_info (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50),
    Scores integer
);
INSERT INTO exam_info (FirstNames, LastNames, Scores) VALUES
('John', 'Doe',  80),
('Alice', 'Smith',  75),
('Bob', 'Johnson',  78),
('Emily', 'Brown',  60),
('Michael', 'Davis', 86),
('Sarah', 'Wilson', 90),
('David', 'Lee', 75),
('Jessica', 'Taylor', 75),
('Chris', 'Evans',  55),
('Emma', 'Thompson',  67);
select * from exam_info;
select Scores, power(scores, 3) as Cube_Scores from exam_info;
create table exam_info_2 (
    StudentID int AUTO_INCREMENT PRIMARY KEY,
    FirstNames varchar(50),
    LastNames varchar(50),
    Scores float
);
insert into exam_info_2 (FirstNames, LastNames, Scores) values
('John', 'Doe',  80.345544),
('Alice', 'Smith',  75.6355),
('Bob', 'Johnson',  78.5364565),
('Emily', 'Brown',  60.3565),
('Michael', 'Davis', 86.5353656),
('Sarah', 'Wilson', 90.535464),
('David', 'Lee', 75.567765),
('Jessica', 'Taylor', 75.34242),
('Chris', 'Evans',  55.09098),
('Emma', 'Thompson',  67.34535);
select scores, round(scores, 2) as RoundedScores from exam_info_2;
CREATE TABLE attendance (
    Student_Name VARCHAR(50),
    Present BOOLEAN,
    Attendance_Date DATE
);
INSERT INTO attendance (Student_Name, Present, Attendance_Date) VALUES
('Piyush', TRUE, '2025-04-01'),
('Tushar', FALSE, '2025-04-01'),
('Utkarsha', TRUE, '2025-04-01'),
('Piyush', TRUE, '2025-04-02'),
('Tushar', TRUE, '2025-04-02'),
('Utkarsha', FALSE, '2025-04-02');
select date_format(Attendance_Date,'%b') Month_in_Date from attendance;
select day(attendance_date) from attendance;
select Month(attendance_date) from attendance;
select year(attendance_date) from attendance;
CREATE TABLE project_dates (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100),
    Start_Date DATE,
    End_Date DATE
);
INSERT INTO project_dates (Project_ID, Project_Name, Start_Date, End_Date) VALUES
(1, 'AI Chatbot', '2025-04-01', '2025-06-15'),
(2, 'Web Development', '2025-03-20', '2025-05-30'),
(3, 'Data Analysis', '2025-04-10', '2025-07-01');
select datediff(start_date, end_date ) from project_dates; 
#17-4-2025
CREATE TABLE purchases (
    CustomerID INT,
    PurchaseDate DATE,
    ReturnDate DATE);
INSERT INTO purchases (CustomerID, PurchaseDate, ReturnDate) VALUES
(1, '2024-01-01', '2024-01-05'),
(2, '2024-01-02', '2024-01-06'),
(3, '2024-01-03', '2024-01-07'),
(4, '2024-01-04', '2024-01-08'),
(5, '2024-01-05', '2024-01-09'),
(6, '2024-01-06', '2024-01-10'),
(7, '2024-01-07', '2024-01-11'),
(8, '2024-01-08', '2024-01-12'),
(9, '2024-01-09', '2024-01-13'),
(10, '2024-01-10', '2024-01-14');
select * from purchases;
select *,date_format(PurchaseDate, '%y/%M/%d') as FormatedDate from purchases;
select *, datediff(purchaseDate, returnDate) as DateDifference from purchases;
CREATE TABLE purchases2 (
    CustomerID INT,
    PurchaseDate DATE,
    ReturnDate DATE
);
INSERT INTO purchases2 (CustomerID, PurchaseDate, ReturnDate) VALUES
(1, '2024-01-01', '2024-01-09'),
(2, '2024-01-02', '2024-01-16'),
(3, '2024-01-03', '2024-01-11'),
(4, '2024-01-04', '2024-01-08'),
(5, '2024-01-05', '2024-01-09'),
(6, '2024-01-06', '2024-01-10'),
(7, '2024-01-07', '2024-01-21'),
(8, '2024-01-08', '2024-01-29'),
(9, '2024-01-09', '2024-01-13'),
(10, '2024-01-10', '2024-01-24');
select *, datediff(returndate, purchasedate) DateDifference from purchases2;
CREATE TABLE purchases3 (
    CustomerID INT,
    PurchaseDate DATE,
    ReturnDate DATE
);
INSERT INTO purchases3 (CustomerID, PurchaseDate, ReturnDate) VALUES
(1, '2024-01-01', '2024-01-05'),
(2, '2024-01-02', '2024-01-06'),
(3, '2024-01-03', '2024-01-07'),
(4, '2024-01-04', '2024-01-08'),
(5, '2024-01-05', '2024-01-09'),
(6, '2024-01-06', '2024-01-10'),
(7, '2024-01-07', '2024-01-11'),
(8, '2024-01-08', '2024-01-12'),
(9, '2024-01-09', '2024-01-13'),
(10, '2024-01-10', '2024-01-14');
select *, date_format(returndate, '%Y') as YearDate from purchases3;
select *, year(returndate) as YearDate from purchases3;
select * from student_information;
select count(Department) as count, department from student_information group by department order by Department desc;
select * from courses_data;
select * from enrollments_data;
select c.course_name, e.semester from courses_data c
inner join enrollments_data e
on c.Course_ID=e.Course_ID;
select c.course_name, e.grade from courses_data c
left join enrollments_data e
on c.Course_ID=e.Course_ID;
select c.course_level, e.course_id from enrollments_data e
right join courses_data c
on e.Course_ID=c.Course_ID;
select c.course_level, e.course_id from enrollments_data e
cross join courses_data c
on e.Course_ID=c.Course_ID;