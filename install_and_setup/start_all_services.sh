start-dfs.sh
start-yarn.sh
cd /usr/local/zookeeper/bin
zkServer.sh start
cd /usr/local/hbase/bin
start-hbase.sh
cd /usr/local/zeppelin/bin
zeppelin-daemon.sh start
jps
ss -tunelp
