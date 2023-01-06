#TOPDIR=/home/ubuntu/nt9831x
#TOPDIR=/home/ubuntu/nt9832x
TOPDIR=/home/ubuntu/nt98336

#FILES="_chip_nt9832x.cpp _chip_nt98336.cpp"
#FILES="_chip.cpp _chip_nt98336.cpp"
FILES="_chip.cpp _chip_nt9832x.cpp"

DESTDIR=${TOPDIR}/aries/cal
FROM_SDK=${PWD}/sdk
TO_SDK=${TOPDIR}/aries/sdk
DIRS="ara  auriga  common-dvr-2mp  crater  crux  fornax  generic  indus  libra  mensa  pavo  puppis  volans"

CANIS=canis
CANIS_DIR=${TOPDIR}/aries/cal/${CANIS}


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

# move SDK
if [ "$1" = "sdk" ] ;  then
	if [ -d ${FROM_SDK} ] ; then
		mv -v ${FROM_SDK} ${TO_SDK}
	fi
fi

exit 0

