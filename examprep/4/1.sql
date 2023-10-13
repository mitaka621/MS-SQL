create database Zoo
go

use Zoo
go

create table Owners(
	Id int primary key identity,
	Name varchar(50) not null,
	PhoneNumber varchar(15) not null,
	Address varchar(50)
)

create table AnimalTypes(
	Id int primary key identity,
	AnimalType varchar(30) not null
)

create table Cages(
	Id int primary key identity,
	AnimalTypeId int foreign key references AnimalTypes(Id) not null
)

create table Animals(
	Id int primary key identity,
	Name varchar(30) not null,
	BirthDate date not null,
	OwnerId int foreign key references Owners(Id),
	AnimalTypeId int foreign key references AnimalTypes(Id) not null
)

create table AnimalsCages(
	CageId int references Cages(Id) not null,
	AnimalId int references Animals(Id) not null,
	primary key (CageId, AnimalId)
)

create table VolunteersDepartments(
	Id int primary key identity,
	DepartmentName varchar(30) not null
)

create table Volunteers(
	Id int primary key identity,
	Name varchar(50) not null,
	PhoneNumber varchar(15) not null,
	Address varchar(50),
	AnimalId int foreign key references Animals(Id),
	DepartmentId int foreign key references VolunteersDepartments(Id) not null
)