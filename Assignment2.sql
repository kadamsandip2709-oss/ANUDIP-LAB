mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ecommerce          |
| imarticus          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| studentdb          |
| sys                |
| world              |
+--------------------+
9 rows in set (0.05 sec)

mysql> use ecommerce;
Database changed
mysql> show tables;
+---------------------+
| Tables_in_ecommerce |
+---------------------+
| customer            |
+---------------------+
1 row in set (0.01 sec)

mysql> select * from customer;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 2  | Sahil     | pune   |  200402 | 18000  |
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
+----+-----------+--------+---------+--------+
6 rows in set (0.01 sec)

mysql> update customer set full_name = 'Om' where id = '2';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customer;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 2  | Om        | pune   |  200402 | 18000  |
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
+----+-----------+--------+---------+--------+
6 rows in set (0.00 sec)

mysql> upadate customer set city= 'Mumbai' where id='4';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'upadate customer set city= 'Mumbai' where id='4'' at line 1
mysql> update customer set city= 'Mumbai' where id='4';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customer;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 2  | Om        | pune   |  200402 | 18000  |
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 4  | Shreyash  | Mumbai |  500320 | 22000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
+----+-----------+--------+---------+--------+
6 rows in set (0.00 sec)

mysql> update customer set salary = 25000 where name ='sandip';
ERROR 1054 (42S22): Unknown column 'name' in 'where clause'
mysql> update customer set salary = 25000 where full_name ='sandip';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customer;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 2  | Om        | pune   |  200402 | 18000  |
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 4  | Shreyash  | Mumbai |  500320 | 22000  |
| 5  | Sandip    | Thane  |  400605 | 25000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
+----+-----------+--------+---------+--------+
6 rows in set (0.00 sec)

mysql> desc customer;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id        | varchar(20) | NO   | PRI | NULL    |       |
| full_name | varchar(20) | NO   |     | NULL    |       |
| city      | varchar(20) | NO   |     | NULL    |       |
| pincode   | int         | NO   |     | NULL    |       |
| salary    | varchar(10) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.02 sec)

mysql> insert into customer values('7','Rutika','Navi Mumbai','400708',30000);
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
+----+-----------+-------------+---------+--------+
| id | full_name | city        | pincode | salary |
+----+-----------+-------------+---------+--------+
| 1  | shubham   | Satara      |  400708 | 15000  |
| 2  | Om        | pune        |  200402 | 18000  |
| 3  | Sarthak   | Delhi       |  300208 | 25000  |
| 4  | Shreyash  | Mumbai      |  500320 | 22000  |
| 5  | Sandip    | Thane       |  400605 | 25000  |
| 6  | Rohit     | Thane       |  400605 | 18000  |
| 7  | Rutika    | Navi Mumbai |  400708 | 30000  |
+----+-----------+-------------+---------+--------+
7 rows in set (0.00 sec)

mysql> delete from customer where id= '5';
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
+----+-----------+-------------+---------+--------+
| id | full_name | city        | pincode | salary |
+----+-----------+-------------+---------+--------+
| 1  | shubham   | Satara      |  400708 | 15000  |
| 2  | Om        | pune        |  200402 | 18000  |
| 3  | Sarthak   | Delhi       |  300208 | 25000  |
| 4  | Shreyash  | Mumbai      |  500320 | 22000  |
| 6  | Rohit     | Thane       |  400605 | 18000  |
| 7  | Rutika    | Navi Mumbai |  400708 | 30000  |
+----+-----------+-------------+---------+--------+
6 rows in set (0.00 sec)

mysql> delete from customer where salary = '15000';
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
+----+-----------+-------------+---------+--------+
| id | full_name | city        | pincode | salary |
+----+-----------+-------------+---------+--------+
| 2  | Om        | pune        |  200402 | 18000  |
| 3  | Sarthak   | Delhi       |  300208 | 25000  |
| 4  | Shreyash  | Mumbai      |  500320 | 22000  |
| 6  | Rohit     | Thane       |  400605 | 18000  |
| 7  | Rutika    | Navi Mumbai |  400708 | 30000  |
+----+-----------+-------------+---------+--------+
5 rows in set (0.00 sec)

mysql> delete from customer;
Query OK, 5 rows affected (0.01 sec)

mysql> select * from customer;
Empty set (0.00 sec)

mysql> desc customer;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id        | varchar(20) | NO   | PRI | NULL    |       |
| full_name | varchar(20) | NO   |     | NULL    |       |
| city      | varchar(20) | NO   |     | NULL    |       |
| pincode   | int         | NO   |     | NULL    |       |
| salary    | varchar(10) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> insert into customer values('1','Sandip','Navi Mumbai','400708',30000);
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
+----+-----------+-------------+---------+--------+
| id | full_name | city        | pincode | salary |
+----+-----------+-------------+---------+--------+
| 1  | Sandip    | Navi Mumbai |  400708 | 30000  |
+----+-----------+-------------+---------+--------+
1 row in set (0.00 sec)

mysql> insert into customer values('2','Shreyash','Mumbai','400895',35000),('3','Sahil','Nagar',300504);
ERROR 1136 (21S01): Column count doesn't match value count at row 2
mysql> insert into customer values('2','Shreyash','Mumbai','400895',35000),('3','Sahil','Nagar','300504',20000);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+----+-----------+-------------+---------+--------+
| id | full_name | city        | pincode | salary |
+----+-----------+-------------+---------+--------+
| 1  | Sandip    | Navi Mumbai |  400708 | 30000  |
| 2  | Shreyash  | Mumbai      |  400895 | 35000  |
| 3  | Sahil     | Nagar       |  300504 | 20000  |
+----+-----------+-------------+---------+--------+
3 rows in set (0.00 sec)

mysql> insert into customer values('4','Anish','Satara','204000',35000),('5','Shubham','Pune','200504',15000);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+----+-----------+-------------+---------+--------+
| id | full_name | city        | pincode | salary |
+----+-----------+-------------+---------+--------+
| 1  | Sandip    | Navi Mumbai |  400708 | 30000  |
| 2  | Shreyash  | Mumbai      |  400895 | 35000  |
| 3  | Sahil     | Nagar       |  300504 | 20000  |
| 4  | Anish     | Satara      |  204000 | 35000  |
| 5  | Shubham   | Pune        |  200504 | 15000  |
+----+-----------+-------------+---------+--------+
5 rows in set (0.00 sec)

mysql> truncate table customer;
Query OK, 0 rows affected (0.09 sec)

mysql> select * from customer;
Empty set (0.01 sec)

mysql> desc customer;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id        | varchar(20) | NO   | PRI | NULL    |       |
| full_name | varchar(20) | NO   |     | NULL    |       |
| city      | varchar(20) | NO   |     | NULL    |       |
| pincode   | int         | NO   |     | NULL    |       |
| salary    | varchar(10) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> insert into customer values('1','Sandip','Navi Mumbai','400708',30000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into customer values('2','Shreyash','Mumbai','400895',35000),('3','Sahil','Nagar',300504);
ERROR 1136 (21S01): Column count doesn't match value count at row 2
mysql> insert into customer values('2','Shreyash','Mumbai','400895',35000),('3','Sahil','Nagar','300504',20000);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+----+-----------+-------------+---------+--------+
| id | full_name | city        | pincode | salary |
+----+-----------+-------------+---------+--------+
| 1  | Sandip    | Navi Mumbai |  400708 | 30000  |
| 2  | Shreyash  | Mumbai      |  400895 | 35000  |
| 3  | Sahil     | Nagar       |  300504 | 20000  |
+----+-----------+-------------+---------+--------+
3 rows in set (0.00 sec)

mysql> drop table customer;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from customer;
ERROR 1146 (42S02): Table 'ecommerce.customer' doesn't exist
mysql> desc customer;
ERROR 1146 (42S02): Table 'ecommerce.customer' doesn't exist
mysql> drop database customer;
ERROR 1008 (HY000): Can't drop database 'customer'; database doesn't exist
mysql> drop database ecommerce;
Query OK, 0 rows affected (0.06 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| imarticus          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| studentdb          |
| sys                |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> create database student_DB;
Query OK, 1 row affected (0.01 sec)

mysql> create table student(roll_no varchar(20) primary key,name varchar(20) not null,age int(3) not null, address varchar(30) not null);
ERROR 1046 (3D000): No database selected
mysql> use student_DB;
Database changed
mysql> create table student(roll_no varchar(20) primary key,name varchar(20) not null,age int(3) not null, address varchar(30) not null);
Query OK, 0 rows affected, 1 warning (0.04 sec)

mysql> desc student;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| roll_no | varchar(20) | NO   | PRI | NULL    |       |
| name    | varchar(20) | NO   |     | NULL    |       |
| age     | int         | NO   |     | NULL    |       |
| address | varchar(30) | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> insert into student values('101','Sandip',21,'Digha Gaon'),('102','Sarthak',18,'Thane');
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * form student;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'form student' at line 1
mysql> select * from student;
+---------+---------+-----+------------+
| roll_no | name    | age | address    |
+---------+---------+-----+------------+
| 101     | Sandip  |  21 | Digha Gaon |
| 102     | Sarthak |  18 | Thane      |
+---------+---------+-----+------------+
2 rows in set (0.00 sec)

mysql> insert into student values('103','Sahil',21,'Dadar'),('104','Anish',20,'Borivali');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from student;
+---------+---------+-----+------------+
| roll_no | name    | age | address    |
+---------+---------+-----+------------+
| 101     | Sandip  |  21 | Digha Gaon |
| 102     | Sarthak |  18 | Thane      |
| 103     | Sahil   |  21 | Dadar      |
| 104     | Anish   |  20 | Borivali   |
+---------+---------+-----+------------+
4 rows in set (0.01 sec)

mysql> select * from student where name like 's%';
+---------+---------+-----+------------+
| roll_no | name    | age | address    |
+---------+---------+-----+------------+
| 101     | Sandip  |  21 | Digha Gaon |
| 102     | Sarthak |  18 | Thane      |
| 103     | Sahil   |  21 | Dadar      |
+---------+---------+-----+------------+
3 rows in set (0.00 sec)

mysql> select * from student where address like 'm%';
Empty set (0.00 sec)

mysql> select * from student where address like 'd%';
+---------+--------+-----+------------+
| roll_no | name   | age | address    |
+---------+--------+-----+------------+
| 101     | Sandip |  21 | Digha Gaon |
| 103     | Sahil  |  21 | Dadar      |
+---------+--------+-----+------------+
2 rows in set (0.00 sec)

mysql> select * from student where address like '%gaon';
+---------+--------+-----+------------+
| roll_no | name   | age | address    |
+---------+--------+-----+------------+
| 101     | Sandip |  21 | Digha Gaon |
+---------+--------+-----+------------+
1 row in set (0.01 sec)

mysql> select * from student where address like '%hil';
Empty set (0.01 sec)

mysql> select * from student where name like '%hil';
+---------+-------+-----+---------+
| roll_no | name  | age | address |
+---------+-------+-----+---------+
| 103     | Sahil |  21 | Dadar   |
+---------+-------+-----+---------+
1 row in set (0.00 sec)

mysql> select * from student where name like '%i%';
+---------+--------+-----+------------+
| roll_no | name   | age | address    |
+---------+--------+-----+------------+
| 101     | Sandip |  21 | Digha Gaon |
| 103     | Sahil  |  21 | Dadar      |
| 104     | Anish  |  20 | Borivali   |
+---------+--------+-----+------------+
3 rows in set (0.00 sec)

mysql> select * from student;
+---------+---------+-----+------------+
| roll_no | name    | age | address    |
+---------+---------+-----+------------+
| 101     | Sandip  |  21 | Digha Gaon |
| 102     | Sarthak |  18 | Thane      |
| 103     | Sahil   |  21 | Dadar      |
| 104     | Anish   |  20 | Borivali   |
+---------+---------+-----+------------+
4 rows in set (0.00 sec)

mysql> select * from student where name like 's______';
+---------+---------+-----+---------+
| roll_no | name    | age | address |
+---------+---------+-----+---------+
| 102     | Sarthak |  18 | Thane   |
+---------+---------+-----+---------+
1 row in set (0.00 sec)

mysql> select * from student where name like 'a____';
+---------+-------+-----+----------+
| roll_no | name  | age | address  |
+---------+-------+-----+----------+
| 104     | Anish |  20 | Borivali |
+---------+-------+-----+----------+
1 row in set (0.00 sec)

mysql> select * from student where address like 'D____';
+---------+-------+-----+---------+
| roll_no | name  | age | address |
+---------+-------+-----+---------+
| 103     | Sahil |  21 | Dadar   |
+---------+-------+-----+---------+
1 row in set (0.00 sec)

mysql> select * from student where name like '%a____';
+---------+--------+-----+------------+
| roll_no | name   | age | address    |
+---------+--------+-----+------------+
| 101     | Sandip |  21 | Digha Gaon |
| 104     | Anish  |  20 | Borivali   |
+---------+--------+-----+------------+
2 rows in set (0.00 sec)

mysql>