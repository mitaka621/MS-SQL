create table Manufacturers(
	[ManufacturerID] int primary key identity,
	[Name] nvarchar(100),
	[EstablishedOn] date
)

create table Models(
	ModelID int primary key identity(101, 1),
	[Name] nvarchar(50),
	ManufacturerID int foreign key references Manufacturers(ManufacturerID)
)

insert into Manufacturers([Name], EstablishedOn)
values
('BMW', '07/03/1916'),
('Tesla', '01/01/2003'),
('Lada', '01/05/1966')

insert into Models([Name],ManufacturerID)
values
('X1', 1),
('i6', 1),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3)