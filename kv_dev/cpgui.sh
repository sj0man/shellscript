#SRCDIR=/mnt/dev2/work/xnst16/output
#SRCFILE=gui-canis-3r

#SRCDIR=/mnt/dev2/nt9832x/output
#SRCFILE=gui-crater-3r

SRCDIR=/mnt/dev2/xnpm32/output
SRCFILE=gui-canis-3r

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

