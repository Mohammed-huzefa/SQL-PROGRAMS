USE e4;

CREATE TABLE customers(
    id INT,
    name VARCHAR(10),
    age INT,
    salary INT,
    address VARCHAR(50)
);

INSERT INTO customers VALUES(10,'prem',25,10000,'shivamoga');
INSERT INTO customers VALUES(20,'sagar',33,30000,'hassan');
INSERT INTO customers VALUES(30,'jeevan',45,45000,'chikkamangaluru');

CREATE TABLE sal_log(
    msg VARCHAR(255)
);

CREATE TRIGGER sal_diff_insert
BEFORE INSERT ON customers
FOR EACH ROW
INSERT INTO sal_log(msg)
VALUES(
CONCAT(
'Previous salary:0|Current salary:',
IFNULL(NEW.salary,0),
'|Salary difference:',
IFNULL(NEW.salary,0)
)
);

CREATE TRIGGER sal_diff_update
BEFORE UPDATE ON customers
FOR EACH ROW
INSERT INTO sal_log(msg)
VALUES(
CONCAT(
'Previous salary:',
IFNULL(OLD.salary,0),
'|Current salary:',
IFNULL(NEW.salary,0),
'|Salary difference:',
IFNULL(NEW.salary,0) - IFNULL(OLD.salary,0)
)
);

CREATE TRIGGER sal_diff_delete
BEFORE DELETE ON customers
FOR EACH ROW
INSERT INTO sal_log(msg)
VALUES(
CONCAT(
'Deleted salary:',
IFNULL(OLD.salary,0)
)
);

INSERT INTO customers VALUES(105,'rahul',29,70000,'ibm');

UPDATE customers SET salary=80000 WHERE id=10;

DELETE FROM customers WHERE id=20;

SELECT * FROM sal_log;