#!/bin/bash

N=2
# N=${1:-2}
# CURR_DIR="$PWD"

docker run \
	-p 2223:22 \
        -d --mount src=/home/bh/Dropbox,target=/home/alpine/Dropbox,type=bind \
	--name slave1 \
 	--link master:master \
	--net hadoopnet --ip 172.42.0.22 \
        -h slave1 xaneon/alpine_x11_base_hdfs3_1_1

