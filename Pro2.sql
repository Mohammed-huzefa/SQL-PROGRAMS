USE dbms_lab;
CREATE TABLE employees(empno int, ename varchar(10), job varchar(10),mgr int, sal int);
DESC employees;

ALTER TABLE employees ADD(commission int);

insert into employees values(101,'abhi','manager',1234,10000,70);
INSERT INTO employees VALUES (102,'rohith','analyst',2345,9000,65);
INSERT INTO employees VALUES (103,'david','analyst',3456,9000,65);
INSERT INTO employees VALUES (104,'john','hr',6485,9000,65);
INSERT INTO employees VALUES (105,'harsh','scientist',4578,9000,65);

select * from employees;

alter table employees add PRIMARY KEY (empno);

UPDATE employees SET job = 'trainee' WHERE empno = 103;

alter table employees rename column mgr to manager_no;

delete from employees where empno=101;

truncate table employees;