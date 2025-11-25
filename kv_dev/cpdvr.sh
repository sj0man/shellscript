MY_PROJECT=lynx
MY_MODEL=rk3588
MY_CHIP=

MNTDIR=/mnt/dev7
SRCDIR=/mnt/dev7/work/$MY_MODEL/$MY_PROJECT/$MY_CHIP/dvr
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




