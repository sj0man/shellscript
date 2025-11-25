MY_PROJECT=lynx
MY_MODEL=rk3588
MY_CHIP=rk3588
MY_OEM=3r

SRCDIR=/mnt/dev7/work/$MY_MODEL/output
SRCFILE=gui-$MY_PROJECT-$MY_OEM

DESTDIR=/dvr
DESTFILE=gui

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

