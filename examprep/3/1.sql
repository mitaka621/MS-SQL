create database NationalTouristSitesOfBulgaria
go

use NationalTouristSitesOfBulgaria
go

create table Categories
(
	Id int primary key identity,
	Name varchar(50) not null
)

create table Locations(
	Id int primary key identity,
	Name varchar(50) not null,
	Municipality varchar(50),
	Province varchar(50)
)

create table Sites(
	Id int primary key identity,
	Name varchar(100) not null,
	LocationId int foreign key references Locations(Id) not null,
	CategoryId int foreign key references Categories(Id) not null,
	Establishment varchar(15)
)

create table Tourists(
	Id int primary key identity,
	Name varchar(50) not null,
	Age int not null,
	check (Age>=0 and Age<=120),
	PhoneNumber varchar(20) not null,
	Nationality varchar(30) not null,
	Reward varchar(20)
)

create table SitesTourists(
	TouristId int references Tourists(Id) not null,
	SiteId int references Sites(Id) not null,
	primary key (TouristId, SiteId)
)

create table BonusPrizes(
	Id int primary key identity,
	Name varchar(50) not null
)

create table TouristsBonusPrizes(
	TouristId int references Tourists(Id) not null,
	BonusPrizeId int references BonusPrizes(Id) not null,
	primary key (TouristId, BonusPrizeId)
)

