#!/bin/bash 
#  author wy_ctl
# ./wy_ctl.sh start 启动
# ./wy_ctl.sh stop 停止
# ./wy_ctl.sh restart 重启
# ./wy_ctl.sh status 状态
AppName=/usr/local/wysoft/app/ruoyi-admin.jar

APP_HOME=/usr/local/wysoft

# 服务器地址
# IP=0.0.0.0

# mysql 数据库用户名
DbServ=pm_db
DbName=zhiyu_project
DbUserName=root
DbPassword=fQFaucSnjWA13b

#Redis 
RedisServ=pm_redis
RedisPort=6379
RedisPwd=password

# 文件存储路径
FilePath=/usr/local/wysoft/app/uploads


LICENSE_PATH=/usr/local/wysoft/app/license.lic


APP_OPTS="--ruoyi.profile=$FilePath  --license.licensePath=$LICENSE_PATH" 


# JVM参数
JVM_OPTS="-Dname=$AppName -Duser.timezone=Asia/Shanghai -Xms256M -Xmx512M
-XX:PermSize=256M -XX:MaxPermSize=512M -XX:+HeapDumpOnOutOfMemoryError
-XX:+PrintGCDateStamps -XX:+PrintGCDetails -XX:NewRatio=1 -XX:SurvivorRatio=30
-XX:+UseParallelGC -XX:+UseParallelOldGC -Dfile.encoding=utf-8 -Dsun.jnu.encoding=UTF-8"
DB_OPTS="--spring.datasource.druid.master.url=jdbc:mysql://$DbServ:3306/$DbName?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
--spring.datasource.druid.master.username=$DbUserName --spring.datasource.druid.master.password=$DbPassword"
Redis_OPTS="--spring.redis.host=$RedisServ --spring.redis.port=$RedisPort
--spring.redis.password=$RedisPwd"


LOG_PATH=/usr/local/wysoft/logs/$AppName.log

if [ "$1" = "" ];
then
    echo -e "\033[0;31m 未输入操作名 \033[0m  \033[0;34m {start|stop|restart|status} \033[0m"
    exit 1
fi

if [ "$AppName" = "" ];
then
    echo -e "\033[0;31m 未输入应用名 \033[0m"
    exit 1
fi

function start()
{
    PID=`ps -ef |grep java|grep $AppName|grep -v grep|awk '{print $2}'`

        if [ x"$PID" != x"" ]; then
            echo "$AppName is running..."
        else
                nohup java  -jar $AppName $JVM_OPTS  $DB_OPTS $Redis_OPTS $APP_OPTS >> $APP_HOME/logs/server.log 2>&1 &
				
				
                echo "Start $AppName success..."
        fi
}

function stop()
{
    echo "Stop $AppName"

        PID=""
        query(){
                PID=`ps -ef |grep java|grep $AppName|grep -v grep|awk '{print $2}'`
        }

        query
        if [ x"$PID" != x"" ]; then
                kill -TERM $PID
                echo "$AppName (pid:$PID) exiting..."
                while [ x"$PID" != x"" ]
                do
                        sleep 1
                        query
                done
                echo "$AppName exited."
        else
                echo "$AppName already stopped."
        fi
}

function restart()
{
    stop
    sleep 2
    start
}

function status()
{
    PID=`ps -ef |grep java|grep $AppName|grep -v grep|wc -l`
    if [ $PID != 0 ];then
        echo "$AppName is running..."
    else
        echo "$AppName is not running..."
    fi
}

case $1 in
    start)
    start;;
    stop)
    stop;;
    restart)
    restart;;
    status)
    status;;
    *)

esac


tail -f /dev/null 
