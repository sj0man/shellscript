#TOPDIR=/home/ubuntu/nt9831x
#TOPDIR=/home/ubuntu/nt9832x
TOPDIR=/home/ubuntu/nt98336

#FILES="_chip_nt9832x.cpp _chip_nt98336.cpp"
#FILES="_chip.cpp _chip_nt98336.cpp"
FILES="_chip.cpp _chip_nt9832x.cpp"

SRCDIR=${TOPDIR}/aries/cal
SDK_DIR=${TOPDIR}/aries/sdk
DIRS="ara  auriga  common-dvr-2mp  crater  crux  fornax  generic  indus  libra  mensa  pavo  puppis  volans"

CANIS=canis
CANIS_DIR=${TOPDIR}/aries/cal/${CANIS}


for DIR in ${DIRS} ; do
	if [ -d ${SRCDIR}/${DIR} ]; then
		mv -v ${SRCDIR}/${DIR} ${PWD}
	fi
done

mkdir -p ./${CANIS}
for FILE in ${FILES} ; do
	if [ -f ${CANIS_DIR}/${FILE} ]; then
		mv -v ${CANIS_DIR}/${FILE} ./${CANIS}
	fi
done

# move SDK directory
if [ "$1" = "sdk" ] ; then
	if [ -d ${SDK_DIR} ] ; then
		mv -v ${SDK_DIR} ${PWD}
	fi
fi

exit 0

