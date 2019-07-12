# run setup for docker container

docker images # show docker images
docker container prune # clean up container
docker image prune # clean up images
CMD="Docker images cleaned"
echo $CMD
docker ps # show running docker images

# start the docker image
sh start_bigd.sh

# run Ansible playbook
ansible-playbook bigd_setup.yml -i hosts.ini


