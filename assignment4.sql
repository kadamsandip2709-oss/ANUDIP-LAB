Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database sandip;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bankdb             |
| imarticus          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sandip             |
| student_db         |
| studentdb          |
| sys                |
| world              |
+--------------------+
11 rows in set (0.01 sec)

mysql> use sandip;
Database changed
mysql> show tables;
Empty set (0.01 sec)

mysql> create table employee(id varchar(10) primary key,deptname varchar(20) not null,salary int(10) not null);
Query OK, 0 rows affected, 1 warning (0.04 sec)

mysql> desc employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | varchar(10) | NO   | PRI | NULL    |       |
| deptname | varchar(20) | NO   |     | NULL    |       |
| salary   | int         | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into employee values('E101','HR',20000),('E102','HR',40000),('E103','IT',20000),('E104','IT',35000);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+------+----------+--------+
| id   | deptname | salary |
+------+----------+--------+
| E101 | HR       |  20000 |
| E102 | HR       |  40000 |
| E103 | IT       |  20000 |
| E104 | IT       |  35000 |
+------+----------+--------+
4 rows in set (0.00 sec)

mysql> select deptname,avg(salary) as avgsalary from employee by deptname;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'by deptname' at line 1
mysql> select deptname,avg(salary) as avgsalary from employee group by deptname;
+----------+------------+
| deptname | avgsalary  |
+----------+------------+
| HR       | 30000.0000 |
| IT       | 27500.0000 |
+----------+------------+
2 rows in set (0.00 sec)

mysql> select deptname,count(*) as totalemployee from employee group by deptname;
+----------+---------------+
| deptname | totalemployee |
+----------+---------------+
| HR       |             2 |
| IT       |             2 |
+----------+---------------+
2 rows in set (0.00 sec)

mysql> select deptname,sum(salary) as Totalsalary from employee group by deptname;
+----------+-------------+
| deptname | Totalsalary |
+----------+-------------+
| HR       |       60000 |
| IT       |       55000 |
+----------+-------------+
2 rows in set (0.00 sec)

mysql> select deptname,max(salary) as Highest salary from employee group by deptname;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'salary from employee group by deptname' at line 1
mysql> select deptname,max(salary) as Highestsalary from employee group by deptname;
+----------+---------------+
| deptname | Highestsalary |
+----------+---------------+
| HR       |         40000 |
| IT       |         35000 |
+----------+---------------+
2 rows in set (0.01 sec)

mysql> select deptname,avg(salary) as avragesalary from employee group by deptname;
+----------+--------------+
| deptname | avragesalary |
+----------+--------------+
| HR       |   30000.0000 |
| IT       |   27500.0000 |
+----------+--------------+
2 rows in set (0.00 sec)

mysql> select deptname,avg(salary) as averagesalary from employee group by deptname having avg(salary) > 28000;
+----------+---------------+
| deptname | averagesalary |
+----------+---------------+
| HR       |    30000.0000 |
+----------+---------------+
1 row in set (0.01 sec)

mysql> select deptname,avg(salary) as avgsalary from employee group by deptname having avg(salary) < 40000;
+----------+------------+
| deptname | avgsalary  |
+----------+------------+
| HR       | 30000.0000 |
| IT       | 27500.0000 |
+----------+------------+
2 rows in set (0.00 sec)

mysql> select * from employee;
+------+----------+--------+
| id   | deptname | salary |
+------+----------+--------+
| E101 | HR       |  20000 |
| E102 | HR       |  40000 |
| E103 | IT       |  20000 |
| E104 | IT       |  35000 |
+------+----------+--------+
4 rows in set (0.00 sec)

mysql> insert into employee values('E105','CS',45000);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee;
+------+----------+--------+
| id   | deptname | salary |
+------+----------+--------+
| E101 | HR       |  20000 |
| E102 | HR       |  40000 |
| E103 | IT       |  20000 |
| E104 | IT       |  35000 |
| E105 | CS       |  45000 |
+------+----------+--------+
5 rows in set (0.00 sec)

mysql> select deptname,count(*) as totalemployee from employee group by deptname having count(*)>1;
+----------+---------------+
| deptname | totalemployee |
+----------+---------------+
| HR       |             2 |
| IT       |             2 |
+----------+---------------+
2 rows in set (0.00 sec)

mysql> select deptname,count(*) as totalemployee from employee group by deptname having count(*)>=1;
+----------+---------------+
| deptname | totalemployee |
+----------+---------------+
| HR       |             2 |
| IT       |             2 |
| CS       |             1 |
+----------+---------------+
3 rows in set (0.00 sec)

mysql> select deptname,count(*) as totalemployee from employee group by deptname having count(*)<=1;
+----------+---------------+
| deptname | totalemployee |
+----------+---------------+
| CS       |             1 |
+----------+---------------+
1 row in set (0.00 sec)

mysql> select deptname,avg (salary) as averagesalary from employee group by deptname;
+----------+---------------+
| deptname | averagesalary |
+----------+---------------+
| HR       |    30000.0000 |
| IT       |    27500.0000 |
| CS       |    45000.0000 |
+----------+---------------+
3 rows in set (0.00 sec)

mysql> select deptname avg(salary) as averagesalary from employee group by depname avg(salary)<30000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(salary) as averagesalary from employee group by depname avg(salary)<30000' at line 1
mysql> select deptname avg(salary) as averagesalary from employee group by depname having avg(salary)<30000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(salary) as averagesalary from employee group by depname having avg(salary)<3000' at line 1
mysql> select deptname,avg(salary) as averagesalary from employee group by depname having avg(salary)<30000;
ERROR 1054 (42S22): Unknown column 'depname' in 'group statement'
mysql> select deptname,avg(salary) as averagesalary from employee group by deptname having avg(salary)<30000;
+----------+---------------+
| deptname | averagesalary |
+----------+---------------+
| IT       |    27500.0000 |
+----------+---------------+
1 row in set (0.00 sec)

mysql> select deptname,avg(salary) as averagesalary from employee group by deptname having avg(salary)>28000;
+----------+---------------+
| deptname | averagesalary |
+----------+---------------+
| HR       |    30000.0000 |
| CS       |    45000.0000 |
+----------+---------------+
2 rows in set (0.00 sec)

mysql> select * from employee;
+------+----------+--------+
| id   | deptname | salary |
+------+----------+--------+
| E101 | HR       |  20000 |
| E102 | HR       |  40000 |
| E103 | IT       |  20000 |
| E104 | IT       |  35000 |
| E105 | CS       |  45000 |
+------+----------+--------+
5 rows in set (0.00 sec)

mysql> select deoptname,min(salary) as minimumsalary from employee group by deptname having min(salary)>20000;
ERROR 1054 (42S22): Unknown column 'deoptname' in 'field list'
mysql> select deptname,min(salary) as minimumsalary from employee group by deptname having min(salary)>20000;
+----------+---------------+
| deptname | minimumsalary |
+----------+---------------+
| CS       |         45000 |
+----------+---------------+
1 row in set (0.00 sec)

mysql> select deptname,min(salary) as minsalary from employee group by deptname having min(salary)>30000;
+----------+-----------+
| deptname | minsalary |
+----------+-----------+
| CS       |     45000 |
+----------+-----------+
1 row in set (0.00 sec)

mysql> select deptname,min(salary) as minsalary from employee group by deptname having min(salary)>=20000;
+----------+-----------+
| deptname | minsalary |
+----------+-----------+
| HR       |     20000 |
| IT       |     20000 |
| CS       |     45000 |
+----------+-----------+
3 rows in set (0.00 sec)

mysql> select deptname,max(salary) as highsalary from employee group by deptname having max(salary)<45000;
+----------+------------+
| deptname | highsalary |
+----------+------------+
| HR       |      40000 |
| IT       |      35000 |
+----------+------------+
2 rows in set (0.00 sec)

mysql> select deptname,max(salary) as highsalary from employee group by deptname having max(salary)<=45000;
+----------+------------+
| deptname | highsalary |
+----------+------------+
| HR       |      40000 |
| IT       |      35000 |
| CS       |      45000 |
+----------+------------+
3 rows in set (0.00 sec)

mysql> select * from employee;
+------+----------+--------+
| id   | deptname | salary |
+------+----------+--------+
| E101 | HR       |  20000 |
| E102 | HR       |  40000 |
| E103 | IT       |  20000 |
| E104 | IT       |  35000 |
| E105 | CS       |  45000 |
+------+----------+--------+
5 rows in set (0.00 sec)

mysql> select e.id,e.deptname,e.salary from employee as e;
+------+----------+--------+
| id   | deptname | salary |
+------+----------+--------+
| E101 | HR       |  20000 |
| E102 | HR       |  40000 |
| E103 | IT       |  20000 |
| E104 | IT       |  35000 |
| E105 | CS       |  45000 |
+------+----------+--------+
5 rows in set (0.00 sec)

mysql>