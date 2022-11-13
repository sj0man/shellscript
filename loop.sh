FILES="a.c b.c c.c d.c"

for FILE in ${FILES} ; do
    echo ${FILE}
done


#
# 변수를 초기화할때 띄어쓰면 안된다. (변수명과 값 사이에 공백이 있으면 에러발생)
#
CNT=0

for var in `ls *.sh`; do
    CNT=$(echo "$CNT + 1" | bc)
    printf "${var}: %02d, %s\n" `echo ${CNT}` `echo end`;
done
