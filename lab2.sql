Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| imarticus          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| student_db         |
| studentdb          |
| sys                |
| world              |
+--------------------+
9 rows in set (0.02 sec)

mysql> create database bankdb;
Query OK, 1 row affected (0.02 sec)

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
| student_db         |
| studentdb          |
| sys                |
| world              |
+--------------------+
10 rows in set (0.00 sec)

mysql> use bankdb;
Database changed
mysql> create table BankAccount(account_id int(5) primary key,account_holder_name varchar(30) not null,account_balance int(20) not null);
Query OK, 0 rows affected, 2 warnings (0.07 sec)

mysql> desc BankAccount;
+---------------------+-------------+------+-----+---------+-------+
| Field               | Type        | Null | Key | Default | Extra |
+---------------------+-------------+------+-----+---------+-------+
| account_id          | int         | NO   | PRI | NULL    |       |
| account_holder_name | varchar(30) | NO   |     | NULL    |       |
| account_balance     | int         | NO   |     | NULL    |       |
+---------------------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into BankAccount values(101,'Prashant',45000),(102,'Rohit',30000),(103,'Sandip',20000),(104,'Sahil',60000),(105,'Anish',40000),(106,'Shreyash',10000);
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from BankAccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
|        101 | Prashant            |           45000 |
|        102 | Rohit               |           30000 |
|        103 | Sandip              |           20000 |
|        104 | Sahil               |           60000 |
|        105 | Anish               |           40000 |
|        106 | Shreyash            |           10000 |
+------------+---------------------+-----------------+
6 rows in set (0.00 sec)

mysql> select account_holder_name,account_balance from BankAccount;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| Prashant            |           45000 |
| Rohit               |           30000 |
| Sandip              |           20000 |
| Sahil               |           60000 |
| Anish               |           40000 |
| Shreyash            |           10000 |
+---------------------+-----------------+
6 rows in set (0.00 sec)

mysql> select account_holder_name,account_balance  from BankAccount where account_balance < 30000;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| Sandip              |           20000 |
| Shreyash            |           10000 |
+---------------------+-----------------+
2 rows in set (0.01 sec)

mysql> select * from BankAccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
|        101 | Prashant            |           45000 |
|        102 | Rohit               |           30000 |
|        103 | Sandip              |           20000 |
|        104 | Sahil               |           60000 |
|        105 | Anish               |           40000 |
|        106 | Shreyash            |           10000 |
+------------+---------------------+-----------------+
6 rows in set (0.00 sec)

mysql> update table BankAccount set account_balance = 70000 where account_id = 101;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table BankAccount set account_balance = 70000 where account_id = 101' at line 1
mysql> update BankAccount set account_balance = 70000 where account_id = 101;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from BankAccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
|        101 | Prashant            |           70000 |
|        102 | Rohit               |           30000 |
|        103 | Sandip              |           20000 |
|        104 | Sahil               |           60000 |
|        105 | Anish               |           40000 |
|        106 | Shreyash            |           10000 |
+------------+---------------------+-----------------+
6 rows in set (0.00 sec)

mysql>