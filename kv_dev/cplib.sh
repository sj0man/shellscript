MY_PROJECT=canis
MY_MODEL=nt9832x
MY_CHIP=nt9832x

MNTDIR=/mnt/dev7
SRCDIR=/mnt/dev7/work/$MY_MODEL/output
SRCFILE=libdal-$MY_PROJECT-$MY_CHIP.so

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
else
	exit
fi

echo -n "Reboot? "
read input

if [ "${input}" = "" ]; then
	if [ -d $SRCDIR ]; then
		umount $MNTDIR
	fi
	reboot
fi
