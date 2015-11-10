#!/bin/bash
#
# chkconfig: 35 90 12
# description: sainsburys go server
#
# Get function from functions library
. /etc/init.d/functions

start() {
        initlog -c "echo -n Starting sainsburys server: "
        /opt/go/bin/sainsburys &
        ### Create the lock file ###
        touch /var/lock/subsys/sainsburys
        success $"sainsburys server startup"
        echo
}
stop() {
        initlog -c "echo -n Stopping sainsburys server: "
        killproc sainsburys
        ### Now, delete the lock file ###
        rm -f /var/lock/subsys/sainsburys
        echo
}
### main logic ###
case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  status)
        status sainsburys
        ;;
  restart)
        stop
        start
        ;;
  *)
        echo $"Usage: $0 {start|stop|restart|status}"
        exit 1
esac
exit 0
