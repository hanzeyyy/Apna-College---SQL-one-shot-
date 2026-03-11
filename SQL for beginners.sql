-- create database
create database apna_college;

create database temp;

drop database temp;

use apna_college;

-- create table
create table student
(
	id int primary key,
    name varchar(20),
    age int not null
);

-- insert values inside a table
insert into student values (1, "Aman", 25);
insert into student values (2, "Shraddha", 24);

-- viewing table
select * from student;

-- database related query
-- if not exists 
create database if not exists student;

drop database if exists student;

show databases;
show tables;

-- table related query
-- 1. create
create table student1
(
	roll_no int primary key,
    name varchar(20)
);

-- 2. select and view All command
select * from student1;

-- 3.insert
insert into student1 (roll_no, name) values (101, "karan"), (102, "arjun");
insert into student1 values (103, "ram");

select * from student1;

-- practice question
create database XYZ;
use XYZ;

create table employee
(
	id int primary key,
    name varchar(20),
    salary int
);

insert into employee values (1, "adam", 25000);
insert into employee values (2, "bob", 30000);
insert into employee values (3, "casey", 40000);

select * from employee;

-- keys
-- 1. primary key
-- it is a column (or set of columns) in a table that uniquley identifies each row. (unique row id)
-- there is only 1 PK and it should be NOT null.
-- PK can be a combination of 2 or more columns

-- 2. foreign key
-- it is a column (or set of columns) in a table that refers to the primary key in other table.
-- there can be multiple FKs.
-- FKs can have duplicate and null values.

-- constraints
-- 1. not null -> columns cannot have a null value
-- 2. unique -> all values in a column are different.
-- 3. primary key -> makes a column unqiue and not null but only used for one column
-- 4. foreign key -> prevent actions that would destroy links between tables
-- 5. default -> sets the default value of a column
-- 6. check() -> it can limit values allowed in a column

create table temp1
(
	id int not null,
    primary key (id)
);

create table temp2
(
	customer_id int,
    foreign key (customer_id) references temp1(id)
);

create table temp3
(
	id int,
    salary int default 25000
);

insert into temp3 (id) values (101);
select * from temp3;

create table temp4
(
	id int primary key,
    city varchar(10),
    age int,
    constraint age_check check (age >= 18 and city = "Delhi")
);

create database college;
use college;

create table students
(
	roll_no int primary key,
    name varchar(25),
    marks int not null,
    grade varchar(1),
    city varchar(20)
);

insert into students values (101, "anil", 78, "C", "Pune");
insert into students values (102, "bhumika", 93, "A", "Mumbai");
insert into students values (103, "chetan", 85, "B", "Mumbai");
insert into students values (104, "dhruv", 96, "A", "Delhi");
insert into students values (105, "emanuel", 12, "F", "Delhi");
insert into students values (106, "farah", 82, "B", "Delhi");

select * from students;

select name, marks from students;

-- distinct -> unique (np duplicates)
select distinct city from students;

-- where clause -> to define some conditions
select * from students
where marks >= 75;

select * from students
where city = "Mumbai";

-- operators
-- 1. arithmetic operators -> +,-,*,/,%
-- 2. comparison operator -> >,<,+,!=,>=,<=
-- 3. logical operators -> and, or, in, between, not, all, like, any
-- 4. bitwise -> & (bitwise and), | (bitwise or)

-- and -> to check for both conditions to be true
select * from students
where marks >= 70 and city = "Mumbai";

-- or -> to check for only one conditions to be true
select * from students
where marks >= 70 or city = "Mumbai";

-- between -> selects for a given range
select * from students
where marks between 80 and 90;

-- in -> matches any value in the list 
select * from students
where city in  ("Mumbai", "Delhi");

-- not -> to negate the given condition
select * from students
where city not in  ("Mumbai", "Delhi");

-- limit clause -> sets an upper limit of rows to be returned
select * from students
limit 3;

-- order by clause -> to sort in ascending (asc) or descending (desc) order
select * from students
order by city;

-- aggregate functions
-- 1. count()
-- 2. max()
-- 3. min()
-- 4. sum()
-- 5. avg()

select count(*) as no_of_rows,
max(marks) as max_marks,
min(marks) as min_marks,
sum(marks) as sum_of_marks,
avg(marks) as avg_marks
from students;

-- group by -> groups rows that have the same values in the summary rows.
-- it collects data from multiple records and groups the result by one or more columns.
select city,
count(name) as no_of_students
from students
group by city;

-- write a query to print average marks in each city in ascending order
select city,
avg(marks) as avg_marks
from students
group by city
order by avg_marks;

CREATE TABLE payment (
    customer_id INT PRIMARY KEY,
    customer VARCHAR(25),
    mode VARCHAR(20),
    city VARCHAR(20)
);

INSERT INTO payment VALUES
(101, 'Olivia Barrett', 'Netbanking', 'Portland'),
(102, 'Ethan Sinclair', 'Credit Card', 'Miami'),
(103, 'Maya Hernandez', 'Credit Card', 'Seattle'),
(104, 'Liam Donovan', 'Netbanking', 'Denver'),
(105, 'Sophia Nguyen', 'Credit Card', 'New Orleans'),
(106, 'Caleb Foster', 'Debit Card', 'Minneapolis'),
(107, 'Ava Patel', 'Debit Card', 'Phoenix'),
(108, 'Lucas Carter', 'Netbanking', 'Boston'),
(109, 'Isabella Martinez', 'Netbanking', 'Nashville'),
(110, 'Jackson Brooks', 'Credit Card', 'Boston');

select * from payment;

-- write a query to print total payments according to each payment
select mode,
count(mode) as total_payment
from payment
group by mode;

select * from students;
-- write a query to count students depending on grade
select grade,
count(*) as no_of_students
from students
group by grade
order by grade;

-- having clause -> used when we want to apply any condition after grouping
select * from students;
-- write a query to count of students in each city where max marks cross 90
select city,
count(name) as no_of_students
from students
group by city
having max(marks) > 90;

-- general order: select > from > where > group by > having > order by > limit

-- table related queries
select * from students;
-- 1. update -> to update existing rows
-- by default, mysql runs on safe mode to avoid any permanent change in data. we can disabe this by following command
set sql_safe_updates = 0;
update students
set grade = "O"
where grade = "A";

select * from students;

update students
set marks = 88, grade = "B"
where roll_no = 105;

select * from students;

-- 2. delete -> to delete existng rows
delete from students
where marks < 80;

select * from students;

-- foreign keys
CREATE TABLE dept 
(
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE teacher 
(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    on update cascade
    on delete cascade
);

-- database -> reverse engineering 

-- cascading FK -> change in one table leads to change in second table
-- 1. on upadate cascade and 2. on delete cascade
 
INSERT INTO dept VALUES (101, "english"), (102, "IT");
select * from dept;

INSERT INTO teacher VALUES (101, "Adam", 101), (102, "Eve", 102);
SELECT * FROM teacher;

update dept
set id = 103
where id = 102;

SELECT * FROM dept;
SELECT * FROM teacher;

-- 3. alter -> to change the schema
-- 3.1 add column
-- 3.2 drop column
-- 3.3 rename table
-- 3.4 change column
-- 3.5 modify column
-- 3.6 truncate

alter table students
add column age int not null default 25;
select * from students;

alter table students
drop column age;
select * from students;

alter table students
modify column age varchar(2);
select * from students;

alter table students
change age student_age int;
select * from students;

alter table students
rename to stu;
select * from stu;

alter table stu
rename to students;
select * from students;

truncate table students;
select * from students;

insert into students values (101, "anil", 78"Pune");
insert into students values (102, "bhumika", 93, "A", "Mumbai");
insert into students values (103, "chetan", 85, "B", "Mumbai");
insert into students values (104, "dhruv", 96, "A", "Delhi");
insert into students values (105, "emanuel", 12, "F", "Delhi");
insert into students values (106, "farah", 82, "B", "Delhi");

select * from students;

-- practice question
-- change the name of column "name" to "full_name"
alter table students
change name full_name varchar(50);
select * from students;

-- delete all students who scored less than 80
delete from students 
where marks < 80;
select * from students;

-- delete all columns for grades
alter table students
drop column grade;
select * from students;

-- joins -> joins is used to combine rows from two or more tables. based on related columns between them 
-- 1. inner join
-- 2. left join
-- 3. right join 
-- 4. full outer join

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);
INSERT INTO student VALUES
(101, 'adam'),
(102, 'bob'),
(103, 'casey');


CREATE TABLE courses (
    student_id INT,
    course VARCHAR(50)
);
INSERT INTO courses VALUES
(102, 'english'),
(105, 'math'),
(103, 'science'),
(107, 'computer science');

select * from student;
select * from courses;
-- 1. inner join -> returns records that have matching values in both tables
select * from student s
inner join courses c on s.student_id = c.student_id;

-- 2. left join -> returns records from the left table, and the matched records from the right table
select * from student s
left join courses c on s.student_id = c.student_id;
 
-- 3. right join -> returns records from the right table, and the matched records from the left table
select * from student s
right join courses c on s.student_id = c.student_id;

-- 4. full outer join -> returns all records when there is a match in either left or right table
select * from student s
left join courses c on s.student_id = c.student_id
union
select * from student s
right join courses c on s.student_id = c.student_id;

-- left exclusive join
select * from student s
left join courses c on s.student_id = c.student_id
where c.student_id is null;

-- right exclusive join
select * from student s
right join courses c on s.student_id = c.student_id
where s.student_id is null;

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);
INSERT INTO employee VALUES
(101, 'adam', 103),
(102, 'bob', 104),
(103, 'casey', NULL),
(104, 'donald', 103);

SELECT * FROM employee;
-- self join -> it is a regular join but the table is joined to itself
select e1.id as emp_id, e1.name as emp_name, 
e2.id as manager_id,
e2.name as manager_name
from employee e1
join employee e2 
on e1.manager_id = e2.id;

-- union -> combine the result - set of two or more select statements. it gives unique records
select name from employee
union
select name from employee;

-- union all -> combine the result - set of two or more select statements. it gives us duplicate records as well.
select name from employee
union all
select name from employee;

-- sub query / inner query / nested query -> query within another query
select * from students;
-- write a query to get names of all the students who score more than class avg
select name, marks
from students
where marks > (select avg(marks) as avg_marks
			  from students);
              
-- write a query to find names of students with even number
select name, roll_no
from students
where roll_no in (select roll_no 
			      from students
                  where roll_no%2 = 0);

-- write a query to find the max marks from the students of Delhi
select max(marks) as max_marks
from students
where city = "Delhi";

-- using sub query in from 
select max(marks) as max_marks
from (select * from students
	  where city = "Delhi") as delhi_city;

-- using sub query in select statement
select (select max(marks) from students) as max_marks, 
name from students;

-- views -> virtual table based on the result-set of an sql statement
create view view1 as
	select roll_no, name, marks from students;

select * from view1;
