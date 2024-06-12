# dirdiff.sh - Compare files in the current directory with the specified directory.
#
if [ $# != 1 ]; then
	echo Usage: `basename $0` dest
	echo
	exit -1
fi

DEST=$1
DETECTED_COUNT=0
NO_DETECTED_COUNT=0

LIST=`find . -maxdepth 1 -type f`
for SRC in ${LIST} ; do
	FILE=`basename ${SRC}`
	if [ -f ${DEST}/${FILE} ] ; then
		echo Detected ${FILE}
		DETECTED_COUNT=$(echo "$DETECTED_COUNT + 1" | bc)
	else
		echo NO detected ${FILE}
		NO_DETECTED_COUNT=$(echo "$NO_DETECTED_COUNT + 1" | bc)
	fi
done

echo --
echo ${DETECTED_COUNT} files detected.
echo ${NO_DETECTED_COUNT} files not detected.
echo
