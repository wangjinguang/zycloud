#! /bin/sh

name=$2

export DOCKER_IP=192.168.1.128

DOCKER_IP=${DOCKER_IP:-0.0.0.0}

#启动方法
start(){
 exec java -Djava.security.egd=file:/dev/./urandom -jar jar/${name}-0.0.1-SNAPSHOT.jar >logs/${name}_out.log &
 #java -Xms128m -Xmx2048m -jar cmpp.jar 5 > log.log &
 #tail -f result.log
}
#停止方法
stop(){
 ps -ef|grep urandom|awk '{print $2}'|while read pid
 do
    kill -9 $pid
 done
}

case "$1" in
start)
start
;;
stop)
stop
;;
restart)
stop
start
;;
*)
printf 'Usage: %s {start|stop|restart}\n' "$prog"
exit 1
;;
esac

