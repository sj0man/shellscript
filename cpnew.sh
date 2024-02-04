DIR=~/xnpm32/canis/nt9833x/root-fs/rootfs/usr/bin
for var in `find . -type f`; do
	FILE=`basename ${var}`
	if [ ! -f ${DIR}/${FILE} ]; then
		echo cp -avi ${FILE} ${DIR}/${FILE}
	fi
done


exit 1


DIR=~/xnpm32/canis/nt9833x/root-fs/rootfs/usr/lib
for var in `ls`; do
	FILE=`basename ${var}`
	if [ ! -f ${DIR}/${FILE} ]; then
		echo cp -avi ${FILE} ${DIR}/${FILE}
	fi
done


DIR=~/xnpm32/canis/nt9833x/root-fs/rootfs/usr/bin
for var in `find . -type f`; do
	FILE=`basename ${var}`
	if [ ! -f ${DIR}/${FILE} ]; then
		echo cp -avi ${FILE} ${DIR}/${FILE}
	fi
done

