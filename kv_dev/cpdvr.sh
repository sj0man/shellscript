#
#
#
#SRCDIR=/mnt/dev2/work/xnst16/canis/nt98336/dvr
#SRCDIR=/mnt/dev2/inpm32/crater/nt9833x/dvr
SRCDIR=/mnt/dev2/xnpm32/canis/nt9833x/dvr

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
	reboot
fi




