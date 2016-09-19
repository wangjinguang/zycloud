#! /bin/sh

name=$1

scp ${name}/target/${name}-0.0.1-SNAPSHOT.jar root@192.168.1.129:/data/liusy/jar/${name}-0.0.1-SNAPSHOT.jar

