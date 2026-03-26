create database company;
use company;

create table Customers (
id int,
name varchar(10),
age int,
salary int,
address varchar(50)
);

insert into Customers values(10,'abhi',25,10000,'Bangalore');
insert into Customers values(20,'rohith',30,9000,'Delhi');
insert into Customers values(30,'david',28,9000,'Pune');

delimiter //

create trigger sal_diff_update
before update on Customers
for each row
begin
    declare sal_diff int;
    set sal_diff = new.salary - old.salary;

    select 'Previous salary: ', old.salary;
    select 'Current salary: ', new.salary;
    select 'Salary difference: ', sal_diff;
end //

delimiter ;

update Customers set salary = 12000 where id = 10;

select * from Customers;