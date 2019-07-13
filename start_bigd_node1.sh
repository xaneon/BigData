#!/bin/bash

N=2
# N=${1:-2}
# CURR_DIR="$PWD"

docker run \
        -d --mount src=/home/bh/Dropbox,target=/home/alpine/Dropbox,type=bind \
	--name node1 \
 	--link master:master \
        -h node1 xaneon/alpine_x11_hdfs3_1_1_node1

