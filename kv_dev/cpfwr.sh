SRCDIR=/mnt/dev2/fwr
SRCFILE=$1

DESTDIR=/dvr
DESTFILE=fwr

if [ ! -f $SRCDIR/$SRCFILE ] ; then
	echo need to mount
	echo
	exit
fi

echo
echo $SRCDIR/$SRCFILE
echo

echo -n "Copy? "
read input

if [ "${input}" = "" ]; then
	echo $SRCDIR/$SRCFILE $DESTDIR/$DESTFILE
	cp -v $SRCDIR/$SRCFILE $DESTDIR/$DESTFILE

	echo
	md5sum $DESTDIR/$DESTFILE
	echo
else
	exit
fi


echo -n "Reboot? "
read input

if [ "${input}" = "" ]; then
	reboot
fi
