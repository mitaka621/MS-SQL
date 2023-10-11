create database Accounting
go
use Accounting
go

create table Countries(
	Id int primary key identity,
	Name nvarchar(10) not null
)

create table Addresses (
	Id int primary key identity,
	StreetName nvarchar(20) not null,
	StreetNumber int,
	PostCode int not null,
	City nvarchar(25) not null,
	CountryId int foreign key references Countries(Id) not null
)

create table Vendors(
	Id int primary key identity,
	Name nvarchar(25) not null,
	NumberVAT nvarchar(15) not null,
	AddressId int foreign key references Addresses(Id) not null
)

create table Clients(
	Id int primary key identity,
	Name nvarchar(25) not null,
	NumberVAT nvarchar(15) not null,
	AddressId int foreign key references Addresses(Id) not null
)

create table Categories(
	Id int primary key identity,
	Name nvarchar(10) not null
)

create table Products(
	Id int primary key identity,
	Name nvarchar(35) not null,
	Price decimal(18, 2) not null,
	CategoryId int foreign key references Categories(Id) not null,
	VendorId int foreign key references Vendors(Id) not null
)

create table Invoices(
	Id int primary key identity,
	Number int unique not null,
	IssueDate DateTime2 not null,
	DueDate DateTime2 not null,
	Amount decimal(18, 2) not null,
	Currency nvarchar(5) not null,
	ClientId int foreign key references Clients(Id) not null
)

create table ProductsClients(
	ProductId int references Products(Id) not null,
	ClientId int references Clients(Id) not null,
	primary key(ProductId, ClientID)
)