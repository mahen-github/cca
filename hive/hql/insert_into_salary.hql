use employee;

set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

insert overwrite table salary
select emp_no, salary, regexp_replace(from_date, "'", ""), regexp_replace(to_date, "'","") from employee.temp_salary;
