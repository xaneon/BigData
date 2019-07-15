docker ps
# kill all images, careful!
docker ps | grep -o "^[a-zA-Z0-9]*  " > tmp.tmp
python3 -c "import os; fid=open('tmp.tmp'); l=fid.readlines();cmds=[os.system('docker kill ' + elem) for elem in l]"
docker image prune -f
docker container prune -f
docker network create --subnet=172.42.0.0/16 hadoopnet 
# docker network connect --ip 172.42.0.21 hadoopnet master
sh start_bigd_master_ubuntu.sh
docker network connect --ip 172.42.0.21 hadoopnet master
# TODO: node1 and node2
# ansible to move hosts file and test connectivity between nodes
ansible-playbook bigd_setup_ubuntu.yml -i hosts_ubuntu.ini -vvvv
# docker exec -it master /bin/bash # login without ssh
