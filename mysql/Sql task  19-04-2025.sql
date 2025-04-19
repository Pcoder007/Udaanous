select * from courses_data;
select * from enrollments_data;
select * from student_information;
select count(*) as count, Department from student_information where age > 22 group by Department having Department='science';
select * from enrollments_data
where exists (select 1 from student_information where student_information.Student_ID=enrollments_data.Student_ID and Student_ID > 100);
CREATE TABLE student_info (
    StudentID INT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50)
);
INSERT INTO student_info (StudentID, FirstNames, LastNames) VALUES
(1, 'John', 'Doe'),
(2, 'Alice', 'Smith'),
(3, 'Bob', 'Johnson'),
(4, 'Emily', 'Brown'),
(5, 'Michael', 'Davis'),
(6, 'Sarah', 'Wilson'),
(7, 'David', 'Lee'),
(8, 'Jessica', 'Taylor'),
(9, 'Chris', 'Evans'),
(10, 'Emma', 'Thompson');

CREATE TABLE exam_info_3 (
    StudentID INT PRIMARY KEY,
    Subjects VARCHAR(50),
    Scores integer
);
INSERT INTO exam_info_3 (StudentID, Subjects, Scores) VALUES
(1, 'Math',  80),
(2, 'English',  75),
(3, 'Science',  78),
(4, 'Math',  60),
(5, 'English', 86),
(6, 'Science', 90),
(7, 'Science', 75),
(8, 'English', 75),
(9, 'Math',  55),
(10, 'Math',  67);

select * from student_info;
select * from exam_info_3;
select * from Student_info 
where FirstNames > any (select scores from exam_info_3 where Student_info.studentId=exam_info_3.studentId and  scores > 75);
select * from student_info as si
join exam_info_3 as ei
on si.StudentID=ei.StudentID
where scores > 75; 

CREATE TABLE student_info_1 (
    StudentID INT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50)
);

INSERT INTO student_info_1 (StudentID, FirstNames, LastNames) VALUES
(1, 'John', 'Doe'),
(2, 'Alice', 'Smith'),
(3, 'Bob', 'Johnson'),
(4, 'Emily', 'Brown'),
(5, 'Michael', 'Davis'),
(6, 'Sarah', 'Wilson'),
(7, 'David', 'Lee'),
(8, 'Jessica', 'Taylor'),
(9, 'Chris', 'Evans'),
(10, 'Emma', 'Thompson');

CREATE TABLE exam_info_5 (
    StudentID INT PRIMARY KEY,
    Subjects VARCHAR(50),
    Scores integer
);
 INSERT INTO exam_info_5 (StudentID, Subjects, Scores) VALUES
(1, 'Math',  80),
(2, 'English',  75),
(3, 'Science',  78),
(4, 'Math',  60),
(5, 'English', 86),
(6, 'Science', 90),
(7, 'Science', 75),
(8, 'English', 75),
(9, 'Math',  55),
(10, 'Math',  67);

select * from student_info_1 as si
join exam_info_5 as E
on si.studentid = E.Studentid
where E.scores  > any( select 3 from exam_info_5 as E where si.studentid = E. Studentid and scores > 75);