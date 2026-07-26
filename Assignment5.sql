mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bankdb             |
| imarticus          |
| information_schema |
| joins              |
| mysql              |
| performance_schema |
| sakila             |
| sandip             |
| student_db         |
| studentdb          |
| sys                |
| world              |
+--------------------+
12 rows in set (0.01 sec)

mysql> use joins;
Database changed
mysql> create table departments(dept_id int(10) primary key,dept_name varchar(30) not null);
Query OK, 0 rows affected, 1 warning (0.06 sec)

mysql> desc departments;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> insert into departments values(1,'HR'),(2,'IT'),(3,'Finance'),(4,'marketing');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from departments;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | Finance   |
|       4 | marketing |
+---------+-----------+
4 rows in set (0.00 sec)

mysql> create table employees(emp_id int(10) primary key,emp_name varchar(20) not null,dept_id int,foreign key (dept_id) references departments(dept_id));
Query OK, 0 rows affected, 1 warning (0.09 sec)

mysql> desc employees;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| emp_id   | int         | NO   | PRI | NULL    |       |
| emp_name | varchar(20) | NO   |     | NULL    |       |
| dept_id  | int         | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into employees values(1,'Sandip',1),(2,'Anish',2),(3,'Rohit',3),(4,'Ganesh',Null),(5,'Arya',5);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`joins`.`employees`, CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`))
mysql> insert into employees values(1,'Sandip',1),(2,'Anish',2),(3,'Rohit',3),(4,'Ganesh',Null),(5,'Arya',5);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`joins`.`employees`, CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`))
mysql> insert into employees values(1,'Sandip',1),(2,'Anish',2),(3,'Rohit',3),(4,'Ganesh',Null),(5,'Arya',4);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from departments;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | Finance   |
|       4 | marketing |
+---------+-----------+
4 rows in set (0.01 sec)

mysql> select * from employees;
+--------+----------+---------+
| emp_id | emp_name | dept_id |
+--------+----------+---------+
|      1 | Sandip   |       1 |
|      2 | Anish    |       2 |
|      3 | Rohit    |       3 |
|      4 | Ganesh   |    NULL |
|      5 | Arya     |       4 |
+--------+----------+---------+
5 rows in set (0.00 sec)

mysql> select emp_name,dept_id from employees inner join departments on employees.dept_id = departments.dept_id;
ERROR 1052 (23000): Column 'dept_id' in field list is ambiguous
mysql> select emp_name,dept_name from employees inner join departments on employees.dept_id = departments.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Sandip   | HR        |
| Anish    | IT        |
| Rohit    | Finance   |
| Arya     | marketing |
+----------+-----------+
4 rows in set (0.00 sec)

mysql> select emp_name,dept_name from employees left join departments on employess.dept_id = departments.dept_id;
ERROR 1054 (42S22): Unknown column 'employess.dept_id' in 'on clause'
mysql> select emp_name,dept_name from employees left join departments on employees.dept_id = departments.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Sandip   | HR        |
| Anish    | IT        |
| Rohit    | Finance   |
| Ganesh   | NULL      |
| Arya     | marketing |
+----------+-----------+
5 rows in set (0.00 sec)

mysql> select emp_name,dept_name from employees right join departments on employees.dept_id = departments.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Sandip   | HR        |
| Anish    | IT        |
| Rohit    | Finance   |
| Arya     | marketing |
+----------+-----------+
4 rows in set (0.00 sec)

mysql> select emp_name,dept_name from employees full join departments;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Sandip   | marketing |
| Sandip   | Finance   |
| Sandip   | IT        |
| Sandip   | HR        |
| Anish    | marketing |
| Anish    | Finance   |
| Anish    | IT        |
| Anish    | HR        |
| Rohit    | marketing |
| Rohit    | Finance   |
| Rohit    | IT        |
| Rohit    | HR        |
| Ganesh   | marketing |
| Ganesh   | Finance   |
| Ganesh   | IT        |
| Ganesh   | HR        |
| Arya     | marketing |
| Arya     | Finance   |
| Arya     | IT        |
| Arya     | HR        |
+----------+-----------+
20 rows in set, 1 warning (0.01 sec)

mysql> select emp_name,dept_name from employees cross join departments;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Sandip   | marketing |
| Sandip   | Finance   |
| Sandip   | IT        |
| Sandip   | HR        |
| Anish    | marketing |
| Anish    | Finance   |
| Anish    | IT        |
| Anish    | HR        |
| Rohit    | marketing |
| Rohit    | Finance   |
| Rohit    | IT        |
| Rohit    | HR        |
| Ganesh   | marketing |
| Ganesh   | Finance   |
| Ganesh   | IT        |
| Ganesh   | HR        |
| Arya     | marketing |
| Arya     | Finance   |
| Arya     | IT        |
| Arya     | HR        |
+----------+-----------+
20 rows in set (0.00 sec)

mysql>