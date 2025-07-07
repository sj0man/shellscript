#!/bin/sh

COUNT=0
DELAY_SECOND=60
CHECK_INTERVAL=$((24 * 3600 / $DELAY_SECOND))
MAX_LINES=$(($CHECK_INTERVAL * 365))
CPU_TEMP_FILE=/sys/class/thermal/thermal_zone0/temp
LOGFILE=/var/log/cpu_temperature.log
BAKFILE=/dvr/cpu_temperature.log
CUR_DATE=$(date '+%Y-%m-%d-%H')


if [ -z $CPU_TEMP_FILE ]; then
	exit
fi

[ -d /var/log ] || mkdir -p /var/log

if [ -f "$BAKFILE" ]; then
	cp "$BAKFILE" "$LOGFILE"
fi

while true
do
	HDD_TEMP=""
	for DISK in /dev/sd?; do
		[ -b "$DISK" ] || continue

		if smartctl -i "$DISK" | grep -q "SMART support is: Disabled"; then
			smartctl -s on "$DISK"
		fi

		TMP_TEMP=""
		TMP_TEMP=$(smartctl -A "$DISK" 2> /dev/null | awk '$1 == 194 {print $10}')

		if [ -n "$TMP_TEMP" ]; then
			#NAME=$(basename "$DISK")
			NAME="${DISK##*/}"
			HDD_TEMP="${HDD_TEMP}${NAME}=${TMP_TEMP} "
		fi
	done


	CPU_TEMP=$(cat $CPU_TEMP_FILE)

	echo "$(date '+%Y-%m-%d-%H:%M:%S'): cpu=${CPU_TEMP} ${HDD_TEMP}" >> "$LOGFILE"
	sleep $DELAY_SECOND

	COUNT=$((COUNT + 1))
	if [ "$COUNT" -ge "$CHECK_INTERVAL" ]; then
		CURRENT_LINES=$(wc -l < "$LOGFILE")

		if [ "$CURRENT_LINES" -gt "$MAX_LINES" ]; then
			mv "${LOGFILE}" "${BAKFILE}_$(date '+%Y-%m-%d')"
			touch "${LOGFILE}"
		fi
		COUNT=0
	fi

	NEW_DATE=$(date '+%Y-%m-%d-%H')
	if [ "$CUR_DATE" != "$NEW_DATE" ]; then
		cp "${LOGFILE}" "${BAKFILE}"
		CUR_DATE="$NEW_DATE"
	fi

done
