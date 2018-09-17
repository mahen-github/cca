use employee;

set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

insert overwrite table employee
partition (gender)
select empno, regexp_replace(birthdate, "'", ""), regexp_replace(firstname,"'",""),regexp_replace(lastname,"'",""),regexp_replace(hiredate,"'",""), regexp_replace(gender,"'","") as gender from temp_employee;
