DIRS="ara  auriga  common-dvr-2mp  crater  crux  fornax  generic  indus  libra  mensa  pavo  puppis  volans"
DESTDIR=~/nt9831x/aries/cal



for DIR in ${DIRS} ; do
	if [ -d ${DIR} ]; then
		mv -v ${DIR} ${DESTDIR}
	fi
done

exit 0

