#!/bin/sh

COUNT=0
INFILE=/dev/urandom
OUTFILE=/mnt/test.bin
LOGFILE=/dvr/nandck.log
ECCFILE=/sys/class/mtd/mtd4/ecc_failures

# Remove old log
#dmesg -c | grep -iE "crc|ecc|uncorrectable|bitflip|jffs2.*error|jffs2.*crc|read error|write error|erase error" >> $LOGFILE

if [ -f $OUTFILE ]; then
    rm -f $OUTFILE
fi

while true
do
    COUNT=$((COUNT + 1))
    DATE_TIME=$(TZ=KST-9 date +"%m%d-%H%M%S")

    echo "===== ${DATE_TIME} ===== LOOP ${COUNT} =====" >> $LOGFILE

    # write random data to nand
    dd if=$INFILE of=$OUTFILE bs=1M count=100 conv=fsync 2>&1 | tee -a $LOGFILE >/dev/null
	#dd if=$INFILE of=$OUTFILE bs=1M count=100 conv=fsync >/dev/null 2>&1

    RET=$?
    if [ $RET -ne 0 ]; then
        echo "dd failed (ret=$RET)" >> $LOGFILE
    fi
    sync

    # read back and check checksum
    sha256sum $OUTFILE >/dev/null
    cat $OUTFILE >/dev/null
    sync

    # Check new dmesg
    ERRLOG=$(dmesg -c | grep -iE "crc|ecc|uncorrectable|bitflip|jffs2.*error|jffs2.*crc|read error|write error|erase error")
    echo "$ERRLOG" >> $LOGFILE

    if [ -n "$ERRLOG" ]; then
        echo "" >> $LOGFILE
        echo "########################################" >> $LOGFILE
        echo "# NAND/JFFS2 ERROR DETECTED" >> $LOGFILE
        echo "########################################" >> $LOGFILE
        echo "$ERRLOG" >> $LOGFILE
        echo "" >> $LOGFILE
    fi

    rm -f $OUTFILE
    sync

	ECCLOG=$(cat $ECCFILE)
	echo "ECC Failures: $ECCLOG" >> $LOGFILE

	if [ "$ECCLOG" -gt 0 ]; then
		echo "" >> $LOGFILE
		echo "########################################" >> $LOGFILE
		echo "# NAND ECC ERROR DETECTED" >> $LOGFILE
		echo "########################################" >> $LOGFILE
		echo "ECC Failures: $ECCLOG" >> $LOGFILE
		echo "" >> $LOGFILE
	fi

	sleep 1
done

