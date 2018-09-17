#!/bin/bash

su - hdfs -c "hadoop fs -mkdir -p /data/employee/"
su - hdfs -c "hadoop fs -chmod -R 777 /data/"

echo `pwd`
cd /work/shared/hive/hql

hqls=(
employee.hql  insert_into_employee.hql  salary.hql insert_into_salary.hql
)
for file in ${hqls[@]}; do
   su - hdfs -c "hive -f /work/shared/hive/hql/$file"
done
 
