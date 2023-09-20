create database University

use University

create table Majors(
	MajorID int primary key identity,
	[Name] nvarchar(255) not null
)

create table Students(
	StudentID int primary key identity,
	[StudentNumber] varchar(10) not null,
	StudentName nvarchar(255) not null,
	MajorID int foreign key references Majors(MajorID) not null
)

create table Payments(
	PaymentID int primary key identity,
	PaymentDate date not null,
	PaymentAmount decimal(7,2) not null,
	StudentID int foreign key references Students(StudentID) not null
)

create table Subjects(
	SubjectID int primary key identity,
	SubjectName nvarchar(255) not null
)

create table Agenda(
	StudentID int foreign key references Students(StudentID) not null,
	SubjectID int foreign key references Subjects(SubjectID) not null
)

alter table Agenda
add primary key (StudentID, SubjectID)