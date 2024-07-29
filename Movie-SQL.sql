create database MovieDataBase
use MovieDataBase
create table Languages(
Id int primary key identity(1,1),
Name nvarchar(20) not null
)
create table Genres(
Id int primary key identity(1,1),
Name nvarchar(20) not null
)
create table Ratings(
Id int primary key identity(1,1),
Star decimal(3,2) not null
)
create table Directors(
Id int primary key identity(1,1),
Name nvarchar(50) not null unique
)
create table MainRoles(
Id int primary key identity(1,1),
Name nvarchar(50) not null unique
)

insert into Directors
values('Osman Şınav'),
('Steven'),('James Camen'),('Şahin Alparslan')
select * from Directors

insert into MainRoles
values('Necati Sasmaz'),
('Memati'),('Cagatay Ulusoy'),('Tony Stark')
select * from MainRoles




insert into Ratings
values(0.5),
(1),(1.5),(2),(3),(3.5),(4),(4.5),(5)
select * from Ratings

insert into Genres
values('Comedy'),
('Horror'),('Fantasy'),('Drama'),('Real')
select * from Genres


insert into Languages
values('Turkish'),
('English'),('Russian'),('Other')
select * from Languages

CREATE TABLE Actors(
Id int PRIMARY KEY IDENTITY(1,1),
Name nvarchar(30)
)

insert into Actors
values('Rizvan'),
('Aslan'),('Asiman'),('Musa'),('Sabir')
select * from Actors

CREATE TABLE MovieActors(
MovieId int Foreign key References Movies(Id),
ActorId int Foreign key References Actors(Id)
)







create table Movies(
Id int primary key identity(1,1),
Name nvarchar(50) not null,
Year int not null,
LanguageId int foreign key references Languages(Id) not null,
GenreId int foreign key references Genres(Id) not null,
DirectorId int foreign key references Directors(Id) not null,
MainRoleId int foreign key references MainRoles(Id) not null,
RatingId int foreign key references Ratings(Id) not null
)

Insert into Movies(Name,Year,GenreId,RatingId,LanguageId,DirectorId,MainRoleId)
Values('Kurtlar Vadisi',2003,5,9,1,1,1),
('Gaddar',2024,3,7,1,4,3),
('Iron Man',2008,3,8,2,2,4),
('Thunderball',1965,2,5,2,3,2),
('Medcezir',2013,4,6,1,3,3),
('Payitaht AbdulHamid',2017,4,8,1,1,4)

INSERT INTO MovieActors (MovieId, ActorId) VALUES 
(1, 3), (1, 4), 
(2, 1),(2,2),(3,4),(3,5),(4,1),(4,3)


select M.Name as[Film Name],G.Name as [Genre],R.Star,L.Name as [Language],D.Name as [Director],MR.Name as [Main role] from Movies as M
inner join Genres as G
on M.GenreId=G.Id
inner join Ratings as R
on M.RatingId=R.Id
inner join Languages as L
on M.LanguageId=L.Id
inner join Directors as D
on M.DirectorId=D.Id
inner join MainRoles as MR
on M.MainRoleId=MR.Id

SELECT Movies.Name as [Film Name], Actors.Name as [Actor name]
FROM MovieActors
JOIN Movies ON MovieActors.MovieId = Movies.Id
JOIN Actors ON MovieActors.ActorId = Actors.Id;





