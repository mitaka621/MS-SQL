create database  TouristAgency
go

use TouristAgency
go

create table Countries(
	Id int primary key identity,
	Name nvarchar(50) not null
)

create table Destinations(
	Id int primary key identity,
	Name nvarchar(50) not null,
	CountryId int foreign key references Countries(Id) not null
)

create table Rooms(
	Id int primary key identity,
	[Type] nvarchar(40) not null,
	Price decimal(18,2) not null,
	BedCount int not null,
	check(BedCount>0 and BedCount<=10)
)

create table Hotels(
	Id int primary key identity,
	Name nvarchar(50) not null,
	DestinationId int foreign key references Destinations(Id) not null
)

create table Tourists(
	Id int primary key identity,
	Name nvarchar(80) not null,
	PhoneNumber nvarchar(20) not null,
	Email nvarchar(80),
	CountryId int foreign key references Countries(Id) not null
)

create table Bookings(
	Id int primary key identity,
	ArrivalDate DateTime2 not null,
	DepartureDate DateTime2 not null,
	AdultsCount int not null,
	check(AdultsCount>=1 and AdultsCount<=10),
	ChildrenCount int not null,
	check (ChildrenCount>=0 and ChildrenCount<=9),
	TouristId int foreign key references Tourists(Id) not null,
	HotelId int foreign key references Hotels(Id) not null,
	RoomId int foreign key references Rooms(Id) not null
)

create table HotelsRooms(
	HotelId int references Hotels(Id) not null,
	RoomId int references Rooms(Id) not null,
	primary key (HotelId, RoomId)
)