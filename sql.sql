CREATE DATABASE college;
SHOW TABLES;
USE college;

CREATE TABLE student (
  rollno INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE DATABASE company_xyz;
USE company_xyz;

CREATE TABLE employee (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  salary INT
);

INSERT INTO employee
(id, name, salary)
VALUES
(1, "ADAM", 25000),
(2,"BOB", 19000),
(3, "LAURA", 26000);

SELECT * FROM employee;

CREATE TABLE empT (
  id INT,
  salary INT DEFAULT 25000
);

INSERT INTO empT (id) VALUES (101);
SELECT * FROM empT;



