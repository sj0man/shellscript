TOPDIR=/home/ubuntu/nt98336
#TOPDIR=/home/ubuntu/nt9831x

DESTDIR=${TOPDIR}/aries/cal
DIRS="ara  auriga  common-dvr-2mp  crater  crux  fornax  generic  indus  libra  mensa  pavo  puppis  volans"

CANIS=canis
CANIS_DIR=${TOPDIR}/aries/cal/${CANIS}
FILES="_chip.cpp _chip_nt9832x.cpp"

case ${TOPDIR#/home/ubuntu/} in
	nt9831x) FILES="_chip_nt9832x.cpp _chip_nt98336.cpp" ;;
	nt9832x) FILES="_chip.cpp _chip_nt98336.cpp" ;;
	nt98336) FILES="_chip.cpp _chip_nt9832x.cpp" ;;
esac



for DIR in ${DIRS} ; do
	if [ -d ${DIR} ]; then
		mv -vf ${DIR} ${DESTDIR}
	fi
done

for FILE in ${FILES} ; do
        if [ -f ${CANIS}/${FILE} ]; then
                mv -v ${CANIS}/${FILE} ${CANIS_DIR}
        fi
done
rmdir ${CANIS}

exit 0

