#
# Description: Copy the SDK libraries to the current directory.
# Usage: cp_sdk_lib.sh [SDK_PATH]
#
if [ $# = 1 ]; then
	TOP_SDK=$1
else
	TOP_SDK=~/tmp/sdk_113
fi

if [ ! -d ${TOP_SDK} ]; then
	echo "Error: ${TOP_SDK} is not a directory."
	exit -1
fi

DIRS="	\
	${TOP_SDK}/code/lib/source/libfdt/libfdt.a
	${TOP_SDK}/code/hdal/source/libhdal.a
	${TOP_SDK}/code/hdal/vendor/output \
	"

for DIR in ${DIRS} ; do
	if [ -d ${DIR} ]; then
		cp -v ${DIR}/*.a ${PWD}
	elif [ -f ${DIR} ]; then
		cp -v ${DIR} ${PWD}
	fi
done

exit 0
