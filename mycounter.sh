#!/bin/bash

CNT_FILE="/home/ubuntu/tmp/count.txt"
LOG_FILE="/home/ubuntu/tmp/log.txt"
date=`date "+%Y-%m-%d-%H:%M:%S"`

if [ ! -e $CNT_FILE ]; then
	echo "Echo Create Counter.."
	echo "0" > $CNT_FILE
fi

get_cnt=`cat $CNT_FILE`
set_cnt=$(expr ${get_cnt} + 1);
state_string="$date ($set_cnt)"


echo "$set_cnt" > $CNT_FILE
echo $state_string >> $LOG_FILE

