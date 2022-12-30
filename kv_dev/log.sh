SRCFILE=/var/log/message

DESTDIR=/mnt/dev2/tmp/
DESTFILE=message_`date +"%m%d_%H%M"`

if [ ! -d $DESTDIR ] ; then
	echo need to mount
	echo
	exit
fi

cp -v $SRCFILE $DESTDIR/$DESTFILE
echo

