 desc customer;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| id      | varchar(20) | NO   | PRI | NULL    |       |
| name    | varchar(30) | NO   |     | NULL    |       |
| city    | varchar(20) | NO   |     | NULL    |       |
| pincode | int         | NO   |     | NULL    |       |
| salary  | varchar(10) | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> alter table customer rename column name to full_name;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc customer;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id        | varchar(20) | NO   | PRI | NULL    |       |
| full_name | varchar(30) | NO   |     | NULL    |       |
| city      | varchar(20) | NO   |     | NULL    |       |
| pincode   | int         | NO   |     | NULL    |       |
| salary    | varchar(10) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> alter table customer modify full_name(20) not null;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(20) not null' at line 1
mysql> alter table customer modify full_name varchar(20) not null;
Query OK, 4 rows affected (0.10 sec)
Records: 4  Duplicates: 0  Warnings: 0

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
5 rows in set (0.01 sec)

mysql> select * from customer;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 |        |
| 2  | Sahil     | pune   |  200402 |        |
| 3  | Sarthak   | Delhi  |  300208 |        |
| 4  | Shreyash  | Gujrat |  500320 |        |
+----+-----------+--------+---------+--------+
4 rows in set (0.06 sec)

mysql> insert into customer values('5','Sandip','Thane',400605,'20000')
    -> insert into customer values('5','Sandip','Thane',400605,'20000');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'insert into customer values('5','Sandip','Thane',400605,'20000')' at line 2
mysql> insert into customer values ('5','Sandip','Thane',400605,'20000');
Query OK, 1 row affected (0.04 sec)

mysql> select * from customer;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 |        |
| 2  | Sahil     | pune   |  200402 |        |
| 3  | Sarthak   | Delhi  |  300208 |        |
| 4  | Shreyash  | Gujrat |  500320 |        |
| 5  | Sandip    | Thane  |  400605 | 20000  |
+----+-----------+--------+---------+--------+
5 rows in set (0.00 sec)

mysql> Alter table customer add salary = 15000 where id=1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '= 15000 where id=1' at line 1
mysql> Alter table customer add salary = 15000 where id='1';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '= 15000 where id='1'' at line 1
mysql> update table customer set salary = 15000 where id = 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table customer set salary = 15000 where id = 1' at line 1
mysql> update customer set salary = 15000 where id = 1;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customer;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 2  | Sahil     | pune   |  200402 |        |
| 3  | Sarthak   | Delhi  |  300208 |        |
| 4  | Shreyash  | Gujrat |  500320 |        |
| 5  | Sandip    | Thane  |  400605 | 20000  |
+----+-----------+--------+---------+--------+
5 rows in set (0.00 sec)

mysql> update customer set salary = 18000 where id = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update customer set salary = 25000 where id = 3;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update customer set salary = 22000 where id = 4;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customer;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 2  | Sahil     | pune   |  200402 | 18000  |
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
+----+-----------+--------+---------+--------+
5 rows in set (0.00 sec)

mysql> insert into customer values ('6','Rohit','Thane',400605,'18000');
Query OK, 1 row affected (0.01 sec)

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
6 rows in set (0.00 sec)

mysql> select distinct city from customer;
+--------+
| city   |
+--------+
| Satara |
| pune   |
| Delhi  |
| Gujrat |
| Thane  |
+--------+
5 rows in set (0.01 sec)

mysql> select * from customer where salary between 20000 and 25000;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
+----+-----------+--------+---------+--------+
3 rows in set (0.01 sec)

mysql> select * from customer where salary between 15000 and 20000;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 2  | Sahil     | pune   |  200402 | 18000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
+----+-----------+--------+---------+--------+
4 rows in set (0.00 sec)

mysql> select * from customer where salary not between 15000 and 20000;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
+----+-----------+--------+---------+--------+
2 rows in set (0.00 sec)

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
6 rows in set (0.00 sec)

mysql> select * from customer where city between 'a' and 'f';
+----+-----------+-------+---------+--------+
| id | full_name | city  | pincode | salary |
+----+-----------+-------+---------+--------+
| 3  | Sarthak   | Delhi |  300208 | 25000  |
+----+-----------+-------+---------+--------+
1 row in set (0.00 sec)

mysql> select * from customer where city not between 'a' and 'f';
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 2  | Sahil     | pune   |  200402 | 18000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
+----+-----------+--------+---------+--------+
5 rows in set (0.00 sec)

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
6 rows in set (0.00 sec)

mysql> select * from customer where id in('1','2');
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 2  | Sahil     | pune   |  200402 | 18000  |
+----+-----------+--------+---------+--------+
2 rows in set (0.01 sec)

mysql> select * from customer where id in('6','3','1');
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
+----+-----------+--------+---------+--------+
3 rows in set (0.00 sec)

mysql> select * from customer where id not in('1','2');
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
+----+-----------+--------+---------+--------+
4 rows in set (0.00 sec)

mysql> select * from customer where id not in('1','2','3','4');
+----+-----------+-------+---------+--------+
| id | full_name | city  | pincode | salary |
+----+-----------+-------+---------+--------+
| 5  | Sandip    | Thane |  400605 | 20000  |
| 6  | Rohit     | Thane |  400605 | 18000  |
+----+-----------+-------+---------+--------+
2 rows in set (0.00 sec)

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
6 rows in set (0.00 sec)

mysql> select * from customer where name is null;
ERROR 1054 (42S22): Unknown column 'name' in 'where clause'
mysql> select * from customer where full_name is null;
Empty set (0.00 sec)

mysql> select * from customer where full_name is not null;
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
6 rows in set (0.00 sec)

mysql> select * from customer order by name;
ERROR 1054 (42S22): Unknown column 'name' in 'order clause'
mysql> select * from customer order by full_name;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 6  | Rohit     | Thane  |  400605 | 18000  |
| 2  | Sahil     | pune   |  200402 | 18000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
| 1  | shubham   | Satara |  400708 | 15000  |
+----+-----------+--------+---------+--------+
6 rows in set (0.01 sec)

mysql> select * from customer order by city;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
| 2  | Sahil     | pune   |  200402 | 18000  |
| 1  | shubham   | Satara |  400708 | 15000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
+----+-----------+--------+---------+--------+
6 rows in set (0.00 sec)

mysql> select * from customer order by pincode;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 2  | Sahil     | pune   |  200402 | 18000  |
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
| 1  | shubham   | Satara |  400708 | 15000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
+----+-----------+--------+---------+--------+
6 rows in set (0.00 sec)

mysql> select * from customer order by salary;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 2  | Sahil     | pune   |  200402 | 18000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
+----+-----------+--------+---------+--------+
6 rows in set (0.00 sec)

mysql> select * from customer order by salary limit 3;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 2  | Sahil     | pune   |  200402 | 18000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
+----+-----------+--------+---------+--------+
3 rows in set (0.00 sec)

mysql> select * from customer order by full_name desc;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 1  | shubham   | Satara |  400708 | 15000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
| 2  | Sahil     | pune   |  200402 | 18000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
+----+-----------+--------+---------+--------+
6 rows in set (0.00 sec)

mysql> select * from customer order by salary desc;
+----+-----------+--------+---------+--------+
| id | full_name | city   | pincode | salary |
+----+-----------+--------+---------+--------+
| 3  | Sarthak   | Delhi  |  300208 | 25000  |
| 4  | Shreyash  | Gujrat |  500320 | 22000  |
| 5  | Sandip    | Thane  |  400605 | 20000  |
| 2  | Sahil     | pune   |  200402 | 18000  |
| 6  | Rohit     | Thane  |  400605 | 18000  |
| 1  | shubham   | Satara |  400708 | 15000  |
+----+-----------+--------+---------+--------+
6 rows in set (0.00 sec)

mysql> select * from customer order by salary desc limit 1;
+----+-----------+-------+---------+--------+
| id | full_name | city  | pincode | salary |
+----+-----------+-------+---------+--------+
| 3  | Sarthak   | Delhi |  300208 | 25000  |
+----+-----------+-------+---------+--------+
1 row in set (0.00 sec)

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
6 rows in set (0.00 sec)

mysql> select * from customer where city='Thane' and salary='18000';
+----+-----------+-------+---------+--------+
| id | full_name | city  | pincode | salary |
+----+-----------+-------+---------+--------+
| 6  | Rohit     | Thane |  400605 | 18000  |
+----+-----------+-------+---------+--------+
1 row in set (0.00 sec)

mysql> select * form customer where salary='18000';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'form customer where salary='18000'' at line 1
mysql> select * from customer where salary='18000';
+----+-----------+-------+---------+--------+
| id | full_name | city  | pincode | salary |
+----+-----------+-------+---------+--------+
| 2  | Sahil     | pune  |  200402 | 18000  |
| 6  | Rohit     | Thane |  400605 | 18000  |
+----+-----------+-------+---------+--------+
2 rows in set (0.00 sec)

mysql> select * from customer where city='Thane' or salary='18000';
+----+-----------+-------+---------+--------+
| id | full_name | city  | pincode | salary |
+----+-----------+-------+---------+--------+
| 2  | Sahil     | pune  |  200402 | 18000  |
| 5  | Sandip    | Thane |  400605 | 20000  |
| 6  | Rohit     | Thane |  400605 | 18000  |
+----+-----------+-------+---------+--------+
3 rows in set (0.00 sec)

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
6 rows in set (0.00 sec)

mysql> select sum(salary) from customer;
+-------------+
| sum(salary) |
+-------------+
|      118000 |
+-------------+
1 row in set (0.01 sec)

mysql> select sum(city) from customer;
+-----------+
| sum(city) |
+-----------+
|         0 |
+-----------+
1 row in set, 6 warnings (0.01 sec)

mysql> select sum(id) from customer;
+---------+
| sum(id) |
+---------+
|      21 |
+---------+
1 row in set (0.00 sec)

mysql> select max(salary) from customer;
+-------------+
| max(salary) |
+-------------+
| 25000       |
+-------------+
1 row in set (0.00 sec)

mysql> select max(id) from customer;
+---------+
| max(id) |
+---------+
| 6       |
+---------+
1 row in set (0.01 sec)

mysql> select max(pincode) from customer;
+--------------+
| max(pincode) |
+--------------+
|       500320 |
+--------------+
1 row in set (0.00 sec)

mysql> select min(salary) from customer;
+-------------+
| min(salary) |
+-------------+
| 15000       |
+-------------+
1 row in set (0.01 sec)

mysql> select min(id) from customer;
+---------+
| min(id) |
+---------+
| 1       |
+---------+
1 row in set (0.00 sec)

mysql> select min(pincode) from customer;
+--------------+
| min(pincode) |
+--------------+
|       200402 |
+--------------+
1 row in set (0.00 sec)

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
6 rows in set (0.00 sec)

mysql> select avg(salary) from customer;
+--------------------+
| avg(salary)        |
+--------------------+
| 19666.666666666668 |
+--------------------+
1 row in set (0.00 sec)

mysql> select avg(id) from customer;
+---------+
| avg(id) |
+---------+
|     3.5 |
+---------+
1 row in set (0.00 sec)

mysql>