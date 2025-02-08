-- creating a new database

CREATE DATABASE Abedriontechnology;


use Abedriontechnology;

show tables;

-- tables

/*StudentID: Unique identifier for each student.
FirstName: Student's first name.
LastName: Student's last name.
DateOfBirth: Student's date of birth.
Gender: Student's gender.
Address: Student's home address.
PhoneNumber: Student's contact number.
Email: Student's email address.
EnrollmentDate: Date the student enrolled in the school.
*/

create table STUDENT

(
StudentID int,
Firstname Varchar(100),
Lastname Varchar(100),
DateOfBirth datetime,
Gender enum ('male', 'female'),
Address Varchar(300),
PhoneNumber char (30),
Email Varchar(200),
Enrollmentdate datetime,
Primary key (StudentID)
);

select * from student;

insert into student values

(001, 'Ireoluwa', 'Khalid', '2020-06-05', 'Male', 'Akobo', '0903216000', 'irekalid@gmail.com', '2013-07-09'),
(002, 'Khalil', 'Iremide', '2012-09-27', 'Male', 'Akobo', '09032170009', 'khalilire@gmail.com', '2012-09-10'),
(003, 'Bolaji', 'Oladejo', '1995-12-08', 'Female', 'Omolayo', '07056911628', 'bojlad@gmail.com', '2009-01-09'),
(004, 'Quadri', 'Abiodun', '2000-06-09', 'Male', 'Alakia', '08056189009', 'abioqudr@mail.com', '2011-03-17'),
(005, 'Olalekan', 'Ismail', '1991-04-11', 'Male', 'Kolapo Ishola', '09032101888', 'ismaiola@yahoo.com', '2014-09-09'),
(006, 'Habibat', 'Alowonle', '1990-03-19', 'Female', 'Ikoyi', '07088239516', 'hbibialo@hotmail.com', '2013-12-09'),
(007, 'Mojeeb', 'Ajani', '1998-04-20', 'Male', 'Bodija', '08034658739', 'mojeedaja@yahoo.com', '2014-09-10'),
(008, 'Muiz', 'Adigun', '2000-11-06', 'Male', 'Moniya', '0704576838', 'muizadi@yahoo.com', '2020-08-07');

select StudentID, Lastname, Firstname, Address from student;

Select * from student
Where address = 'Akobo';

select * from student
Where studentID = '008';

alter table student
add course char (100);

set sql_safe_updates = 0;

Update student
set course = 'Data Analysis';

select * from student;

use Abedriontechnology;

-- creating a teacher table 

/*TeacherID: Unique identifier for each teacher.
FirstName: Teacher's first name.
LastName: Teacher's last name.
DateOfBirth: Teacher's date of birth.
Gender: Teacher's gender.
Address: Teacher's home address.
PhoneNumber: Teacher's contact number.
Email: Teacher's email address.
HireDate: Date the teacher was hired.
*/
create table TEACHER

(
TeacherID int not null,
Firstname varchar(100),
Lastname varchar(100),
DateOfBirth datetime,
Gender enum ('Male', 'Female'),
Address char (200),
Phonenumber char(50),
Email varchar(100),
Hiredate datetime,
Primary key (TeacherID)
);

insert into teacher values 

(200, 'Victor', 'Anuoluwa', '1980-09-12', 'Female', 'Agungi', '09087454763', 'vicqnu@gmai.com', '2010-09-19'),
(201, 'Abiola', 'Adigun', '1985-12-12', 'Male', 'VGC', '08097654301', 'abiolaagi@yahoo.com', '2011-08-19'),
(202, 'Folasade', 'Atinuke', '1982-11-20', 'Female', 'Challenge', '07065423322', 'folasatin@mail.com', '2015-11-08'),
(203, 'Abolaji', 'Obaluluwa', '1990-09-27', 'Male', 'Oluyole', '08093487383', 'abolaola@hotmail.com', '2018-10-10'),
(204, 'Ishola', 'Akintunde', '1992-12-12', 'Male', 'Ikolaba', '0708983453', 'isholaakin@gmail.com', '2015-11-13');

select teacherID, Firstname, Lastname, hiredate, gender from teacher;

select Firstname, Address, hiredate, gender from teacher;

select * from teacher;

-- create class table

/*ClassID: Unique identifier for each class.
ClassName: Name of the class (e.g., Mathematics 101).
TeacherID: Identifier for the teacher responsible for the class*/

create table CLASS

(
ClassID int not null,
Classname varchar (100),
TeacherID int,

primary key (ClassID),
foreign key (TeacherID) references teacher(teacherID)
);

insert into class values

(901, 'Mathe 101', '200'),
(902, 'English 304', '201'),
(903, 'Biology 202', '202'),
(904, 'Physics 300', '203'),
(905, 'Chemistry 100', '204');

select * from CLASS;

-- Create enrollment table 

/*
EnrollmentID: Unique identifier for each enrollment.
StudentID: Identifier for the student enrolling in the class.
ClassID: Identifier for the class the student is enrolling in.
EnrollmentDate: Date the student enrolled in the class.
*/

Create table ENROLLMENT

(
EnrollmentID int,
StudentID int not null,
ClassID int not null,
EnrollmentDate datetime,

primary key (EnrollmentID),
foreign key (StudentID) references student(StudentID),
foreign key (ClassID) references class(ClassID)
);

insert into Enrollment values

(300, '001', '901', '2013-07-09'),
(301, '002', '902', '2012-09-10'),
(302, '003', '903', '2009-01-09'),
(303, '004', '904', '2011-03-17'),
(304, '005', '905', '2014-09-09')
;

select * from Enrollment;

-- create subject table

/*SubjectID: Unique identifier for each subject.
SubjectName: Name of the subject (e.g., Biology, History).
*/

create table SUBJECT

(
SubjectID int,
Subjectname varchar (100),

primary key (subjectID)
);

insert into subject values

(2001, 'Chemistry'),
(2002, 'Science'),
(2003, 'English'),
(2004, 'Physics'),
(2005, 'History')
;

select * from subject;

-- create Class subject

/*ClassSubjectID: Unique identifier for each class-subject pair.
ClassID: Identifier for the class.
SubjectID: Identifier for the subject.
*/

create table CLASSSUBJECT

(
ClasssubjectID int,
ClassID int,
SubjectID int,

primary key(ClasssubjectID),
foreign key(ClassID) references class(ClassID),
foreign key(SubjectID) references subject(SubjectID)
);

insert into Classsubject values

(801, '901', '2001'),
(802, '902', '2002'),
(803, '903', '2003'),
(804, '904', '2004'),
(805, '905', '2005')
;

select * from CLASSSUBJECT;

-- create grade table

/*GradeID: Unique identifier for each grade.
StudentID: Identifier for the student receiving the grade.
ClassSubjectID: Identifier for the class and subject in which the grade was received.
Grade: Grade received by the student (e.g., A, B, C).
*/

create table GRADE

(
GradeID int,
StudentID int,
ClassSubjectID int,
Grade char(30),

primary key(GradeID),
foreign key(StudentID) references Student(StudentID),
foreign key(ClasssubjectID) references classsubject(ClasssubjectID)
);

insert into GRADE values

(501, '001', '801', 'A'),
(502, '002', '802', 'C'),
(503, '003', '803', 'D'),
(504, '004', '804', 'B'),
(505, '005', '805', 'A');

select * from GRADE; 

-- create result table

/*StudentID: Unique identifier for all the students
ClassID: Unique identifier for all the student
GradeID: Unique Identifier for all the student grade
*/

create table RESULT

(
StudentID int,
ClassID int not null,
GradeID int,

foreign key(studentID) references student(studentID),
foreign key(classID) references class(ClassID),
foreign key(GradeID) references grade(gradeID)
);

insert into Result values

(001, '901', '501'),
(002, '902', '502'),
(003, '903', '503'),
(004, '904', '504'),
(005, '905', '505');

select * from Result;

select s.FIRSTNAME, s.LASTNAME, c.CLASSNAME, g.GRADE
from Student as s
inner join result as r on s.studentID = s.StudentID
inner join class as c on r.classID = c.ClassID
inner join grade as g on r.gradeID = g.gradeID;

