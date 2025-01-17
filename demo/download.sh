#!/bin/bash

NGINX=nginx-1.12.2
NGINX_DOWNLOAD_PATH=http://nginx.org/download/$NGINX.tar.gz

REDIS=redis-4.0.2
REDIS_DOWNLOAD_PATH=http://download.redis.io/releases/$REDIS.tar.gz

MYSQL=mysql-5.7.21
MYSQL_DOWNLOAD_PATH=https://cdn.mysql.com/Downloads/MySQL-5.7/$MYSQL.tar.gz

download() {
    if [ -f $1 ]
    then
        echo "$1 existed."
    else
        echo "$1 not existed, begin to download..."
        wget $2 -O $1;
        if [ $? -eq 0 ]
        then
            echo "download $1 successed;"
        else
            echo "Error: download $1 failed";
            return 1;
        fi
    fi
    return 0
}

download $NGINX.tar.gz $NGINX_DOWNLOAD_PATH

download $REDIS.tar.gz $REDIS_DOWNLOAD_PATH

download $MYSQL.tar.gz $MYSQL_DOWNLOAD_PATH

