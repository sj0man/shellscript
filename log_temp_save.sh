#!/bin/sh

COUNT=0
SMART_SLEEP=1
CHECK_INTERVAL=74
DELETE_LINES=$(($CHECK_INTERVAL * 30))
MAX_LINES=$(($CHECK_INTERVAL * 365))
CPU_TEMP_FILE=/sys/class/thermal/thermal_zone0/temp
LOGFILE=/var/log/cpu_temperature.log
TZFILE="/etc/TZ"

CPU_TEMP=""
HDD_TEMP=""

[ -d /var/log ] || mkdir -p /var/log

if [ -f "$TZFILE" ] && [ -s "$TZFILE" ]; then
	export TZ=$(cat "$TZFILE")
fi

get_cpu_temp()
{
	if [ -f "$CPU_TEMP_FILE" ]; then
		CPU_TEMP="cpu=$(cat "$CPU_TEMP_FILE")"
	else
		CPU_TEMP="cpu=N/A"
	fi
}

get_hdd_temp()
{
	HDD_TEMP=""
	for DISK in /dev/sd?; do
		[ -b "$DISK" ] || continue

		if smartctl -i "$DISK" | grep -q "SMART support is: Disabled"; then
			smartctl -s on "$DISK" > /dev/null
			sleep $SMART_SLEEP
			TMP_TEMP=$(smartctl -A "$DISK" 2> /dev/null | awk '$1 == 194 {print $10}')
			smartctl -s off "$DISK" > /dev/null
		else
			TMP_TEMP=$(smartctl -A "$DISK" 2> /dev/null | awk '$1 == 194 {print $10}')
		fi

		if [ -n "$TMP_TEMP" ]; then
			#NAME=$(basename "$DISK")
			NAME="${DISK##*/}"
			HDD_TEMP="${HDD_TEMP}${NAME}=${TMP_TEMP} "
		fi
	done
}

keep_log_size()
{
	COUNT=$((COUNT + 1))
	if [ "$COUNT" -ge "$CHECK_INTERVAL" ]; then
		CURRENT_LINES=$(wc -l < "$LOGFILE")

		if [ "$CURRENT_LINES" -gt "$MAX_LINES" ]; then
			tail -n $(($MAX_LINES - $DELETE_LINES)) "$LOGFILE" > "${LOGFILE}.tmp"
			mv "${LOGFILE}.tmp" "$LOGFILE"
		fi
		COUNT=0
	fi
}

if [ "$1" = "-daemon" ]; then
	while true
	do
		get_cpu_temp
		get_hdd_temp

		echo "$(date '+%Y-%m-%d-%H:%M:%S'): ${CPU_TEMP} ${HDD_TEMP}" >> "$LOGFILE"
		if [ $(date +%H) -ge 9 ] && [ $(date +%H) -le 18 ]; then
			DELAY_SECOND=$((60 * 10)) # 10 minutes during the day
		else
			DELAY_SECOND=$((60 * 60)) # 1 hour during the night
		fi
		sleep $DELAY_SECOND

		keep_log_size
	done
else
	get_cpu_temp
	get_hdd_temp
	echo "$(date '+%Y-%m-%d-%H:%M:%S'): ${CPU_TEMP} ${HDD_TEMP}" >> "$LOGFILE"
fi
