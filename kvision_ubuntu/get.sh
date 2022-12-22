TOPDIR=/home/ubuntu/nt98336
#TOPDIR=/home/ubuntu/nt9831x

SRCDIR=${TOPDIR}/aries/cal
DIRS="ara  auriga  common-dvr-2mp  crater  crux  fornax  generic  indus  libra  mensa  pavo  puppis  volans"

CANIS=canis
CANIS_DIR=${TOPDIR}/aries/cal/${CANIS}

case ${TOPDIR#/home/ubuntu/} in
	nt9831x) FILES="_chip_nt9832x.cpp _chip_nt98336.cpp" ;;
	nt9832x) FILES="_chip.cpp _chip_nt98336.cpp" ;;
	nt98336) FILES="_chip.cpp _chip_nt9832x.cpp" ;;
esac



for DIR in ${DIRS} ; do
	if [ -d ${SRCDIR}/${DIR} ]; then
		mv -v ${SRCDIR}/${DIR} .
	fi
done

mkdir -p ./${CANIS}
for FILE in ${FILES} ; do
        if [ -f ${CANIS_DIR}/${FILE} ]; then
                mv -v ${CANIS_DIR}/${FILE} ./${CANIS}
        fi
done

exit 0

