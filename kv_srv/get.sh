# select TARGET and CHIP
#
TARGET=crater
CHIP=_chip_nt98633.cpp

TOPDIR=..
SRCDIR=${TOPDIR}/aries/cal
DIRS="ara  auriga  common-dvr-2mp  canis  crater  crux  fornax  generic  indus  libra  mensa  pavo  puppis  volans"

for DIR in ${DIRS} ; do
	if [ ! "${DIR}" = "${TARGET}" ]; then
		if [ -d ${SRCDIR}/${DIR} ]; then
			mv -v ${SRCDIR}/${DIR} ${PWD}
		fi
	fi
done

TARGET_DIR=${TOPDIR}/aries/cal/${TARGET}
FILES="_chip.cpp _chip_nt9832x.cpp _chip_nt98336.cpp _chip_nt98633.cpp"

TMPDIR=./${TARGET}-tmp
mkdir -p ${TMPDIR}
for FILE in ${FILES} ; do
	if [ ! "${FILE}" = "${CHIP}" ]; then
		if [ -f ${TARGET_DIR}/${FILE} ]; then
			mv -v ${TARGET_DIR}/${FILE} ${TMPDIR}
		fi
	fi
done


# move hisilicon
HSDIR=${TOPDIR}/aries/sdk/hisilicon
if [ -d ${HSDIR} ] ; then
	mv -v ${HSDIR} ${PWD}
fi


# move SDK directory
SDKDIR=${TOPDIR}/aries/sdk
if [ "$1" = "sdk" ] ; then
	if [ -d ${SDKDIR} ] ; then
		mv -v ${SDKDIR} ${PWD}
	fi
fi

exit 0

