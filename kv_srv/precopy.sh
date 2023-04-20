# vela destination
#
TOP_DIR=./crater-nt98633
MAX_NUM=4

SRCS=(
	"../output/*" \
	"../output/onvif/*" \
	"../aries/sdk/onvifcpplib/nt98336/lib/libonvifcpplib.so" \
	"../crater/nt98633/dvr/dvr.ko" \
)

DESTS=(
	"${TOP_DIR}/gui/" \
	"${TOP_DIR}/onvif/" \
	"${TOP_DIR}/onvif/" \
	"${TOP_DIR}/system/" \
)

idx=0
while [ ${idx} -lt ${MAX_NUM} ] ; do
	for src in ${SRCS[${idx}]} ; do
		if [ -f ${src} ] ; then
			cp -vf ${src} ${DESTS[${idx}]}
		fi
	done
	idx=$(( ${idx}+1 ))
done

exit 0
