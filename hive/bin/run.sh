#!/bin/bash


sudo cp -r ../../hive ~/work/shared/
sudo chmod 777 -R ~/work/shared/

#docker cp setup_employee.sh node1:/work/shared/
#docker exec -it node1 chmod 777 /work/shared/setup_employee.sh
docker exec -it node1 ls -l /work/shared/hive
docker exec -it node1 bash -x /work/shared/hive/bin/setup_employee.sh
