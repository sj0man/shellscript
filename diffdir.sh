# compare both SDK and Gitlab code
#
DIRS="
	build \
	busybox \
	code \
	configs \
	dvr \
	EP-loader \
	linux-kernel \
	Makefile \
	Makefile-org \
	patch \
	root-fs \
	tools \
	trusted-firmware-a \
	u-boot\
	"
# DIRS=build

if [ $# == 2 ]; then
	ORG_DIR=$1
	SRC_DIR=$2
else
	ORG_DIR=./sdk111_org
	SRC_DIR=./d_inst16
fi


for d in ${DIRS} ; do
	if [ -d ${ORG_DIR}/${d} ] && [ -d ${SRC_DIR}/${d} ] ; then
		echo ==================== ${d}
		diff -rqw ${ORG_DIR}/${d} ${SRC_DIR}/${d} | grep "differ$"
	fi
done

# exit 0

for d in ${DIRS} ; do
	if [ -d ${ORG_DIR}/${d} ] && [ -d ${SRC_DIR}/${d} ] ; then
		echo ==================== ${d}
		diff -rqw ${ORG_DIR}/${d} ${SRC_DIR}/${d} | grep "^Only"
	fi
done
