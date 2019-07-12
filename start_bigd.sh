#!/bin/bash

# N=${1:-2}
# CURR_DIR="$PWD"

docker run \
	-p 9999:9999 \
	-p 2222:22 -p 50070:50070 \
	-p 50075:50075 \
	-p 50090:50090 \
	-p 50105:50105 \
	-p 50030:50030 \
	-p 50060:50060 \
	-p 8088:8088 \
	-p 9879:9870 \
	-p 9871:9871 \
	-p 8032:8032 \
	-p 8030:8030 \
        -d --mount src=/home/bh/Dropbox,target=/home/alpine/Dropbox,type=bind \
	--name master -h master \
	xaneon/alpine_x11_base_hadoop3_1_1


