#
#
if [ ! $# = 1 ]; then
	echo Usage: fwr2tgz file
	exit 0
fi


if [ ! -e ${FILE} ]; then
	echo ${FILE} not found
	exit 0
fi

FILE=$1
# change extension of file
OUTFILE=${FILE%.fwr}.tgz

# get file size
SIZE=`stat -c "%s" ${FILE}`

# two ways to calculate
SIZE=$(( ${SIZE} - 4 ))
#SIZE=$(echo "${SIZE} - 4" | bc )


dd if=${FILE} of=${OUTFILE} bs=${SIZE} count=1
