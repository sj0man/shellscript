# mp = md5sum and copy
#
if [ $# != 2 ]; then 
	echo Usage: mp src dest
	echo
	exit -1
fi

SRC=$1
DEST=$2

if [ ! -e ${SRC} ]; then
	echo "There is not ${SRC}."
	echo
	exit -1
elif [ ! -f ${SRC} ]; then
	echo Usage: mp src dest
	echo Source should be file.
	echo
	exit -1
fi

if [ -d ${DEST} ]; then
	TMP=`basename $1`
	DEST=$2/${TMP}
fi

if [ ! -e ${DEST} ]; then
	echo "There is no comparalbe file."
	cp -v ${SRC} ${DEST}
	exit 0
fi

ls -l ${SRC} ${DEST}
echo

md5sum ${SRC} ${DEST}
echo

echo -n "Copy? "
read input
if [ "${input}" = "" ]; then
	cp -v ${SRC} ${DEST}
	md5sum ${SRC} ${DEST}
fi
