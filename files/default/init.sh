#!/bin/bash

# sainsburys
#
# chkconfig:   - 57 47
# description: sainsburys
# processname:  sainsburys
#

case $1 in
    start)
        echo "Starting sainsburys web app."
        /opt/go/bin/sainsburys &
        ;;
    stop)
        echo "Stopping sainsburys web app."
        sudo kill $(sudo lsof -t -i:8484)
        ;;
    *)
        echo "sainsburys web app service."
        echo $"Usage $0 {start|stop}"
        exit 1
esac
exit 0
