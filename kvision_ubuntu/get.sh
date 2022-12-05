DIRS="ara  auriga  common-dvr-2mp  crater  crux  fornax  generic  indus  libra  mensa  pavo  puppis  volans"
SRCDIR=~/nt9831x/aries/cal



for DIR in ${DIRS} ; do
	if [ -d ${SRCDIR}/${DIR} ]; then
		mv -v ${SRCDIR}/${DIR} .
	fi
done

exit 0

