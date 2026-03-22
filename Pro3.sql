create database dbms;
use dbms;

CREATE TABLE employee (
    e_id INT,
    e_name VARCHAR(20),
    age INT,
    salary INT
);
desc employee;

INSERT INTO employee VALUES (10,'abhi',25,10000);
INSERT INTO employee VALUES (20,'rohith',30,9000);
INSERT INTO employee VALUES (30,'david',28,9000);

SELECT * FROM employee;

SELECT COUNT(e_name) FROM employee;
SELECT MAX(age) FROM employee;
SELECT MIN(age) FROM employee;

SELECT * FROM employee ORDER BY salary ASC;
SELECT salary FROM employee GROUP BY salary;