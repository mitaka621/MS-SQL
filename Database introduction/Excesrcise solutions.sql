--practice--

create database [Minions]

create table [Minions](
	[Id] int primary key,
	[Name] nvarchar(255) not null,
	[Age] int not null
)

create table [Towns](
	[Id] int primary key,
	[Name] nvarchar(255) not null
)

alter table [Minions]
add [TownId] int foreign key references [Towns]([Id]) not null

alter table [Minions]
alter column [Age] int

INSERT INTO [Towns]([Id],[Name])
VALUES
(1,'Sofia'),
(2,'Plovdiv'),
(3,'Varna')

INSERT INTO [Minions]([Id], [Name], [Age], [TownId])
VALUES
(1,'Kevin', 22, 1),
(2,'Bob', 15, 3),
(3,'Steward', null, 2)

delete from [Towns]


select * from [Minions]
select * from [Towns]

drop table [Minions]

drop table [Towns]

create table [People](
	[Id] int identity primary key,
	[Name] nvarchar(200) not null,
	[Picture] varbinary,
	check (datalength([Picture])<=2000000),
	[Height] decimal(3, 2),
	[Weight] decimal(5, 2),
	[Gender] char(1) not null,
	check([Gender]='m' or [Gender]='f'),
	[Birthdate] date not null,
	[Biography] nvarchar(max)
)

insert into [People]([Name], [Picture], [Height], [Weight], [Gender], [Birthdate], [Biography])
values
('Misho', 123, 2.34, 32.4, 'l', '1/2/2000', 'kak sme'),
('Misho2', 1234, 4.34, 12.4, 'f', '1/2/2001', 'kak sme2'),
('Misho3', 1233, 3.34, 22.4, 'm', '1/2/2002', 'kak sme3'),
('Misho4', 1232, 2.34, 32.5, 'm', '1/2/2003', 'kak sme4'),
('Misho5', 1231, 1.34, 42.4, 'm', '1/2/2004', 'kak sme5')

select * from [People]


create table [Users](
[Id] bigint identity primary key,
[Username] varchar(30) not null,
[Password] varchar(26) not null,
[ProfilePicture] varbinary,
	check (datalength([ProfilePicture])<=900000),
[LastLoginTime] datetime2,
[IsDeleted] varchar(5),
check ([IsDeleted]='false' or [IsDeleted]='true'),
)

insert into [Users] ([Username],[Password])
values
('Misho', 'MishoVelikiq'),
('Misho1', 'MishoVelikiq1'),
('Misho2', 'MishoVelikiq2'),
('Misho3', 'MishoVelikiq3'),
('Misho4', 'MishoVelikiq4')



alter table [Users]
add constraint [Keys]
primary key([Id], [Username])

alter table [Users]
add check(datalength([Password])>=5)

insert into [Users] ([Username],[Password])
values
('Misho', '12345')

alter table [Users]
add constraint [CurrentTIme]
default GETDATE() for [LastLoginTime]

insert into [Users] ([Username],[Password])
values
('NewMisho', '12345')

select * from [Users]

alter table [Users]
drop constraint [Keys]

--zad 13

create database [Movies]

use [Movies]

create table [Directors](
	[Id] int primary key identity,
	[DirectorName] nvarchar(255) not null,
	[Notes] nvarchar(max)
)

create table [Genres](
	[Id] int primary key identity,
	[GenreName] nvarchar(255) not null,
	[Notes] nvarchar(max)
)

create table [Categories](
	[Id] int primary key identity,
	[CategoryName] nvarchar(255) not null,
	[Notes] nvarchar(max)
)

create table [Movies](
	[Id] int primary key identity,
	[Title] nvarchar(50) not null,
	[DirectorId] int foreign key references [Directors]([Id]) not null,
	[CopyrightYear] date not null,
	[Length] decimal(3,2) not null,
	[GenreId] int foreign key references [Genres]([Id]) not null,
	[CategoryId] int foreign key references [Categories]([Id]) not null,
	[Rating] decimal(2,1),
	[Notes] nvarchar(max)
)

insert into [Directors]([DirectorName])
values
('Director1'),
('Director2'),
('Director3'),
('Director4'),
('Director5')

insert into [Genres]([GenreName])
values
('GenreName1'),
('GenreName2'),
('GenreName3'),
('GenreName4'),
('GenreName5')

insert into [Categories]([CategoryName])
values
('CategoryName1'),
('CategoryName2'),
('CategoryName3'),
('CategoryName4'),
('CategoryName5')

insert into [Movies]([Title], [DirectorId],[CopyrightYear],[Length],[GenreId],[CategoryId],[Rating])
values
('movie1',1,'2013',2.3,1,1,5.5),
('movie2',2,'2013',2.3,2,2,5.5),
('movie3',3,'2013',2.3,3,3,5.5),
('movie4',4,'2013',2.3,4,4,5.5),
('movie5',5,'2013',2.3,5,5,5.5)

--zad 14--

create database [CarRental]

use [CarRental]



create table [Categories](
	[Id] int primary key identity,
	[CategoryName] nvarchar(50) not null,
	[DailyRate] decimal(6,2) not null,
	[WeeklyRate] decimal(6,2) not null,
	[MonthlyRate] decimal(6,2) not null,
	[WeekendRate] decimal(6,2) not null
)

create table [Cars](
	[Id] int primary key identity,
	[PlateNumber] nvarchar(10) not null,
	[Manufacturer] nvarchar(50) not null,
	[Model] nvarchar(50) not null,
	[CarYear] date not null,
	[CategoryId] int foreign key references [Categories]([Id]),
	[Doors] tinyint not null,
	[Picture] image,
	[Condition] nvarchar(20),
	[Available] bit not null
)

create table [Employees](
	[Id] int primary key identity,
	[FirstName] nvarchar(50) not null,
	[LastName] nvarchar(50) not null,
	[Title] nvarchar(10) not null,
	[Notes] nvarchar(max)
)

create table [Customers](
	[Id] int primary key identity,
	[DriverLicenceNumber] char(10) not null,
	[FullName] nvarchar(255) not null,
	[Adress] nvarchar(255),
	[City] nvarchar(50),
	[ZIPCode] char(4),
	[Notes] nvarchar(max)
)

create table [RentalOrders](
	[Id] int primary key identity,
	[EmployeeId] int foreign key references [Employees]([Id]) not null,
	[CustomerId] int foreign key references [Customers]([Id]) not null,
	[CarId] int foreign key references [Cars]([Id]) not null,
	[TankLevel] tinyint not null,
	[KilometrageStart] int not null,
	[KilometrageEnd] int not null,
	[TotalKilometrage] int not null,
	[StartDate] date not null,
	[EndDate] date not null,
	[TotalDays] tinyint not null,
	[RateApplied] int not null,
	[TaxRate] int not null,
	[OrderStatus] bit not null,
	[Notes] nvarchar(max)
)



insert into [Categories]([CategoryName], [DailyRate], [WeeklyRate],[MonthlyRate],[WeekendRate])
values
('category1',23,123,1234,4332),
('category2',23,123,1234,4332),
('category3',23,123,1234,4332)

insert into [Cars]([PlateNumber], [Manufacturer],[Model], [CarYear], [CategoryId],[Doors],[Picture],
[Condition], Available)
values
('12345678', 'Mitsubishi', 'goodmodel', '2015', 2, 4, null, 'good', 1),
('123456782', 'Mitsubishi', 'goodmodel', '2015', 1, 4, null, 'good', 1),
('123456784', 'Mitsubishi', 'goodmodel', '2015', 3, 4, null, 'good', 1)

insert into [Employees]([FirstName], [LastName], [Title])
values
('Misho', 'Shamara', '4ista4'),
('Misho2', 'Shamara', '4ista4'),
('Misho3', 'Shamara', '4ista4')

insert into [Customers]([DriverLicenceNumber], [FullName],[Adress],[City],[ZIPCode])
values
('1234', 'nz','kak sme', 'poburkah sa', '321'),
('12342', 'nz1','kak sm2e', 'poburkah sa1', '321'),
('12343', 'nz2','kak sme3', 'poburkah sa2', '321')

insert into RentalOrders([EmployeeId], [CustomerId], [CarId], [TankLevel], [KilometrageStart],
[KilometrageEnd], [TotalKilometrage], [StartDate], [EndDate], [TotalDays], [RateApplied], [TaxRate],
[OrderStatus])
values
(1,1,1,13,14,15,16,'2000','2003',15,'13','14',1),
(2,2,2,13,14,15,16,'2000','2003',15,'13','14',1),
(3,3,3,13,14,15,16,'2000','2003',15,'13','14',1)

--zad 15--

create database [Hotel]

use [Hotel]

create table [Employees](
	[Id] int primary key identity,
	[FirstName] nvarchar(50) not null,
	[LastName] nvarchar(50) not null,
	[Title] nvarchar (10) not null,
	[Notes] nvarchar(max)
)

create table [Customers](
	[AccountNumber] int primary key identity,
	[FirstName] nvarchar(50) not null,
	[LastName] nvarchar(50) not null,
	[PhoneNumber] nvarchar(10) not null,
	[EmergencyName] nvarchar(50),
	[EmergencyNumber] nvarchar(10),
	[Notes] nvarchar(max)
)

create table [Roomstatus] (
	[RoomStatus] nvarchar(10) primary key not null,
	[Notes] nvarchar(max)
)

create table [RoomTypes] (
	[RoomType] nvarchar(10) primary key not null,
	[Notes] nvarchar(max)
)

create table [BedTypes](
	[BedType] nvarchar(10) primary key not null,
	[Notes] nvarchar(max)
)

create table [Rooms] (
	[RoomNumber] int primary key identity(100, 1),
	[RoomType] nvarchar(10) foreign key references [RoomTypes]([RoomType]) not null,
	[bedType] nvarchar(10) foreign key references [bedTypes]([bedType]) not null,
	[Rate] decimal(5,2) not null,
	[RoomStatus] nvarchar(10) foreign key references [RoomStatus] not null,
	[Notes] nvarchar(max)
)

create table [Payments] (
	[Id] int primary key identity,
	[EmployeeId] int foreign key references [Employees]([Id]) not null,
	[PaymentDate] date not null,
	[AccountNumber] int foreign key references [Customers]([AccountNumber]) not null,
	[FirstDateOccupied] date not null,
	[LastDateOccupied] date not null,
	[TotalDays] tinyint not null,
	[AmountCharged] decimal(5,2) not null,
	[TaxRate] decimal(5,2) not null,
	[TaxAmount] decimal(5,2) not null,
	[PaymentTotal] decimal(5,2) not null,
	[Notes] nvarchar(max)
)

create table [Occupancies](
	[Id] int primary key identity,
	[EmployeeId] int foreign key references [Employees]([Id]) not null,
	[DateOccupied] date not null,
	[AccountNumber] int foreign key references [Customers]([AccountNumber]) not null,
	[RoomNumber] int foreign key references [Rooms]([RoomNumber]),
	[RateApplied] decimal(5,2) not null,
	[PhoneCharge] decimal(5,2),
	[Notes] nvarchar(max)
)

insert into [Employees](FirstName, LastName, Title)
values
('Misho', 'Evreina', 'mashinata'),
('Pesho','Velikiq', 'bosa'),
('Kesho', 'Koshoviq','the bosa')

insert into [Customers](FirstName,LastName,PhoneNumber)
values
('Misho', 'Evreina','123'),
('Pesho','Velikiq', '1234567890'),
('Kesho', 'Koshoviq','1234567890')

insert into [Roomstatus]([Roomstatus])
values
('malka'),
('sredna'),
('golqma')

insert into RoomTypes(RoomType)
values
('malka'),
('sredna'),
('golqma')
insert into BedTypes(BedType)
values
('malka'),
('sredna'),
('golqma')

insert into Rooms(RoomType, bedType, rate, RoomStatus)
values
('golqma','golqma',12,'golqma' ),
('sredna','golqma',1,'golqma' ),
('malka','golqma',2,'golqma' )

insert into [Payments](EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied,LastDateOccupied, TotalDays,
AmountCharged,TaxRate,TaxAmount,PaymentTotal)
values
(1,'2003',1,'2000','2001',13,14,15,16,17),
(2,'2023',1,'2000','2001',13,14,15,16,17),
(3,'2203',1,'2020','2001',13,14,15,16,17)

insert into Occupancies (EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied)
values
(1,'2090',1,100,13),
(1,'2090',1,101,13),
(1,'2090',1,102,13)


--zad 16--

create database [SoftUni]

use [SoftUni]

create table [Towns](
	[Id]int primary key identity,
	[Name] nvarchar(255) not null
)

create table [Addresses](
	[Id] int primary key identity,
	[AddressText] nvarchar(255) not null,
	[TownId] int foreign key references [Towns] not null
)

create table [Departments](
	[Id] int primary key identity,
	[Name] nvarchar(255) not null
)

create table [Employees](
	[Id] int primary key identity,
	[FirstName] nvarchar(50) not null,
	[MiddleName] nvarchar(50) not null,
	[LastName] nvarchar(50) not null,
	[JobTitle] nvarchar(50) not null,
	[DepartmentId] int foreign key references [Departments] not null,
	[HireDate] date not null,
	[Salary] decimal(7,2) not null,
	[AddressId] int foreign key references [Addresses] not null
)
--18--

insert into [Towns]([Name])
values
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

insert into Departments([Name])
values
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

insert into [Employees](FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary,[AddressId])
values
('Ivan ','Ivanov ','Ivanov','.NET Developer',4,'01/02/2013',3500.00,1),
('Petar ','Petar  ','Petar ','Senior Engineer',1,'02/03/2004',4000,2),
('Maria  ','Petrova  ','Ivanova','Intern',5,'08/28/2016',525.25,5),
('Georgi  ','Teziev  ','Ivanov','CEO',2,'09/12/2007',3000.00,2),
('Peter  ','Pan  ','Pan','Intern',3,'09/28/2016',599.88,1)


--19 zad---

select * from Towns

select * from Departments

select * from Employees

--20 zad--
select * from Towns
order by Name

select * from Departments
order by Name

select * from Employees
order by Salary desc


--21 zad--

select [Name] from Towns
order by [Name]

select [Name] from Departments
order by [Name]

select FirstName, LastName, JobTitle, Salary from Employees
order by Salary desc

--22 zad--

update Employees
set Salary=Salary+Salary*0.1

select Salary
from Employees

--23 zad--
use Hotel
update Payments
set TaxRate=TaxRate-TaxRate*0.3

select TaxRate from Payments

delete from Occupancies