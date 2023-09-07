SRCDIR=/home/ubuntu/nt9832x/crater/nt98633/output/preburn_images
TRGDIR=./crater-nt98633/system

SRCFILE=(\
	"nvt-all.bin" \
	"u-boot.bin" \
	"Image.bin" \
	)

TRGFILE=(\
	"nvt-inst16.bin" \
	"u-boot-crater-nt98633.bin" \
	"Image-crater-nt98633.bin" \
	)

for ((i=0; i<${#SRCFILE[@]}; i++)) ; do
	if [ -f ${SRCDIR}/${SRCFILE[i]} ] ; then
		echo cp -v ${SRCDIR}/${SRCFILE[i]} ${TRGDIR}/${TRGFILE[i]}
	else
		echo ${SRCDIR}/${SRCFILE[i]} "not exist"
	fi
done
