#!/bin/sh

COUNT=0
INFILE=/dev/urandom
OUTFILE=/mnt/test.bin

# Remove old log
dmesg -c >/dev/null 2>&1

if [ -f $OUTFILE ]; then
    rm -f $OUTFILE
fi

while true
do
    COUNT=$((COUNT + 1))

    echo "===== LOOP ${COUNT} ====="

    dd if=$INFILE of=$OUTFILE bs=1M count=100 conv=fsync >/dev/null 2>&1

    RET=$?
    if [ $RET -ne 0 ]; then
        echo "dd failed (ret=$RET)"
    fi
    sync

    rm -f $OUTFILE
    sync

    # Check new dmesg
    ERRLOG=$(dmesg -c | grep -iE \
        "crc|ecc|uncorrectable|bitflip|jffs2.*error|jffs2.*crc|read error|write error|erase error")

    if [ -n "$ERRLOG" ]; then
        echo ""
        echo "########################################"
        echo "# NAND/JFFS2 ERROR DETECTED"
        echo "########################################"
        echo "$ERRLOG"
        echo ""
    fi
done

