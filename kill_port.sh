#!/bin/zsh

PORT=${1}

    
if [ -z ${PORT} ] ; then
    echo "error: required port number" >&2
    echo "error: kill_port.sh [PORT_NUM]" >&2
    exit
elif [[ $PORT -eq "ls" ]] ; then
    lsof -i TCP:8000-65530  | awk '/LISTEN/ && /java/ {print $1,$2,$9}' 
    exit
fi

re='^[0-9]+$'
if ! [[ ${PORT} =~ $re ]] ; then
    echo "error: Not a number" >&2; exit 1
fi

if [[ ${PORT} -gt 65535 ]] || [[ ${PORT} -lt 1024 ]] ; then 
    echo "error: Port range is 1024 ~ 65535" >&2; exit 1
fi 



PID=`lsof -i :${PORT} | awk '/LISTEN/ && /[0-9]/ {print $2}'`

echo "Enter PORT : ${PORT}"

if [[ -z ${PID} ]] ; then
    echo "error: Not found PID, please check the enter port"
    exit 1
fi

echo "Find PID   : ${PID}"
kill -9 ${PID}

echo "Kill Success"
