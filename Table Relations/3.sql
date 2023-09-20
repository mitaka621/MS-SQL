create table Students(
	StudentID int primary key identity,
	[Name] nvarchar(255)
)

create table Exams(
	ExamID int primary key identity(101,1),
	[Name] nvarchar(255)
)

create table StudentsExams(
	[StudentID] int foreign key references Students(StudentID) not null,
	[ExamID] int foreign key references Exams(ExamID) not null
)


alter table StudentsExams
add constraint pk_CompositeKey
primary key ([StudentID],[ExamID])

insert into Students(Name)
values
('Mila'),
('Tony'),
('Ron')

insert into Exams(Name)
values
('SpringMVC'),
('Neo4j'),
('Oracle 11g')

insert into StudentsExams
values
(1,101),
(1,102),
(2,101),
(3,103),
(2,102),
(2,103)