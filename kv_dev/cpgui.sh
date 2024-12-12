MY_PROJECT=canis
MY_MODEL=arlt16
MY_CHIP=nt98336

SRCDIR=/mnt/dev7/work/$MY_MODEL/output
SRCFILE=gui-$MY_PROJECT-3r

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

