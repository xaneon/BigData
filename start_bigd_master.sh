#!/bin/bash

N=2
# N=${1:-2}
# CURR_DIR="$PWD"

docker run \
	-p 9999:9999 \
	-p 2222:22 \
	-p 443:443 \
	-p 50070:50070 \
	-p 50075:50075 \
	-p 50090:50090 \
	-p 50030:50030 \
	-p 50060:50060 \
	-p 8030:8030 \
	-p 8031:8031 \
	-p 8032:8032 \
	-p 8033:8033 \
	-p 8040:8040 \
	-p 8044:8044 \
	-p 8045:8045 \
	-p 8046:8046 \
	-p 8047:8047 \
	-p 8048:8048 \
	-p 8088:8088 \
	-p 8089:8089 \
	-p 8090:8090 \
	-p 8091:8091 \
	-p 8190:8190 \
	-p 8440:8440 \
	-p 8441:8441 \
	-p 8788:8788 \
	-p 9864:9864 \
	-p 9865:9865 \
	-p 9866:9866 \
	-p 9867:9867 \
	-p 9868:9868 \
	-p 9869:9869 \
	-p 9870:9870 \
	-p 9871:9871 \
	-p 10020:10020 \
	-p 10033:10033 \
	-p 10200:10200 \
	-p 19888:19888 \
	-p 19980:19980 \
	-p 50020:50020 \
        -d --mount src=/home/bh/Dropbox,target=/home/alpine/Dropbox,type=bind \
	--name master -h master \
        -e "SLAVES=$N"  xaneon/alpine_x11_base_hdfs3_1_1


