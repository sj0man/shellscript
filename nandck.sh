#!/bin/sh

COUNT=0
INFILE=/dev/urandom
OUTFILE=/mnt/test.bin
LOGFILE=/dvr/nandck.log
ECCFILE=/sys/class/mtd/mtd4/ecc_failures


if [ -f $OUTFILE ]; then
    rm -f $OUTFILE
fi

# 기존 로그 정리 대신 구분선 추가
echo "===== TEST START: $(date) =====" >> $LOGFILE
sleep 60

while true
do
    COUNT=$((COUNT + 1))
    DATE_TIME=$(TZ=KST-9 date +"%m%d-%H%M%S")
    echo "===== ${DATE_TIME} ===== LOOP ${COUNT} =====" >> $LOGFILE

    # 1. 무작위 데이터 쓰기 및 완전한 동기화
    dd if=$INFILE of=$OUTFILE bs=1M count=100 conv=fsync 2>&1 | tee -a $LOGFILE >/dev/null
    sync

    # [개선 핵심] 드롭 캐시를 통해 메모리에 남아있는 파일 캐시를 완전히 비웁니다.
    # 이렇게 해야 다음 read 명령 시 반드시 '물리 NAND 플래시'로부터 데이터를 직접 읽어옵니다.
    echo 3 > /proc/sys/vm/drop_caches
    sleep 1

    # 2. 물리 플래시로부터 읽기 수행 및 리턴코드(Exit Code) 확인
    # 만약 수정한 코드에서 -EBADMSG(-EIO)를 던지면 sha256sum이나 cat은 0이 아닌 에러 코드를 반환합니다.
    sha256sum $OUTFILE > /dev/null 2>&1
    SHA_RET=$?

    cat $OUTFILE > /dev/null 2>&1
    CAT_RET=$?

    if [ $SHA_RET -ne 0 ] || [ $CAT_RET -ne 0 ]; then
        echo "[[ALERT]] Read command failed! sha256_ret=$SHA_RET, cat_ret=$CAT_RET" >> $LOGFILE
    fi

    # 3. [개선] dmesg -c 대신 무파괴 읽기 후 tail/grep 사용 (로그 유실 방지)
    # 커널에서 우리가 추가한 -EBADMSG가 터지면 jffs2나 mtd 레이어에서 에러를 출력합니다.
    ERRLOG=$(dmesg | tail -n 50 | grep -iE "crc|ecc|uncorrectable|bitflip|jffs2.*error|read error|EBADMSG")

    if [ -n "$ERRLOG" ]; then
        echo "########################################" >> $LOGFILE
        echo "# KERNEL DETECTED NAND/JFFS2 EFFECT" >> $LOGFILE
        echo "########################################" >> $LOGFILE
        echo "$ERRLOG" >> $LOGFILE
    fi

    # 4. 파일 삭제 후 다시 캐시 비우기
    rm -f $OUTFILE
    sync
    echo 3 > /proc/sys/vm/drop_caches

    # 5. ECC 실패 카운터 점검
    ECCLOG=$(cat $ECCFILE 2>/dev/null)
    echo "Current MTD ECC Failures: $ECCLOG" >> $LOGFILE

    if [ -n "$ECCLOG" ] && [ "$ECCLOG" -gt 0 ]; then
        echo "########################################" >> $LOGFILE
        echo "# SUCCESS: MTD ECC FAILURE COUNTER INCREMENTED!" >> $LOGFILE
        echo "########################################" >> $LOGFILE
    fi

    sleep 1
done
