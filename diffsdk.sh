# compare both SDK and Gitlab code
#
DIRS="
	build \
	busybox \
	code \
	configs \
	EP-loader \
	linux-kernel \
	Makefile \
	patch \
	root-fs \
	tools \
	trusted-firmware-a \
	u-boot\
	"
# DIRS=build

# 서로 다른 디렉토리를 링크하면 쉽게 비교 가능
#
if [ $# == 2 ]; then
	ORG_DIR=$1
	SRC_DIR=$2
else
	ORG_DIR=./sdk_113
	SRC_DIR=./sdk_114
fi


for d in ${DIRS} ; do
	if [ -d ${ORG_DIR}/${d} ] && [ -d ${SRC_DIR}/${d} ] ; then
		echo ==================== ${d} differ
		diff -rqw ${ORG_DIR}/${d} ${SRC_DIR}/${d} | grep -v ".gitignore"
	fi
done

exit 0
