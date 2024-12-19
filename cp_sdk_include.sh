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
	${TOP_SDK}/code/hdal/drivers/k_driver/include	\
	${TOP_SDK}/code/hdal/vendor/ai/drivers/k_driver/include	\
	${TOP_SDK}/code/hdal/vendor/ai2/include	\
	${TOP_SDK}/code/hdal/vendor/ai2/source_pub/include \
	${TOP_SDK}/code/hdal/vendor/ai2/source_pub/vendor_ai_cpu/vendor_ai_cpu_detout.h \
	"

DIRS_SUB=" \
	${TOP_SDK}/code/vos/drivers/include/kwrap \
	${TOP_SDK}/code/hdal/vendor/ai2/include/vendor_ai_cpu \
	${TOP_SDK}/code/hdal/vendor/ai2/include/vendor_ai_dla \
	${TOP_SDK}/code/hdal/vendor/ai2/include/vendor_ai_net \
	"

for DIR in ${DIRS} ; do
	if [ -d ${DIR} ]; then
		cp -v ${DIR}/*.h ${PWD}
	elif [ -f ${DIR} ]; then
		cp -v ${DIR} ${PWD}
	fi
done

for DIR in ${DIRS_SUB} ; do
	if [ -d ${DIR} ]; then
		cp -fr ${DIR} ${PWD}
	fi
done

exit 0
