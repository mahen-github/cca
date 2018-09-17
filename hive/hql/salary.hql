create database if not exists employee;

use employee;

CREATE TABLE if not exists temp_salary(
emp_no int,
salary int,
from_date string,
to_date string
) 
COMMENT 'SALARY'
ROW format delimited
fields terminated by ','
stored as textfile;

load data local inpath '/work/shared/hive/data/salaries.csv' overwrite into table employee.temp_salary;

CREATE external TABLE if not exists salary(
empno int,
salary int,
fromdate date,
todate date
) 
COMMENT 'salary'
ROW format delimited
fields terminated by '\001'
stored as textfile
location '/data/employee/salary';

