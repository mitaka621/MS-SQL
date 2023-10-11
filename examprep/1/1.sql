create database Boardgames
go
use Boardgames
go

create table Addresses(
	Id int primary key identity,
	StreetName nvarchar(100) not null,
	StreetNumber int not null,
	Town nvarchar(30) not null,
	Country nvarchar(50) not null,
	ZIP int not null
)

create table Publishers(
	Id int primary key identity,
	Name nvarchar(30) unique not null,
	AddressId int foreign key references Addresses(Id) not null,
	Website nvarchar(40),
	Phone nvarchar(20)
)

create table PlayersRanges(
	Id int primary key identity,
	PlayersMin int not null,
	PlayersMax int not null
)

create table Categories(
	Id int primary key identity,
	Name nvarchar(50) not null
)

create table Boardgames(
	Id int primary key identity,
	Name nvarchar(30) not null,
	YearPublished int not null,
	Rating decimal(3,2) not null,
	CategoryId int foreign key references Categories(Id) not null,
	PublisherId int foreign key references Publishers(Id) not null,
	PlayersRangeId int foreign key references PlayersRanges(Id) not null
)

create table Creators(
	Id int primary key identity,
	FirstName nvarchar(30) not null,
	LastName nvarchar(30) not null,
	Email nvarchar(30) not null
)

create table CreatorsBoardgames(
	CreatorId int references Creators(Id) not null,
	BoardgameId int references Boardgames(Id) not null,
	primary key (CreatorId, BoardgameId)
)