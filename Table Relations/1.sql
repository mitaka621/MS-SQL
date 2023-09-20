create database TableRelationsExercises

use TableRelationsExercises

create table Passports(
	[PassportID] int primary key identity(101,1),
	[PassportNumber] varchar(8)
)

create table Persons(
	[PersonID] int primary key identity,
	[FirstName] nvarchar(50),
	[Salary] decimal(8, 2),
	[PassportID] int unique foreign key references Passports([PassportID])
)

insert into [Passports](PassportNumber)
values
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2')

insert into Persons(FirstName, Salary, PassportID)
values
('Roberto', 43300, 102),
('Tom',56100, 103 ),
('Yana',60200, 101)


