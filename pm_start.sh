#!/bin/bash
source ~/.bash_profile
set -x
VAR=""
build_path="${APP_HOME}/pm/"
build="eir-pm.jar"
cd $build_path
status=`ps -ef | grep $build | grep java`
if [ "$status" != "$VAR" ]
then
 echo "Process Already Running"
else
 echo "Starting Process"

java -Dlog4j.configurationFile=file:./log4j2.xml -jar $build --spring.config.location=file:./application.yml,file:/u01/eirapp/configuration/configuration.properties 1>/dev/null 2>/dev/null &
echo "Process Started"

fi
