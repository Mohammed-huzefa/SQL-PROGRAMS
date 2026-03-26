Create Table: 
> create table Customers (id number, name varchar(10), age number, sal number, address varchar(50));

Insert records :
>insert into Customers values(10,'abhi',25 ,10000,”Bangalore”); 
>insert into Customers values(20,'rohith',30,9000, ”Delhi”); 
>insert into Customers values(30,'david',28,9000, ”Pune”);

Creating trigger:
>set serveroutput on; 
1 create or replace TRIGGER sal_diff 
2 Before Delete or INSERT OR UPDATE on Customer 
3 for each row 
4 when(new.id>0) 
5 Declare 
6 	sal_diff number; 
7 BEGIN 
8 	sal_diff := :NEW.sal - :OLD.sal; 
9	 dbms_output.put_line('Previous salary: ' || : OLD.sal); 
10 	 dbms_output.put_line('Current salary ' || : NEW.sal); 
11	 dbms_output.put_line ('salary difference: ' || sal_diff); 
12 END; 
13 / 
