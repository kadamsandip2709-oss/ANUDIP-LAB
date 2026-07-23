mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
6 rows in set (0.01 sec)

mysql> create database ecommerce;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ecommerce          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> use ecommerce;
Database changed
mysql> create table customer(cust_id VARCHAR(10) primary key, name VARCHAR(30) not null, city VARCHAR(20) not null, pincode INT(6) NOT NULL);
Query OK, 0 rows affected, 1 warning (0.03 sec)

mysql> desc customer;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| cust_id | varchar(10) | NO   | PRI | NULL    |       |
| name    | varchar(30) | NO   |     | NULL    |       |
| city    | varchar(20) | NO   |     | NULL    |       |
| pincode | int         | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select * from customer;
Empty set (0.00 sec)

mysql> insert into customer (cust_id, name, city, pincode) values("C101", "nikhil", "thane", 400607);
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
+---------+--------+-------+---------+
| cust_id | name   | city  | pincode |
+---------+--------+-------+---------+
| C101    | nikhil | thane |  400607 |
+---------+--------+-------+---------+
1 row in set (0.00 sec)

mysql> insert into customer values ("C102", "Furkan", "mumbra", 403256);
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
+---------+--------+--------+---------+
| cust_id | name   | city   | pincode |
+---------+--------+--------+---------+
| C101    | nikhil | thane  |  400607 |
| C102    | Furkan | mumbra |  403256 |
+---------+--------+--------+---------+
2 rows in set (0.00 sec)

mysql> insert into customer values ("C103", "Ram", "mumbrai", 403256),("C104", "shubham", "Mumbai", 458967);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+---------+---------+---------+---------+
| cust_id | name    | city    | pincode |
+---------+---------+---------+---------+
| C101    | nikhil  | thane   |  400607 |
| C102    | Furkan  | mumbra  |  403256 |
| C103    | Ram     | mumbrai |  403256 |
| C104    | shubham | Mumbai  |  458967 |
+---------+---------+---------+---------+
4 rows in set (0.00 sec)

mysql> select name from customer;
+---------+
| name    |
+---------+
| nikhil  |
| Furkan  |
| Ram     |
| shubham |
+---------+
4 rows in set (0.00 sec)
