#!/bin/bash
N=2
# docker run -d --name resolvable --hostname resolvable -v /var/run/docker.sock:/tmp/docker.sock -v /etc/resolv.conf:/tmp/resolv.conf mgood/resolvable
# docker run -d --name master -h master -e "SLAVES=$N"  xaneon/alpine_x11_base_hdfs3_1_1

# docker run -d --link master:master -h slave1 xaneon/alpine_x11_base_hdfs3_1_1
# docker run -d --link master:master -h slave2 xaneon/alpine_x11_base_hdfs3_1_1
sh start_bigd_master.sh
sh start_bigd_slave1.sh

sleep 10

docker exec -it master bash -li '/usr/local/hadoop/sbin/start-wrapper.sh'

echo  "Cluster started. HDFS UI on http://master:9870/dfshealth.html#tab-datanode"
echo  "YARN UI on http://master:8088/cluster/nodes"
