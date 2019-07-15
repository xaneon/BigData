# run setup for docker container

docker images # show docker images
docker container prune # clean up container
docker image prune # clean up images
CMD="Docker images cleaned"
echo $CMD
docker ps # show running docker images

# create docker network
docker network create --subnet=172.42.0.0/16 hadoopnet

# start the docker image
sh start_bigd_master.sh
sh start_bigd_slave1.sh

# run Ansible playbook
ansible-playbook bigd_setup.yml -i hosts.ini


