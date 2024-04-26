create database Libraries
use Libraries
create table Authors
(
Id int primary key identity,
Name nvarchar(50) not null,
Surname nvarchar(50) not null
)
create table Books
(
Id int primary key identity,
Name nvarchar(100)  not null check(Len(Name)>2 and Len(Name)<100),
PageCount int Check(PageCount>100), 
AuthorId int foreign key references Authors(Id)
)

select Book.Name, Book.PageCount,Author.Id,Author.Name,Author.Surname from Books as Book
inner join Authors as Author
on
Book.AuthorId=Author.Id

create function view use_getauthorfullname
as
select Book.Name,MAX(Book.PageCount),Author.Name,Author.Surname from Books as Book
inner join Authors as Author
on
Book.AuthorId=Author.Id

select Name,MAX(PageCount) as max_page from Books