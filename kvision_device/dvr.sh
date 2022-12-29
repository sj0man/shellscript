SRCDIR=/mnt/dev2/nt9831x/canis/nt9831x/dvr
SRCFILE=dvr.ko

DESTDIR=/dvr
DESTFILE=dvr.ko

if [ ! -f $SRCDIR/$SRCFILE ] ; then
	echo need to mount
	echo
	exit
fi

echo
md5sum $SRCDIR/$SRCFILE
if [ -f $DESTDIR/$DESTFILE ] ; then
	md5sum $DESTDIR/$DESTFILE
fi
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
