#SRCDIR=/mnt/dev2/work/xnst16/output
#SRCFILE=libdal-canis-nt98336.so

# SRCDIR=/mnt/dev2/nt9832x/output
# SRCFILE=libdal-crater.so

SRCDIR=/mnt/dev2/xnpm32/output
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
else
	exit
fi

echo -n "Reboot? "
read input

if [ "${input}" = "" ]; then
	reboot
fi
