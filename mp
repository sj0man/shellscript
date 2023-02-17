# mp = md5sum and copy
#
if [ $# != 2 ]; then 
	echo Usage: ff src dest
	echo
	exit -1
fi

SRC=$1
DEST=$2

ls -l ${SRC} ${DEST}
echo

md5sum ${SRC} ${DEST}
echo

echo -n "Copy? "
read input
if [ "${input}" = "" ]; then
	cp -v ${SRC} ${DEST}
fi
