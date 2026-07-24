MY_PROJECT=crater
MY_MODEL=nt9832x
MY_CHIP=nt9832x

MNTDIR=/mnt/dev7
SRCDIR=/mnt/dev7/work/$MY_MODEL/onvifcpplib/linux
SRCFILE=libonvifcpplib.so

DESTDIR=/usr/lib
DESTFILE=libonvifcpplib.so

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


