Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

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
12 rows in set (0.16 sec)

mysql> use studentdb;
Database changed
mysql> show tables;
+---------------------+
| Tables_in_studentdb |
+---------------------+
| students            |
+---------------------+
1 row in set (0.08 sec)

mysql> select * from students;
+----+-------+------+--------+---------+
| id | name  | age  | course | city    |
+----+-------+------+--------+---------+
|  1 | Rahul |   21 | BSc IT | Mumbai  |
|  2 | Priya |   20 | BCA    | Pune    |
|  3 | Amit  |   22 | BSc CS | Nashik  |
|  4 | Sneha |   21 | BCom   | Thane   |
|  5 | Rohan |   23 | BSc IT | Solapur |
+----+-------+------+--------+---------+
5 rows in set (0.07 sec)

mysql> create table student(stud_id varchar(20) primary key,first_name varchar(20) not null,last_name varchar(20),DOB date not null);
Query OK, 0 rows affected (0.07 sec)

mysql> desc student;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| stud_id    | varchar(20) | NO   | PRI | NULL    |       |
| first_name | varchar(20) | NO   |     | NULL    |       |
| last_name  | varchar(20) | YES  |     | NULL    |       |
| DOB        | date        | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.02 sec)

mysql> insert into student values('S1','Anish','Shinde',2005-07-29),('S2','Shreyash','Mavalkar',2008-04-13);
ERROR 1292 (22007): Incorrect date value: '1969' for column 'DOB' at row 1
mysql> insert into student values('S1','Anish','Shinde','2005-07-29'),('S2','Shreyash','Mavalkar','2008-04-13');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into student values('S3','Tejas','Modke','2006-11-21'),('S4','Sahil','Mavalkar','2004-04-23'),('S5','Sarthak','Modke','2008-10-26');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from student;
+---------+------------+-----------+------------+
| stud_id | first_name | last_name | DOB        |
+---------+------------+-----------+------------+
| S1      | Anish      | Shinde    | 2005-07-29 |
| S2      | Shreyash   | Mavalkar  | 2008-04-13 |
| S3      | Tejas      | Modke     | 2006-11-21 |
| S4      | Sahil      | Mavalkar  | 2004-04-23 |
| S5      | Sarthak    | Modke     | 2008-10-26 |
+---------+------------+-----------+------------+
5 rows in set (0.00 sec)

mysql> create table enrollment(en_id varchar(10) primary key,stud_id varchar(20) not null,course_id varchar(10) not null,en_date date not null,foreign key (stud_id) references student(stud_id));
Query OK, 0 rows affected (0.09 sec)

mysql> desc enrollment;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| en_id     | varchar(10) | NO   | PRI | NULL    |       |
| stud_id   | varchar(20) | NO   | MUL | NULL    |       |
| course_id | varchar(10) | NO   |     | NULL    |       |
| en_date   | date        | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> insert into enrollment values('E1','S1','IT104','2025-1-29'),('E2','S2','CS204','2025-04-09'),('E3','S3','GEO211','2025-10-12');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into enrollment values('E4','S4','BIO502','2025-5-19'),('E5','S5','CHEM320','2025-12-31');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from enrollment;
+-------+---------+-----------+------------+
| en_id | stud_id | course_id | en_date    |
+-------+---------+-----------+------------+
| E1    | S1      | IT104     | 2025-01-29 |
| E2    | S2      | CS204     | 2025-04-09 |
| E3    | S3      | GEO211    | 2025-10-12 |
| E4    | S4      | BIO502    | 2025-05-19 |
| E5    | S5      | CHEM320   | 2025-12-31 |
+-------+---------+-----------+------------+
5 rows in set (0.00 sec)

mysql> select student.stud_id,student.first_name,student.last_name,enrollment.en_id,enrollment.course_id from student inner join enrollment on student.stud_id = enrollment.stud_id;
+---------+------------+-----------+-------+-----------+
| stud_id | first_name | last_name | en_id | course_id |
+---------+------------+-----------+-------+-----------+
| S1      | Anish      | Shinde    | E1    | IT104     |
| S2      | Shreyash   | Mavalkar  | E2    | CS204     |
| S3      | Tejas      | Modke     | E3    | GEO211    |
| S4      | Sahil      | Mavalkar  | E4    | BIO502    |
| S5      | Sarthak    | Modke     | E5    | CHEM320   |
+---------+------------+-----------+-------+-----------+
5 rows in set (0.00 sec)

mysql> select student.stud_id,student.first_name,student.last_name,enrollment.course_id from student left join enrollment on student.stud_id = enrollment.stud_id;
+---------+------------+-----------+-----------+
| stud_id | first_name | last_name | course_id |
+---------+------------+-----------+-----------+
| S1      | Anish      | Shinde    | IT104     |
| S2      | Shreyash   | Mavalkar  | CS204     |
| S3      | Tejas      | Modke     | GEO211    |
| S4      | Sahil      | Mavalkar  | BIO502    |
| S5      | Sarthak    | Modke     | CHEM320   |
+---------+------------+-----------+-----------+
5 rows in set (0.00 sec)

mysql> select student.stud_id,student.first_name,student.last_name,enrollment.course_id from student right join enrollment on student.stud_id = enrollment.stud_id;
+---------+------------+-----------+-----------+
| stud_id | first_name | last_name | course_id |
+---------+------------+-----------+-----------+
| S1      | Anish      | Shinde    | IT104     |
| S2      | Shreyash   | Mavalkar  | CS204     |
| S3      | Tejas      | Modke     | GEO211    |
| S4      | Sahil      | Mavalkar  | BIO502    |
| S5      | Sarthak    | Modke     | CHEM320   |
+---------+------------+-----------+-----------+
5 rows in set (0.00 sec)

mysql> select student.stud_id, student.first_name, student.last_name, enrollment.course_id, enrollment.en_date from student left join enrollment on student.stud_id=enrollment.stud_id union select student.stud_id,student.first_name, student.last_name, enrollment.course_id, enrollment.en_date from student right join enrollment on student.stud_id=enrollment.stud_id;
+---------+------------+-----------+-----------+------------+
| stud_id | first_name | last_name | course_id | en_date    |
+---------+------------+-----------+-----------+------------+
| S1      | Anish      | Shinde    | IT104     | 2025-01-29 |
| S2      | Shreyash   | Mavalkar  | CS204     | 2025-04-09 |
| S3      | Tejas      | Modke     | GEO211    | 2025-10-12 |
| S4      | Sahil      | Mavalkar  | BIO502    | 2025-05-19 |
| S5      | Sarthak    | Modke     | CHEM320   | 2025-12-31 |
+---------+------------+-----------+-----------+------------+
5 rows in set (0.03 sec)

mysql> select student.stud_id,student.first_name,student.last_name,enrollment.course_id from student cross join enrollment;
+---------+------------+-----------+-----------+
| stud_id | first_name | last_name | course_id |
+---------+------------+-----------+-----------+
| S5      | Sarthak    | Modke     | IT104     |
| S4      | Sahil      | Mavalkar  | IT104     |
| S3      | Tejas      | Modke     | IT104     |
| S2      | Shreyash   | Mavalkar  | IT104     |
| S1      | Anish      | Shinde    | IT104     |
| S5      | Sarthak    | Modke     | CS204     |
| S4      | Sahil      | Mavalkar  | CS204     |
| S3      | Tejas      | Modke     | CS204     |
| S2      | Shreyash   | Mavalkar  | CS204     |
| S1      | Anish      | Shinde    | CS204     |
| S5      | Sarthak    | Modke     | GEO211    |
| S4      | Sahil      | Mavalkar  | GEO211    |
| S3      | Tejas      | Modke     | GEO211    |
| S2      | Shreyash   | Mavalkar  | GEO211    |
| S1      | Anish      | Shinde    | GEO211    |
| S5      | Sarthak    | Modke     | BIO502    |
| S4      | Sahil      | Mavalkar  | BIO502    |
| S3      | Tejas      | Modke     | BIO502    |
| S2      | Shreyash   | Mavalkar  | BIO502    |
| S1      | Anish      | Shinde    | BIO502    |
| S5      | Sarthak    | Modke     | CHEM320   |
| S4      | Sahil      | Mavalkar  | CHEM320   |
| S3      | Tejas      | Modke     | CHEM320   |
| S2      | Shreyash   | Mavalkar  | CHEM320   |
| S1      | Anish      | Shinde    | CHEM320   |
+---------+------------+-----------+-----------+
25 rows in set (0.01 sec)

mysql>