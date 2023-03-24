# select TARGET and CHIP
#
TARGET=crater
CHIP=_chip_nt98633.cpp

TOPDIR=..
DESTDIR=${TOPDIR}/aries/cal
DIRS="ara  auriga  common-dvr-2mp  canis  crater  crux  fornax  generic  indus  libra  mensa  pavo  puppis  volans"

for DIR in ${DIRS} ; do
	if [ -d ${DIR} ]; then
		mv -vf ${DIR} ${DESTDIR}
	fi
done


TMPDIR=./${TARGET}-tmp
TARGET_DIR=${TOPDIR}/aries/cal/${TARGET}
FILES="_chip.cpp _chip_nt9832x.cpp _chip_nt98336.cpp _chip_nt98633.cpp"

for FILE in ${FILES} ; do
	if [ -f ${TMPDIR}/${FILE} ]; then
		mv -v ${TMPDIR}/${FILE} ${TARGET_DIR}
	fi
done
rmdir ${TMPDIR}

# move SDK directory
SDKDIR=sdk
ORG_SDKDIR=${TOPDIR}/aries
if [ -d ${SDKDIR} ] ; then
		mv -v ${SDKDIR} ${ORG_SDKDIR}
fi

exit 0

