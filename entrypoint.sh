#!/bin/bash
#Borrowing an idea from https://github.com/MashupMill/docker-presence-monitor

date +%s > last_msg
while true; do [[ -e main_pipe ]] && read line < main_pipe && date +%s > last_msg; done &

./monitor.sh -b -w -D /config
exit $?
