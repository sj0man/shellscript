#
# Description: Copy the include files from the SDK to the current directory.
# Usage: cp_sdk_include.sh [SDK_PATH]
#
if [ $# = 1 ]; then
	TOP_SDK=$1
else
	TOP_SDK=~/tmp/sdk_114
fi

if [ ! -d ${TOP_SDK} ]; then
	echo "Error: ${TOP_SDK} is not a directory."
	exit -1
fi

DIRS="	\
	${TOP_SDK}/code/hdal/drivers/k_driver/include/comm/libfdt.h	\
	${TOP_SDK}/code/hdal/vendor/prebuilt/cv/include/libmd.h	\
	${TOP_SDK}/code/hdal/include	\
	${TOP_SDK}/code/hdal/vendor/cv/include	\
	${TOP_SDK}/code/hdal/vendor/isp/include	\
	${TOP_SDK}/code/hdal/vendor/pcie/include	\
	${TOP_SDK}/code/hdal/vendor/media/include	\
	"

for DIR in ${DIRS} ; do
	if [ -d ${DIR} ]; then
		cp -v ${DIR}/*.h ${PWD}
	elif [ -f ${DIR} ]; then
		cp -v ${DIR} ${PWD}
	fi
done

exit 0
