SRCDIR=/mnt/dev2/nt98336/output
SRCFILE=libdal-canis-nt98336.so

DESTDIR=/usr/lib
DESTFILE=libdal.so

if [ ! -f $SRCDIR/$SRCFILE ] ; then
	echo need to mount
	echo
	exit
fi

echo
md5sum $SRCDIR/$SRCFILE $DESTDIR/$DESTFILE
echo

echo -n "Copy? "
read input

if [ "${input}" = "" ]; then

	cp -v $SRCDIR/$SRCFILE $DESTDIR/$DESTFILE

	echo
	md5sum $SRCDIR/$SRCFILE $DESTDIR/$DESTFILE
	echo
fi

echo -n "Reboot? "
read input

if [ "${input}" = "" ]; then
	reboot
fi
