create database if not exists employee;

use employee;

CREATE TABLE if not exists temp_employee (
empno int,
birthdate string,
firstname string,
lastname string,
gender String,
hiredate string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ",";

load data local inpath '/work/shared/hive/data/employees_data.csv' overwrite into table employee.temp_employee;

CREATE external TABLE if not exists employee (
empno int,
birthdate date,
firstname varchar(64),
lastname varchar(64),
hiredate date
)
partitioned by (gender char(1))
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\001'
LOCATION '/data/employee/employee';
