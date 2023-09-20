create database OnlineStore
use OnlineStore

create table Cities(
	CityID int primary key identity,
	[Name] nvarchar(255) not null
)

create table Customers(
	[CustomerID] int primary key identity,
	[Name] nvarchar(255) not null,
	Birthday date not null,
	CityID int foreign key references Cities(CityID) not null
)

create table Orders(
	OrderID int primary key identity,
	CustomerID int foreign key references Customers(CustomerID) not null
)

--
create table ItemTypes(
	[ItemTypeID] int primary key identity,
	[Name] nvarchar(255) not null
)

create table Items(
	ItemID int primary key identity,
	[Name] nvarchar(255) not null,
	ItemTypeID int foreign key references ItemTypes(ItemTypeID) not null
)

create table OrderItems(
	OrderID int foreign key references Orders(OrderID) not null,
	ItemID int foreign key references Items(ItemID) not null
)

alter table OrderItems
add primary key (OrderID, ItemID)