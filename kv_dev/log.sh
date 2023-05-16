SRCFILE=/var/log/message

DESTDIR=/mnt/dev2/tmp
DESTFILE=`date +"%m%d-%H%M"`.log

if [ ! -d $DESTDIR ] ; then
	echo need to mount
	echo
	exit
fi

cp -v $SRCFILE $DESTDIR/$DESTFILE
echo

